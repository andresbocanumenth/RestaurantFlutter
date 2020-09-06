class RestaurantRequestModel {
  int limit = 30;
  String currency = "USD";
  int distance = 2;
  String lunit = "km";
  String lang = "en_US";
  double latitude;
  double longitude;

  marshal() => {
        "limit": limit,
        "currency": currency,
        "distance": distance,
        "lunit": lunit,
        "lang": lang,
        "latitude": latitude,
        "longitude": longitude
      };

  RestaurantRequestModel(
      {this.limit,
      this.currency,
      this.distance,
      this.lunit,
      this.lang,
      this.latitude,
      this.longitude});
}
