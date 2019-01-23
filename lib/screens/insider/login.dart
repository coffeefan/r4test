import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../services/masterdata.dart';
import '../../model/productCategory.dart';
import '../../services/ProductCategoryStorage.dart';
import 'dart:developer';



class LoginScreen extends StatelessWidget {
  final String title;

  LoginScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold( // 1
        appBar: new AppBar( //2
          title: new Text("Auth"),
        ),
        body: new Container(
          // decoration: new BoxDecoration(color: Colors.white),
            child: Column(
              children: <Widget>[
                Center(
                  child:Column(

                      children: <Widget>[

                        Text(
                            'WILLKOMMEN BEI \n RINORA4',
                            textAlign: TextAlign.center,
                            style:TextStyle(height: 1.5)

                        ),

                        new Container(
                          margin: const EdgeInsets.only(top: 10.0, bottom: 50.0),
                          height: 1,
                          width: 50,
                          color:Colors.white,
                        ),
                        Image(image: '',),
                          // ...

                      ]
                  ),
                ),

                Container(
                  child: Text('hallo'),
                )
              ],
            )
        )
    );
  }
}