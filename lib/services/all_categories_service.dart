
import 'package:storeapp/helpers/api.dart';

class AllCategories {
  Future<List<dynamic>> getAllCateogries() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
