import 'package:dio/dio.dart';
import 'package:tyba_test_project/service/service.dart';

class ApiService implements Service {
  final Dio _client = Dio();

  ApiService() {
    final BaseOptions options = BaseOptions(
      baseUrl: "https://tripadvisor1.p.rapidapi.com/restaurants",
      connectTimeout: 60000,
      receiveTimeout: 60000,
      contentType: "application/json",
    );
    _client.options = options;
    _client.options.headers.addAll({
      "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
      "x-rapidapi-key": "26a56d31ebmshdaedbc0aa87b01ap11a6cbjsn99eaa575ca0d",
      "useQueryString": "true"
    });
  }

  @override
  Future<dynamic> read(String endpoint,
      {dynamic condition, dynamic params}) async {
    _client.options.contentType = "application/json";

    try {
      final Response response = await _client
          .get("$endpoint/${condition ?? ""}", queryParameters: params);

      return Future.value(response.data);
    } on DioError catch (e) {
      return Future.error(_buildServiceError(e));
    } catch (error) {}
  }

  ServiceError _buildServiceError(DioError e) {
    if (e.response.data is Map && e.response.data["error"] != null) {
      return ServiceError(e.response.data["error"]);
    } else {
      return ServiceError("DEFAULT_ERROR");
    }
  }
}

class ServiceError {
  String message;

  ServiceError(this.message);
}
