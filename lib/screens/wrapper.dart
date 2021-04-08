import 'package:agile_family/models/user.dart';
import 'package:agile_family/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<LightUser>(context);
    if(user == null){
      return Authenticate();
    }
    return Home();
  }
}
