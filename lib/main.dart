import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/place_list_screen.dart';
import './screens/add_place_screen.dart';
import './providers/great_place.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlace(),
      child: MaterialApp(
        theme:
            ThemeData(primaryColor: Colors.amber, primarySwatch: Colors.indigo),
        home: const PlaceListScreen(),
        routes: {
          AddPlaceScreen.routeName: (context) => const AddPlaceScreen(),
        },
      ),
    );
  }
}
