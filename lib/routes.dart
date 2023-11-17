
//import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:weatherapp/widgets/map.dart';
import 'package:weatherapp/widgets/map_sample.dart';

Map<String, WidgetBuilder> getRoutes(){
  return <String, WidgetBuilder>{
    '/mapa': (BuildContext context) => MapSample()
  };
}