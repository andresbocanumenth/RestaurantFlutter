
import 'package:flutter/material.dart';
import 'package:tyba_test_project/models/restaurant_model.dart';

abstract class RestaurantState {
  const RestaurantState();
}

class InitialRestaurantState extends RestaurantState {
  const InitialRestaurantState();
}

class RestaurantStateRetrieving extends RestaurantState {
  const RestaurantStateRetrieving();
}

class RestaurantStateRetrieved extends RestaurantState {
  final List<RestaurantModel> restaurantList;

  RestaurantStateRetrieved({this.restaurantList})
      : assert(restaurantList != null);
}

class RestaurantStateFailed extends RestaurantState {
  final String message;

  const RestaurantStateFailed({@required this.message})
      : assert(message != null);
}

