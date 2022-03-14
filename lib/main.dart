import 'package:favorite_restaurant/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:favorite_restaurant/restaurant_local.dart';
import 'package:favorite_restaurant/text_theme.dart';
import 'package:favorite_restaurant/theme.dart';
import 'homepage.dart';
import 'detail_page.dart';
import 'theme.dart';
import 'text_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: myfontsTextTheme,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor,
            ),
        appBarTheme: AppBarTheme(elevation: 0),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: secondaryColor,
            onPrimary: Colors.white,
            textStyle: TextStyle(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
          ),
        ),
      ),
      initialRoute: Splashscreen.routeName,
      routes: {
        Splashscreen.routeName: (context) => Splashscreen(),
        RestaurantAppPage.routeName: (context) => RestaurantAppPage(),
        DetailLocalRestaurant.routeName: (context) => DetailLocalRestaurant(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as LocalRestaurant,
            )
      },
    );
  }
}
