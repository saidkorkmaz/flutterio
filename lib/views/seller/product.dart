import 'package:flutter/material.dart';

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
    return Scaffold(
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
                Container(
                  height: size.height*0.3,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                InkWell(
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
    );
  }
}
