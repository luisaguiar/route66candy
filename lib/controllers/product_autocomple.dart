import 'dart:async';
import 'package:route66candy/models/product/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BackendService {
  // static Map<String, String> get headers => {
  //       "Content-Type": "application/json",
  //       "Accept": "application/json",
  //       "User-Agent": "PostmanRuntime/7.29.2"
  //     };

  static Future<List<Map<String, String>>> getProducts() async {
    // if (query.isEmpty && query.length < 3) {
    //   print('Query needs to be at least 3 chars');
    //   return Future.value([]);
    // }
    var url = Uri.http('localhost', '/api/products', {});

    var response = await http.get(url);

    List<Product> products = [];

    if (response.statusCode == 200) {
      Iterable json = convert.jsonDecode(response.body);
      products =
          List<Product>.from(json.map((model) => Product.fromJson(model)));

      print('Number of Products: ${products.length}.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return Future.value(
        products.map((e) => {'name': e.name, 'id': e.id.toString()}).toList());
  }
}
