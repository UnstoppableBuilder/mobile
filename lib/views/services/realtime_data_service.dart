import 'package:flutter/material.dart';

class DataSet {
  List<double> y;

  double slidervalue;
  RangeValues continuousValues = const RangeValues(25, 75);

  DataSet(this.y, this.slidervalue, this.continuousValues);
}

abstract class RealtimeDataService {
  Stream<DataSet> dataStream;
  void closeDataStream();
  void setFrequency(double value);
  void setValueRange(RangeValues range);
  void start();
  void stop();
  void add(List<double> values);
  bool isRunning;
}
