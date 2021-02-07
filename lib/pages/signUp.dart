import 'package:flutter/material.dart';
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
                    margin: EdgeInsets.all(80),
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
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 20.0),
                                TextFormField(
                                  validator: (val) => val.isEmpty ? 'Bu alan boş bırakılamaz!' : null,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  obscureText: true,
                                  validator: (val) => val.length < 6 ? 'Lütfen en az 6 karakter giriniz!' : null,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  },
                                ),
                                SizedBox(height: 20.0),
                                RaisedButton(
                                    color: Colors.pink[400],
                                    child: Text(
                                      'Kaydol',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () async {
                                      if(_formKey.currentState.validate()){
                                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                          if(result == null) {
                                            setState(() {
                                              error = 'Could not sign in with those credentials';
                                            });
                                          }
                                        }
                                    }
                                ),
                                SizedBox(height: 12.0),
                                Text(
                                  error,
                                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                                )
                              ],
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