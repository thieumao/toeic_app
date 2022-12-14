import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:toeic_app/store/counter_reducer.dart';
import 'flutter_redux_app.dart';

void main() {
  // Create your store as a final variable in the main function or inside a
  // State object. This works better with Hot Reload than creating it directly
  // in the `build` function.
  final store = Store<int>(counterReducer, initialState: 0);

  runApp(FlutterReduxApp(
    title: 'TOEIC App',
    store: store,
  ));
}
