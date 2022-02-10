import 'package:flutter/foundation.dart';

@immutable 
abstract class InternetState{}

class InternetLoadingState extends InternetState { }

class InternetConnected extends InternetState { }

class InternetDisconnected extends InternetState {}