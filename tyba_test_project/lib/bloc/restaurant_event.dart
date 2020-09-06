import 'package:flutter/material.dart';
import 'package:tyba_test_project/models/restaurant_request_model.dart';

abstract class RestaurantEvent {
  const RestaurantEvent();
}

class RestaurantEventRead extends RestaurantEvent {
  RestaurantRequestModel requestModel;

  RestaurantEventRead({@required this.requestModel});
}
