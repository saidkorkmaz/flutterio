import 'package:flutter/material.dart';
import 'package:flutterio/core/locator.dart';
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
                  padding: EdgeInsets.all(8),
                  child: model.busy
                      ? Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.5,
                              ),
                              TextField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.mail,
                                      color: Colors.red,
                                    ),
                                    hintText: 'Mail adresi',
                                    prefixText: ' ',
                                  )),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              TextField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.vpn_key,
                                      color: Colors.red,
                                    ),
                                    hintText: 'Parola',
                                    prefixText: ' ',
                                  )),
                              SizedBox(
                                height: size.height * 0.04,
                              ),
                              InkWell(
                                onTap: () async => await model.signIn(
                                    _emailController.text,
                                    _passwordController.text),

                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                        child: Text(
                                      "Giriş yap",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                              )
                            ],
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
