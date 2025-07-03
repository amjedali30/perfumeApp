import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'myApp.dart';
import 'provider/homeProvider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomeProvider()),
  ], child: const MyApp()));
}
