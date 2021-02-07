import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/view_models/product_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProductAdd extends StatefulWidget {
  @override
  _ProductAddState createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final TextEditingController _productNameController =
        TextEditingController();
    final TextEditingController _productQtyController = TextEditingController();
    final TextEditingController _productPriceController =
        TextEditingController();
    var model = getIt<ProductModel>();
    return ChangeNotifierProvider(
      create: (BuildContext context) => model,
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Ürün Ekle")),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text("Ürün ismi"),
                      TextField(
                        controller: _productNameController,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text("Ürün fiyatı"),
                      TextField(
                        controller: _productPriceController,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Text("Ürün resmi"),
                          IconButton(
                              icon: Icon(Icons.photo),
                              onPressed: () async =>
                                  await model.uploadMedia(ImageSource.gallery))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Consumer<ProductModel>(
                        builder: (BuildContext context, ProductModel value,
                            Widget child) {
                          return model.mediaUrl.isEmpty
                              ? Container(
                                  height: size.height * 0.3,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                )
                              : Container(
                                  height: size.height * 0.3,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                  child: Image.network(model.mediaUrl),
                                );
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height*0.79),
                    child: InkWell(
                      onTap: () async {
                        if (_productNameController.text.isNotEmpty &&
                            _productPriceController.text.isNotEmpty &&
                            model.mediaUrl.isNotEmpty) {
                          await model.addProduct({
                            'PRODUCT_NAME': _productNameController.text,
                            'TIME_STAMP': DateTime.now(),
                            'PRODUCT_PRICE': _productPriceController.text,
                            'PRODUCT_IMAGE': model.mediaUrl
                          });
                          Fluttertoast.showToast(
                              msg: "Ürün eklendi!",
                              timeInSecForIosWeb: 2,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.grey[600],
                              textColor: Colors.white,
                              fontSize: 14);
                          Navigator.pop(context);
                        } else {
                          Fluttertoast.showToast(
                              msg: "Boşluk bırakmayın!",
                              timeInSecForIosWeb: 2,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.grey[600],
                              textColor: Colors.white,
                              fontSize: 14);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                              child: Text(
                                "Kaydet",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
