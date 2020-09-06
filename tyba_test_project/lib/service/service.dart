import 'package:flutter/material.dart';

abstract class Service {
  Future<dynamic> read(String endpoint, {dynamic condition, dynamic params});
}
