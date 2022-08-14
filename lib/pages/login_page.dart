import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/pages/home_page.dart';
import 'package:to_do/pages/register_page.dart';
import 'package:to_do/services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
   final TextEditingController _emailController=TextEditingController();
   final TextEditingController _passwordController=TextEditingController();

  final ButtonStyle textButtonStyle=ElevatedButton.styleFrom(
    primary: Colors.purple,
    maximumSize:Size(500,20),
    padding: EdgeInsets.all(20),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Form(
        key:formKey,
        child: Container(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/img/login.jpg'),
              Container(
                margin: EdgeInsets.all(10),
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child:TextFormField(
        controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.alternate_email,)
                  ),
                  validator: (_emailController) {

    if (_emailController!.isEmpty) {
    return "Please enter E-mail hatalı giris";
    }
    else if (!RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController)) {
      return "Please enter valid e-mail";
    }


    else {
    return null;
    }


    }
                  ),

              ),


              Container(
                margin: EdgeInsets.all(10),
                child:  TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock,),

    ),
                  validator: (_passwordController){
                    if(_passwordController!.isEmpty){
                      return "Please enter Password";
                    }
    else if (!RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
        .hasMatch(_passwordController)) {
                      return "Password should be at least 8 characters, at least one letter and one number";
                    }
                    else{
                      return null;
                    }
                  }
                ),

              ),
              Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {

    if (formKey.currentState!.validate()) {

        AuthService().signIn(_emailController.text,
    _passwordController.text)
        .then((value) {

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));

    }); }}
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Do not have an account yet?"),
                    TextButton(
                      child: const Text('Register'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
