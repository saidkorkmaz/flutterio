import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/view_models/product_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final TextEditingController _productNameController = TextEditingController();
    final TextEditingController _productQtyController = TextEditingController();
    final TextEditingController _productPriceController = TextEditingController();
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
              child: Column(
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
                  Text("Ürün adedi"),
                  TextField(
                    controller: _productQtyController,
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
                  Text("Ürün resmi"),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Consumer<ProductModel>(
                    builder: (BuildContext context, ProductModel value,
                        Widget child) {
                      return model.mediaUrl.isEmpty
                          ?  Container(
                        height: size.height*0.3,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      )
                          : Container(
                        height: size.height*0.3,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Image.network(model.mediaUrl),
                      );
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  InkWell(
                    onTap: () async {
                      if(model.mediaUrl.isNotEmpty){
                        await model.uploadMedia(ImageSource.gallery);
                      }
                      else{
                        Fluttertoast.showToast(
                            msg: "Resim ekleyin!",
                            timeInSecForIosWeb: 2,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.grey[600],
                            textColor: Colors.white,
                            fontSize: 14);
                      }
                      if(_productNameController.text.isNotEmpty && _productQtyController.text.isNotEmpty && _productPriceController.text.isNotEmpty)
                        {
                          await model.addProduct({
                            'PRODUCT_NAME': _productNameController.text,
                            'PRODUCT_QTY': _productQtyController.text,
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
                          borderRadius: BorderRadius.all(
                              Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                            child: Text(
                              "Kaydet",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
