import 'package:storeapp/helpers/api.dart';
import 'package:storeapp/models/product_model/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
      List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');
      List<ProductModel> productList = [];
      for (var element in data) {
        productList.add(ProductModel.fromJson(element));
      }
      return productList;
    }
  }

