import 'package:flutter/material.dart';
import 'package:flutter_and_cloudinary/data.dart';

class FullScreen extends StatelessWidget {
  final Resources resources;

  FullScreen(this.resources);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: resources.secureUrl,
            child: Image.network(
              resources.secureUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
          new Align(
            alignment: Alignment.topCenter,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new AppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
