import 'package:storeapp/helpers/api.dart';
import 'package:storeapp/models/product_model/product_model.dart';

class GetAllProducts {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> productList = [];
    for (var element in data) {
      productList.add(ProductModel.fromJson(element));
    }
    return productList;
  }
}
