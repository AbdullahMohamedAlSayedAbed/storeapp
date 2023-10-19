import 'package:storeapp/helpers/api.dart';
import 'package:storeapp/models/product_model/product_model.dart';

class UpdateProduct {
   Future<ProductModel> updateProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required int id,
      required String category}) async {
    Map<String, dynamic> data =
        await Api().post(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });
    return ProductModel.fromJson(data);
  }
}