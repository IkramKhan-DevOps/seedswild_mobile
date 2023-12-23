import 'package:flutter/foundation.dart';

class AppException implements Exception {
  /// Core exceptions class

  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    debugPrint("$_prefix$_message");
    return "$_prefix$_message";
  }

}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "Error During Message");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid Request");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]) : super(message, "Unauthorized Request");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Inputs");
}
