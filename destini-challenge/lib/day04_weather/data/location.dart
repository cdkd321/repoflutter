
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  late double _latitude;
  late double _longitude;
  StreamSubscription<Position>? positionStream;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      Position? position = await Geolocator.getLastKnownPosition();
      positionStream = await Geolocator.getPositionStream().listen((event) {
        print(event);
        positionStream?.pause();
      });
      if (position !=null) {
        _latitude = position.latitude;
        _longitude = position.longitude;
      } else {
        _latitude = 0;
        _longitude = 0;
      }
      positionStream?.cancel();
    } catch (e) {
      print(e);
      _latitude = 0;
      _longitude = 0;
    }
  }

  double getLat() {
    return _latitude;
  }

  double getLon() {
    return _longitude;
  }
}