import 'package:flutter/material.dart';
import 'package:news_ashor_a/ui/layout/home/fragments/newsfragment/tabs_list.dart';

import '../../../../../api/api_manager.dart';
import '../../../../../models/taps_response.dart';



class News_Layout extends StatelessWidget {
  static String routName = 'News layout';
  String? categoryId;

  News_Layout(this.categoryId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TapsResponse>(
          future: ApiManager.getTabs(categoryId!),
            builder:(_,snapShot){
            if(snapShot.hasError){
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(child: Text(snapShot.error.toString(),
                  style:Theme.of(context).textTheme.headline2 ,
                )),
              );
            }
            else if(snapShot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            else{
              return TabsList(snapShot.data!.tabs!);
            }
            }
        );
  }
}
