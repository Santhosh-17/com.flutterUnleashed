
import 'package:flutter/material.dart';
import 'package:newsapp_demo/services/api_manager.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future data;

  @override
  void initState() {
    super.initState();
    // data = ApiManager('https://jsonplaceholder.typicode.com/posts').getNews();
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RestApi Demo')),
      body: Center(child: Container(
        child: FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              // return Text(snapshot.data[0]["title"]);
              return createListView(snapshot.data, context);
            }else{
              return CircularProgressIndicator();
            }

          },
        ),
      )),
    );
  }

  Future getData() async{
    var data;
    String url = 'https://jsonplaceholder.typicode.com/posts';
    ApiManager apiManager = ApiManager(url);

    data = apiManager.getNews();
    // data.then((value) {
    //   print(value[0]["userId"]);
    // });

    return data;
  }

  Widget createListView(List data, BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Divider(height: 5.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Column(
                  children: <Widget> [
                    CircleAvatar(
                      backgroundColor: Colors.black26,
                      radius: 23,
                      child: Text("${data[index]["id"].toString()}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                    )
                  ],
                ),
                title: Text("${data[index]["title"]}"),
                subtitle: Text("${data[index]["body"]}",
                maxLines: 3,
                ),
                trailing: Text("${data[index]["userId"].toString()}"),
              ),
            )
          ],
        );
      },
      ),
    );
  }

}
