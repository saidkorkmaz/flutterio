import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/globals.dart';
import 'package:flutterio/view_models/requirement_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowCart extends StatefulWidget {
  @override
  _ShowCartState createState() => _ShowCartState();
}

class _ShowCartState extends State<ShowCart> {
  var model = getIt<RequirementModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepet"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(cart[index].name,),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(cart[index].price.toString() + " ₺",style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      IconButton(icon: Icon(Icons.delete, color: Colors.redAccent,),
                          onPressed: (){
                        print("Sile basıldı : $index");
                        cart.removeAt(index);
                        if(cart.isEmpty)
                          Navigator.pop(context);
                        setState(() {

                        });
                      }),
                    ],
                  ),);
                },
                separatorBuilder: (_, __) => Divider(height: 0.5),
                itemCount: cart.length,),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.only(top: 20, bottom: 20, left: 15,right: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total",style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(model.calculateTotalPrice(cart).toString() + " ₺",style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              )
            ],
          ),
          RaisedButton(
            color: Colors.green,
            child: Text("Onayla",style: TextStyle(color: Colors.white),),
              onPressed: (){
                print("Onayla butonuna basıldı. Öğretmen okulu : ${currentTeacher.school}");
                model.addRequirement(cart, currentTeacher.school, currentTeacher.name);
                cart = null;
                Fluttertoast.showToast(
                    msg: "İhtiyaç listeniz gönüllülerle paylaşılmak üzere kaydedildi",
                    timeInSecForIosWeb: 2,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 14);
                Navigator.pop(context);
              })
        ],
      )
    );
  }
}
