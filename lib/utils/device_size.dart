import 'package:flutter/material.dart';

class DeviceSize {
  StatefulElement context;
  AppBar appBar;

  DeviceSize({this.context, this.appBar});

  double getDeviceHeight () {
    return MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;
  }

  double getDeviceWidth () {
    return MediaQuery.of(context).size.width;
  }
}