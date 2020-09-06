import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tyba_test_project/bloc/restaurant_bloc.dart';
import 'package:tyba_test_project/bloc/restaurant_state.dart';
import 'package:tyba_test_project/common/Routes/routes.dart';
import 'package:tyba_test_project/common/tyba_text_styles.dart';
import 'package:tyba_test_project/common/ui/restaurant_card.dart';
import 'package:tyba_test_project/models/restaurant_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RestaurantBloc _restaurantBloc;
  List<RestaurantModel> _restaurantList = [];

  @override
  void initState() {
    super.initState();
    requestPermission().then((value) => {_getCurrentLocation()});
    _restaurantBloc = RestaurantBloc();

    _restaurantBloc.listen((state) {
      if (state is RestaurantStateRetrieving) {
        EasyLoading.show(status: "Retrieving Restaurants");
      } else if (state is RestaurantStateRetrieved) {
        EasyLoading.dismiss();
        setState(() {
          _restaurantList = state.restaurantList;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Restaurant List"),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Routes.root);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Near you:",
                  style: TybaTextStyles.BlackMediumBoldTextStyle),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _restaurantList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RestaurantCard(
                      model: _restaurantList[index]
                    );
                  }),
            )
          ],
        ));
  }

  _getCurrentLocation() async {
    LocationPermission permission = await checkPermission();
    bool isLocationEnabled = await isLocationServiceEnabled();

    if (permission != LocationPermission.denied ||
        permission != LocationPermission.deniedForever && isLocationEnabled) {
      getCurrentPosition(desiredAccuracy: LocationAccuracy.medium)
          .then((position) {
        setState(() {
          _restaurantBloc.loadRestaurants(position: position);
        });
      }).catchError((e) {
        print(e);
      });
    }
  }
}
