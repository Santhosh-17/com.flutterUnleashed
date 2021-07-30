import 'package:chit_chat/components/rounded_button.dart';
import 'package:chit_chat/constants.dart';
import 'package:chit_chat/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final textController = TextEditingController();
  final passController = TextEditingController();
  bool showSpinner = false;
  String email, password;
  final _auth = FirebaseAuth.instance;

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
                controller: textController,
                keyboardType: TextInputType.emailAddress,

                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: kInputTextFieldDecoration.copyWith(hintText: 'Enter your email',labelText: 'E-Mail'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: passController,
                obscureText: true,

                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kInputTextFieldDecoration.copyWith(hintText: 'Enter your password',labelText: 'Password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(colour: Colors.lightBlueAccent, title: 'Log In',
                onPressed: () async
                {
                  setState(() {
                    showSpinner = false;
                  });
                  try{
                    final  user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    print('result od user $user ');
                    if(user != null ){
                      textController.clear();
                      passController.clear();
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpinner = true;
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
