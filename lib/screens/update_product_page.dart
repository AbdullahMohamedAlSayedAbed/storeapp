import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/models/product_model/product_model.dart';
import 'package:storeapp/screens/home_page.dart';
import 'package:storeapp/services/update_product.dart';
import 'package:storeapp/widgets/text_from_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 35,
              )),
          title: const Text(
            'update product',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 100,
              ),
              CustomTextField(
                  onChanged: (value) {
                    productName = value;
                  },
                  hintText: 'product name'),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                  onChanged: (value) {
                    desc = value;
                  },
                  hintText: 'description'),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    price = value;
                  },
                  hintText: 'price'),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                  onChanged: (value) {
                    image = value;
                  },
                  hintText: 'image'),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await updateproduct(product, context);
                        Navigator.pushReplacementNamed(context, HomePage.id);
                        const SnackBar(content: Text("success"));
                      } catch (e) {
                        print(e.toString());
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: const Text("Update Product")),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> updateproduct(ProductModel product, BuildContext context) async {
    await UpdateProduct().updateProduct(
        title: productName ?? product.title,
        price: price ?? product.price.toString(),
        desc: desc ?? product.description,
        image: image ?? product.image,
        category: product.category,
        id: product.id ?? 0);
  }
}
