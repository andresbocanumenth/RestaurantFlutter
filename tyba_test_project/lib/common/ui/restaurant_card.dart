import 'package:flutter/material.dart';
import 'package:tyba_test_project/models/restaurant_model.dart';

import '../tyba_text_styles.dart';
import 'image_loader.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantModel model;

  RestaurantCard({this.model});

  @override
  Widget build(BuildContext context) {
    const String _coverDefaultURL =
        "https://redthread.uoregon.edu/files/original/affd16fd5264cab9197da4cd1a996f820e601ee4.png";
    double width = MediaQuery.of(context).size.width;
    debugPrint("model ${model.name} &&& ${model.imageUrl}");
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: ImageLoader(
                width: width,
                imageURL: model.imageUrl == null ? _coverDefaultURL : model.imageUrl,
                placeholder: NetworkImage(_coverDefaultURL),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                if (model.name != null && model.name.isNotEmpty) ...{
                  Text(model.name,
                      style: TybaTextStyles.BlackMediumBoldTextStyle),
                },
                if (model.address != null && model.address.isNotEmpty) ...{
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      Expanded(
                          child: Text(model.address,
                              maxLines: 1,
                              style: TybaTextStyles.GrayBodyNormalTextStyle)),
                    ],
                  ),
                },
                if (model.phone != null && model.phone.isNotEmpty) ...{
                  Row(
                    children: [
                      Icon(Icons.phone),
                      Expanded(
                          child: Text(model.phone,
                              maxLines: 1,
                              style: TybaTextStyles.GrayBodyNormalTextStyle)),
                    ],
                  ),
                },
                if (model.priceRate != null && model.priceRate.isNotEmpty) ...{
                  Row(
                    children: [
                      Icon(Icons.monetization_on),
                      Expanded(
                          child: Text(model.priceRate,
                              maxLines: 1,
                              style: TybaTextStyles.GrayBodyNormalTextStyle)),
                    ],
                  ),
                },
              ],
            )
          ],
        ),
      ),
    );
  }
}
