
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sustainable_tracker/pages/routinePage.dart';
import 'package:sustainable_tracker/services/auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  tileMode: TileMode.mirror,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xff276375), const Color(0xff050D10)],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(100),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/onboard_logo.png"),
                        fit: BoxFit.contain,
                      )
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 40),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: "Email"
                                    ),
                                    validator: (val) => val.isEmpty ? 'Bu alan boş bırakılamaz!' : null,
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    },
                                  ),
                                  SizedBox(height: 10.0),
                                  TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        labelText: "Şifre"
                                    ),
                                    validator: (val) => val.length < 6 ? 'Lütfen en az 6 karakter giriniz!' : null,
                                    onChanged: (val) {
                                      setState(() => password = val);
                                    },
                                  ),
                                  SizedBox(height: 12.0),
                                  Text(
                                    error,
                                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: double.maxFinite,
                            child: RaisedButton(
                                color: Color(0xff27637f),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Giriş Yap", style: TextStyle(color: Colors.white),),
                                    Icon(Icons.arrow_forward, color: Colors.white,),
                                  ],
                                ),
                                onPressed: () async {
                                  if(_formKey.currentState.validate()){
                                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                    if(result == null) {
                                      setState(() {
                                        error = 'Bu bilgilerle giriş yapılamıyor!';
                                      });
                                    }
                                  }
                                }
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: 50,
                            width: double.maxFinite,
                            child: RaisedButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Color(0xff27637f), width: 2)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Kayıt Ol!", style: TextStyle(color: Color(0xff27637f)),),
                                    Icon(Icons.arrow_forward, color: Color(0xff27637f)),
                                  ],
                                ),
                                onPressed: () async {
                                  if(_formKey.currentState.validate()){
                                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                    if(result == null) {
                                      setState(() {
                                        error = 'Lütfen geçerli bir email giriniz!';
                                      });
                                    }else{
                                      await Firestore.instance.collection("users").document(result.uid).setData({'uid': result.uid});
                                      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => RoutinePicker()));
                                    }
                                  }
                                }
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//27637s