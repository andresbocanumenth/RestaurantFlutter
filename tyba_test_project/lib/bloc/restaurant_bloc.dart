import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:tyba_test_project/bloc/restaurant_event.dart';
import 'package:tyba_test_project/bloc/restaurant_state.dart';
import 'package:tyba_test_project/models/restaurant_model.dart';
import 'package:tyba_test_project/models/restaurant_request_model.dart';
import 'package:tyba_test_project/service/api_service.dart';
import 'package:tyba_test_project/service/service.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  @override
  RestaurantState get initialState => InitialRestaurantState();
  final Service _service = ApiService();


  @override
  Stream<RestaurantState> mapEventToState(RestaurantEvent event) async* {
    switch (event.runtimeType) {
      case RestaurantEventRead:
        yield RestaurantStateRetrieving();

        final RestaurantEventRead restaurantEventRead = event;
        RestaurantRequestModel restaurantRequestModel =
            restaurantEventRead.requestModel;

        try {
          Map<String, dynamic> value = await _service.read("/list-by-latlng",
              params: restaurantRequestModel.marshal());

          List<RestaurantModel> list = (value["data"] as List)
              .map((e) => RestaurantModel.fromMarshal(e))
              .toList();
          list.removeWhere((value) => value == null);
          yield RestaurantStateRetrieved(restaurantList: list);
        } on ServiceError catch (error) {
          yield RestaurantStateFailed(message: error.message);
        }
        break;
    }
  }

  void loadRestaurants({Position position}) {
    RestaurantRequestModel requestModel = RestaurantRequestModel(latitude: position.latitude, longitude: position.longitude);
    add(RestaurantEventRead(requestModel: requestModel));
  }
}
