import 'package:flutter/material.dart';
import 'package:news_ashor_a/ui/layout/home/fragments/newsfragment/news_details.dart';
import 'package:news_ashor_a/ui/layout/home/fragments/newsfragment/search_widget.dart';
import 'package:news_ashor_a/ui/layout/home/home_layout.dart';


void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.transparent,
      debugShowCheckedModeBanner: false,
      routes:
      {
        HomeLayout.routname:(context) => HomeLayout(),
        NewsDetails.routeName:(context)=> NewsDetails(),
        SearchWidget.routeName:(context)=> SearchWidget(),
      },
      initialRoute: HomeLayout.routname,
      //theme: mytheme.Light,
      themeMode: ThemeMode.light,
    );
  }
}
