import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_health_app/screens/sign_up_screen.dart';
import 'package:flutter_health_app/widgets/navbar_roots.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool passToggle = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    "assets/images/doctors.png",
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Pssword';
                      }
                      return null;
                    },
                    obscureText: passToggle ? true : false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Enter Password"),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          if (passToggle == true) {
                            passToggle = false;
                          } else {
                            passToggle = true;
                          }
                          setState(() {});
                        },
                        child: passToggle
                            ? Icon(CupertinoIcons.eye_slash_fill)
                            : Icon(CupertinoIcons.eye_fill),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: InkWell(
                    onTap: () async{
                      final email=emailController.text.toString();
                      final pas=passwordController.text.toString();

                     
                    
                      if (_formKey.currentState!.validate()) {
                       auth
                            .signInWithEmailAndPassword(
                                email: email,
                                password: pas)
                            .then((auth)async {
                      QuerySnapshot<Map<String, dynamic>> pasword= await FirebaseFirestore.instance.collection('users').where('email',isEqualTo:auth.user!.email ).get();


                              if (auth!=null) {
                                
                              }
                          var uid = auth.user?.uid;
                          SharedPreferences.getInstance().then((value) {
                          

                            value.setString('uid', uid!);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NavBarRoots(),
                                ));
                          })
                            ..onError((error, stackTrace) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              // SnackBar(
                              //   duration: Duration(seconds: 2),
                              //     content: Text(error.toString() +
                              //         stackTrace.toString())));
                              print(error.toString() + stackTrace.toString());
                            });
                        });
                        
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF7165D6),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have any account?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ));
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7165D6),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
