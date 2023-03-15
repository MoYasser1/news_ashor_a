import 'package:flutter/material.dart';

import '../../../../../api/api_manager.dart';
import '../../../../../models/NewsResponse.dart';
import '../../../../../models/taps_response.dart';
import 'news_widget.dart';


class TabDetails extends StatelessWidget {
  MyTab tab;
  TabDetails(this.tab);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews(tab.id??""),
      builder: (context,snapShot){
        if(snapShot.hasError){
          return Text("${snapShot.error.toString()}");
        }
        else if(snapShot.hasData){
          return ListView.builder(
            itemCount: snapShot.data!.articles!.length,
              itemBuilder: (context,index){
                return NewsWidget(snapShot.data!.articles![index]);
              }
          );
        }
       else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
