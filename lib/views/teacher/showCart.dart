import 'package:flutter/material.dart';
import 'package:flutterio/globals.dart';

class ShowCart extends StatefulWidget {
  @override
  _ShowCartState createState() => _ShowCartState();
}

class _ShowCartState extends State<ShowCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepet"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index){
          return ListTile(title: Text(cart[index]["NAME"],),
          trailing: IconButton(icon: Icon(Icons.delete, color: Colors.redAccent,),
              onPressed: (){
            print("Sile basıldı : $index");
            cart.removeAt(index);
            if(cart.isEmpty)
              Navigator.pop(context);
            setState(() {

            });
          }),);
        },
        separatorBuilder: (_, __) => Divider(height: 0.5),
        itemCount: cart.length,)
    );
  }
}
