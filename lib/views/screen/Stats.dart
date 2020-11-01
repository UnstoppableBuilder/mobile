import 'package:noise_meter/noise_meter.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sensors/sensors.dart';
import 'package:location/location.dart';
import 'package:ub/views/screen/realtime_chart.dart';
import 'package:ub/views/services/realtime_data_service.dart';
import 'package:ub/views/services/service_locator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/* 
HOW-TO
Google Maps
https://levelup.gitconnected.com/how-to-add-google-maps-in-a-flutter-app-and-get-the-current-location-of-the-user-dynamically-2172f0be53f6


*/

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => new _StatsState();
}

class _StatsState extends State<Stats> {
  bool _isRecording = true;
  StreamSubscription<NoiseReading> _noiseSubscription;
  NoiseMeter _noiseMeter = new NoiseMeter();
  Location _location = new Location();
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;

  /* sensors part */
  List<double> _accelerometerValues;
  List<double> _userAccelerometerValues;
  List<double> _gyroscopeValues;
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  String _noiseInfo;
  double _noiseValue;
  double _noiseMax;
  LocationData _currentLocation;

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
    _streamSubscriptions.add(_noiseMeter.noiseStream.listen(onData));

    _getLocation().then((_) {
      _streamSubscriptions.add(
          _location.onLocationChanged.listen((LocationData currentLocation) {
        setState(() {
          _currentLocation = currentLocation;
        });
      }));
    });
  }

  RealtimeDataService _dataService = locator<RealtimeDataService>();

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

  @override
  void dispose() {
    super.dispose();
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }

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

    _dataService.add([
      _noiseValue ?? 0,
      _noiseMax ?? 0,
      0.0 ?? 0,
      _accValue ?? 0,
      _userAccValue ?? 0,
      100 * _gyrValue ?? 0
    ].toList());

    return Scaffold(
        appBar: AppBar(
            title: Text("Статистика"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context))),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: _initialcameraposition),
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
              )),
          if (_currentLocation != null)
            Text(
                "GPS long:${_currentLocation.longitude}\nlat:${_currentLocation.latitude}\nalt:${_currentLocation.altitude}\nacc:${_currentLocation.accuracy}"),
          SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Container(height: 150, child: RealtimeChart()),
          ),
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
        ])));
  }

  Future<LocationData> _getLocation() async {
    try {
      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      _permissionGranted = await _location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await _location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return null;
        }
      }

      _serviceEnabled = await _location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await _location.requestService();
        if (!_serviceEnabled) {
          return null;
        }
      }

      _locationData = await _location.getLocation();
      return _locationData;
    } catch (e) {
      print(e);
    }
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
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
