import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class ViewPage extends StatefulWidget {
  var article;
  ViewPage(this.article);
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NewsApp"),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                clipBehavior: Clip.antiAlias,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(24),
                // ),
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Image.network(widget.article["urlToImage"],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.article["title"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                ),
              ),
              Html(
                data: widget.article["description"],
                style: {
                  "p": Style(
                    fontSize: FontSize.percent(18),
                    backgroundColor: Colors.blue
                  )
                },
              ),
              Html(data: widget.article["content"],
                style: {
                  "p": Style(
                      backgroundColor: Colors.blue
                  )
                },
              ),
              Center(
                child: TextButton(
                  child: Text("Back",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
