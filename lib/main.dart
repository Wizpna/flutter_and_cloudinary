import 'package:flutter/material.dart';
import 'package:flutter_and_cloudinary/data.dart';
import 'package:flutter_and_cloudinary/fullScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter and Cloudinary',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String baseUrl =
      'https://API Key:API Secret@api.cloudinary.com/v1_1/Cloud name/resources/image';

  //Replace API Key with your cloudinary API Key
  //and also replace API Secret key with your cloudinary API Secret key.

  //When done, your baseUrl should look like this url below
  //'https://123456789987654:azdRJBNv1B3TBQLI4rK4xK1dPXD@api.cloudinary.com/v1_1/demo/resources/image';

  Future<List<Resources>> getNews() async {
    return await http.get(baseUrl).then((response) {
      Data an = Data.fromJson(json.decode(response.body.toString()));
      return an.resources;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter and Cloudinary'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              List<Resources> resources = snapshot.data;
              return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.74,
                shrinkWrap: false,
                children: resources.map((i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FullScreen(i)));
                    },
                    child: Card(
                      elevation: 5.0,
                      child: Column(
                        children: <Widget>[
                          new ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Hero(
                              tag: i.secureUrl,
                              child: Image.network(
                                i.secureUrl,
                                width: MediaQuery.of(context).size.width,
                                height: 208,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
        future: getNews(),
      ),
    );
  }
}
