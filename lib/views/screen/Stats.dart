import 'package:noise_meter/noise_meter.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sensors/sensors.dart';
import 'package:location/location.dart';
import 'package:ub/views/screen/realtime_chart.dart';
import 'package:ub/views/services/realtime_data_service.dart';
import 'package:ub/views/services/service_locator.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => new _StatsState();
}

class _StatsState extends State<Stats> {
  bool _isRecording = false;
  StreamSubscription<NoiseReading> _noiseSubscription;
  NoiseMeter _noiseMeter = new NoiseMeter();
  Location _location = new Location();

  /* sensors part */
  List<double> _accelerometerValues;
  List<double> _userAccelerometerValues;
  List<double> _gyroscopeValues;
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  String _noiseInfo;
  double _noiseValue;
  double _noiseMax;

  DataList _acceleratorData = DataList();
  DataList _userAcceleratorData = DataList();
  DataList _gyroscopeData = DataList();
  DataList _gpsData = DataList();
  DataList _noiseData = DataList();
  DataList _noiseMaxData = DataList();

  @override
  void initState() {
    super.initState();
    _streamSubscriptions
        .add(accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = <double>[event.x, event.y, event.z];
      });
    }));
    _streamSubscriptions.add(gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
      });
    }));
    _streamSubscriptions
        .add(userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        _userAccelerometerValues = <double>[event.x, event.y, event.z];
      });
    }));
    _location.onLocationChanged.listen((LocationData currentLocation) {
      // Use current location
    });
  }

  RealtimeDataService _dataService = locator<RealtimeDataService>();

  void _togglePulsar() {
    if (_dataService.isRunning) {
      _dataService.stop();
    } else {
      _dataService.start();
    }
    setState(() {});
  }

  void onData(NoiseReading noiseReading) {
    this.setState(() {
      this._noiseInfo = noiseReading.toString();
      this._noiseMax = noiseReading.maxDecibel;
      this._noiseValue = noiseReading.meanDecibel;
      if (!this._isRecording) {
        this._isRecording = true;
      }
    });
    //print(noiseReading.toString());
  }

  void start() async {
    try {
      _noiseSubscription = _noiseMeter.noiseStream.listen(onData);
    } catch (err) {
      print(err);
    }
  }

  @override
  void dispose() {
    super.dispose();
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }

  void stop() async {
    try {
      if (_noiseSubscription != null) {
        _noiseSubscription.cancel();
        _noiseSubscription = null;
      }
      this.setState(() {
        this._isRecording = false;
      });
    } catch (err) {
      print('stopRecorder error: $err');
    }
  }

  List<Widget> getContent() => <Widget>[
        Container(
            margin: EdgeInsets.all(25),
            child: Column(children: [
              Container(
                child: Text(_isRecording ? "Mic: ON" : "Mic: OFF",
                    style: TextStyle(fontSize: 25, color: Colors.blue)),
                margin: EdgeInsets.only(top: 20),
              )
            ])),
      ];

  @override
  Widget build(BuildContext context) {
    double _accValue = 0;
    double _userAccValue = 0;
    double _gyrValue = 0;

    final List<String> accelerometer = _accelerometerValues?.map((double v) {
      _accValue += v;
      return v.toStringAsFixed(1);
    })?.toList();
    final List<String> userAccelerometer =
        _userAccelerometerValues?.map((double v) {
      _userAccValue += v;
      return v.toStringAsFixed(1);
    })?.toList();
    final List<String> gyroscope = _gyroscopeValues?.map((double v) {
      _gyrValue += v;
      return v.toStringAsFixed(1);
    })?.toList();

    _noiseData.add((_noiseValue ?? 0) / 25);
    _noiseMaxData.add((_noiseMax ?? 0) / 25);
    _gpsData.add(0 ?? 0);
    _acceleratorData.add(_accValue ?? 0);
    _userAcceleratorData.add(_userAccValue ?? 0);
    _gyroscopeData.add(100 * _gyrValue ?? 0);

    _dataService.add([
      _noiseValue ?? 0,
      _noiseMax ?? 0,
      0.0 ?? 0,
      _accValue ?? 0,
      _userAccValue ?? 0,
      100 * _gyrValue ?? 0
    ].toList());

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ...getContent(),
          Padding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Noise: $_noiseInfo'),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
          ),
          Padding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Accelerometer: $accelerometer'),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
          ),
          Padding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('UserAccelerometer: $userAccelerometer'),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
          ),
          Padding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Gyroscope: $gyroscope'),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Container(height: 150, child: RealtimeChart()),
          ),
          FloatingActionButton(
              backgroundColor: _isRecording ? Colors.red : Colors.green,
              onPressed: _isRecording ? stop : start,
              child: _isRecording ? Icon(Icons.stop) : Icon(Icons.mic)),
        ])));
  }

  Future<LocationData> _getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await _location.getLocation();
    return _locationData;
  }
}

class TimeSeriesSimple {
  final DateTime time;
  final double value;

  TimeSeriesSimple({this.time, this.value});
}

class DataList {
  List<TimeSeriesSimple> _list = List.generate(
      10,
      (index) => TimeSeriesSimple(
          time: DateTime.now()
              .add(Duration(milliseconds: (-index * 1000.0 / 60.0).toInt())),
          value: 0.0));

  List<TimeSeriesSimple> get list =>
      _list.sublist(_list.length - 10, _list.length - 1);

  void add(double value) {
    _list.add(TimeSeriesSimple(time: DateTime.now(), value: value));
    _list.removeAt(0);
  }
}
