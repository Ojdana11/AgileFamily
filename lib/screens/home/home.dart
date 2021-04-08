import 'package:agile_family/TabsScrollBar.dart';
import 'package:agile_family/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return TabsScrollBar();
  }
}
