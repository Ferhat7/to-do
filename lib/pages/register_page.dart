import 'package:flutter/material.dart';
import 'package:to_do/pages/login_page.dart';
import 'package:to_do/services/auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();
  final ButtonStyle textButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.purple,
    minimumSize: const Size(500, 30),
    padding: const EdgeInsets.all(20),
  );

  final AuthService _authService = AuthService();
  final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Container(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/img/login.jpg'),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    "REGİSTER",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (_nameController) {
                        if (_nameController!.isEmpty) {
                          return "Please enter name ";
                        } else if (!RegExp(
                                r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                            .hasMatch(_nameController)) {
                          return "Enter valid name";
                        } else {
                          return null;
                        }
                      }),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.alternate_email),
                      ),
                      validator: (_emailController) {
                        if (_emailController!.isEmpty) {
                          return "Please enter e-mail";
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(_emailController)) {
                          return "Please enter valid e-mail";
                        } else {
                          return null;
                        }
                      }),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock)),
                      validator: (_passwordController) {
                        if (_passwordController!.isEmpty) {
                          return "Please enter password";
                        } else if (!RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                            .hasMatch(_passwordController)) {
                          return "Password should be at least 8 characters, at least one letter and one number";
                        } else {
                          return null;
                        }
                      }),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                      controller: _passwordAgainController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password confirmation',
                          prefixIcon: Icon(Icons.lock)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter password";
                        } else {
                          if(_passwordController.text !=value){
                            return" Passwords are not match";
                          }
                          return null;
                        }
                      }),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin:  EdgeInsets.all(10),
                  child: ElevatedButton(
                      child:  Text('Register'),
                      onPressed: () {

                    if (formKey.currentState!.validate()) {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));    
                      AuthService().createPerson(_nameController.text, _emailController.text, _passwordController.text).then((value) {


                    }  );

                      }} )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
