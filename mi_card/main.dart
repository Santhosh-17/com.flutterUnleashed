import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/iam.jpg'),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text('Santhosh Kumar Govindraj',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text('FLUTTER DEVELOPER',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[300],
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SourceSansPro',
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.grey[300],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.phone,
                    color: Colors.grey[700],
                  ),
                  title: Text('+91 9384393910',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.mail_outline,
                    color: Colors.grey[700],
                  ),
                  title: Text('santhoshgovind007@gmail.com',
                    style:TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SourceSansPro'
                    ),
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}