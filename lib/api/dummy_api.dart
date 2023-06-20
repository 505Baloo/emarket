import 'package:emarket/api/config.dart';
import 'package:emarket/models/product.dart';
import 'package:dio/dio.dart';

class ApiRequests {
  final dio = Dio();

  Future<List<Product>> getProducts() async {
    try {
      var finalUrl =
          Uri.parse(APIEndpoints.baseUrl + APIEndpoints.productsEndpoint);
      var response = await dio.get(finalUrl.toString());
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data["products"] as List<dynamic>;
        List<Product> products = responseData
            .map((data) => Product.fromJson(data as Map<String, dynamic>))
            .toList();
        return products;
      }
    } catch (e) {
      // print(e.toString());
    }
    return [];
  }
}
