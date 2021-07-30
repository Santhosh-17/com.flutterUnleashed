
import 'package:chit_chat/screens/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chit_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
User loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'ChatScreen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  FocusNode myFocusNode;
  final textController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String messageText;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode = FocusNode();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try{
      final  user = await _auth.currentUser;
      if(user != null){
        loggedInUser = user;
      }
    }catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.clear_all_outlined),
              onPressed: () {
                //Implement logout functionality
                print('Clear Button');
              }),
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                //Implement logout functionality
                _auth.signOut();
                Navigator.pop(context);
                // getMessageStream();
              })
        ],
        title: Text('⚡️Chit Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      focusNode: myFocusNode,
                      controller: textController,
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {
                      myFocusNode.unfocus();
                      Timestamp myTimeStamp = Timestamp.fromDate(DateTime.now());
                      //Implement send functionality.
                      _firestore.collection('messages').add(
                        {
                          'text':messageText,
                          'sender':loggedInUser.email,
                          'time':myTimeStamp
                        }
                      );

                      textController.clear();
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').orderBy("time",descending: false).snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(backgroundColor: Colors.lightBlueAccent,));
          }else{

            List msgs = snapshot.data.docs.reversed.map((document) {
              final messageText = document['text'];
              final messageSender = document['sender'];
              final currentUser = loggedInUser.email;
              return MessageBubble(sender: messageSender,text: messageText,isMe: currentUser==messageSender,);
            }).toList();
            return Expanded(
              child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
                children: msgs,
              ),
            );
          }
        }
    );
  }
}


class MessageBubble extends StatelessWidget {

  final String text ,sender;
  final bool isMe;
  MessageBubble({this.sender,this.text,this.isMe});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender,
          style: TextStyle(
              fontSize: 12.0,
              color:Colors.black54
          ),
          ),
          SizedBox(height: 2.0,),
          Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
              bottomLeft: isMe ? Radius.circular(30.0) : Radius.circular(0.0),
              bottomRight: isMe ? Radius.circular(0.0) : Radius.circular(30.0)
            ),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                    color: isMe ? Colors.white : Colors.black,
                    fontSize: 15.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
