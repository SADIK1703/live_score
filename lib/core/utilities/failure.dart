import 'dart:developer';
import 'package:flutter/foundation.dart';

abstract class Failure extends Error {
  Failure(this.errorMessage);

  final String errorMessage;

  @mustCallSuper
  void show() {
    log(errorMessage, name: 'Failure');
  }
}
