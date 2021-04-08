// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:agile_family/models/user.dart';
import 'package:agile_family/screens/error.dart';
import 'file:///C:/Users/Aleksandra/AndroidStudioProjects/agile_family/lib/shared/loading.dart';
import 'package:agile_family/screens/wrapper.dart';
import 'package:agile_family/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
        builder: (context, snapshot){

        if(snapshot.hasError){
          return Error();
        }
        if(snapshot.connectionState == ConnectionState.done){
          return StreamProvider<LightUser>.value(
            value: AuthService().user,
            child: MaterialApp(
                home: Wrapper()
              ),
          );
        }
          return Loading();
        }
    );
  }
}