import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
import 'package:flutterio/globals.dart';
import 'package:flutterio/view_models/login_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (BuildContext context) => getIt<LoginModel>(),
      child: Consumer<LoginModel>(
        builder: (BuildContext context, LoginModel model, Widget child) =>
            Scaffold(

          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height:size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [colorPrimary, colorSecondary])
                  ),

                ),
                Container(
                  height:size.height,
                  width: size.width,

                  padding: EdgeInsets.all(8),
                  child: model.busy
                      ? Center(child: CircularProgressIndicator())
                      : Center(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(

                              height:size.height*.5,
                              width: size.width*.85,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.25),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                //boxShadow: [BoxShadow(color:Colors.grey.withOpacity(.75), blurRadius: 10, spreadRadius: 2)]

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [


                                      TextField(
                                          controller: _emailController,
                                          style: TextStyle(color: Colors.white, fontFamily: "Quicksand-SemiBold"),
                                          cursorColor: colorLight,
                                          keyboardType: TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.mail,
                                              color: colorPrimaryShade,
                                            ),
                                            hintText: 'E-Mail',
                                            prefixText: ' ',
                                            hintStyle: TextStyle(color: Colors.white, fontFamily: "Quicksand-Light"),
                                            focusColor: colorLightTint,
                                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorLightTint)),
                                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorSecondaryShade)),

                                          )),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      TextField(
                                          style: TextStyle(color: Colors.white, fontFamily: "Quicksand-SemiBold"),
                                          cursorColor: colorLight,
                                          controller: _passwordController,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.vpn_key,
                                              color: colorPrimaryShade,
                                            ),
                                            hintText: 'Parola',
                                            prefixText: ' ',


                                              hintStyle: TextStyle(color: Colors.white, fontFamily: "Quicksand-Light"),
                                            focusColor: colorLightTint,
                                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorLightTint)),
                                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorSecondaryShade)),
                                          )),
                                      SizedBox(
                                        height: size.height * 0.08,
                                      ),
                                      InkWell(
                                        onTap: () async => await model.signIn(
                                            _emailController.text,
                                            _passwordController.text),

                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 5),
                                          decoration: BoxDecoration(
                                            border: Border.all(color:Colors.white,width: 2),
                                              //color: colorPrimaryShade,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Center(
                                                child: Text(
                                              "Giriş yap",
                                              style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Quicksand-SemiBold"),
                                            )),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
