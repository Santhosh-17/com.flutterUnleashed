import 'package:chit_chat/components/rounded_button.dart';
import 'package:chit_chat/constants.dart';
import 'package:chit_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class RegistrationScreen extends StatefulWidget {
  static const String id = 'RegistrationScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  String email, password;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kInputTextFieldDecoration.copyWith(hintText: 'Enter your email',labelText: 'E-Mail'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kInputTextFieldDecoration.copyWith(hintText: 'Enter your password',labelText: 'Password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(colour: Colors.blueAccent, title: 'Register',
                onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                try{
                  print(email);
                  print(password);
                  final _newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                  if( _newUser != null){
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                  setState(() {
                    showSpinner = false;
                  });
                }catch(e){
                  print(e);
                }


                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
