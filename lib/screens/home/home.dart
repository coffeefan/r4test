import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold( // 1
        appBar: new AppBar( //2
          title: new Text("Auth"),
        ),
        body: new Container(
          // decoration: new BoxDecoration(color: Colors.white),
            child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Hello!"),
                    RaisedButton(
                      child: Text('Show products'),
                      onPressed: () {
                        // Navigate to the second screen using a named route
                        Navigator.pushNamed(context, '/products');
                      },
                    )
                  ],
                )
            )
        )
    );
  }
}