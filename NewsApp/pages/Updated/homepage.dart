import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/pages/viewpage.dart';
import 'package:newsapp/services/api_manager.dart';
import 'package:flutter_html/flutter_html.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Future data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    data = getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("NewsApp"),
      ),
      body: Center(child: Container(
        child: FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot snapshot) {

            if(snapshot.hasData){
              // print(' value : ${snapshot.data["articles"]}');
               return createListView(snapshot.data, context);
              // return SingleChildScrollView(
              //     child:Html(
              //       data:snapshot.data["articles"][5]["description"],
              //     )
              // );
            }else{
              return CircularProgressIndicator();
            }
          },
        ),
      )
      ),
    );
  }

  Future getData() {
    String url = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=66ad291cb1d24c00a0549625a3fe8ab8";
    ApiManager apiManager = ApiManager(url);
    var data =  apiManager.getNews();
    // data.then((value){
    //   print('title: ${value["articles"][0]["title"]}');
    // });
    return data;
  }

  Widget createListView(data, BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: data["articles"].length,
        itemBuilder: (context, index) {
          var article = data["articles"][index];
        return Column(
          children:<Widget>[
            Divider(height: 5.0),
            InkWell(
              splashColor: Colors.blue,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ViewPage(article))
                );
              },
              child: Row(
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                        height: 80,
                        width: 120,
                      child: Image.network("https://dummyimage.com/250/ffffff/000000",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(article["title"],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(article["description"],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ]
          );
      },
      ),
    );
  }
}
