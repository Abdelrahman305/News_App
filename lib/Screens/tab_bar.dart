import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Screens/tab_item.dart';

import '../apis/api_manager.dart';
import 'news_item.dart';

class TabBarWidget extends StatefulWidget {
  String id;
   TabBarWidget({required this.id,super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedTabIndex=0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSourses(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Something wrong");
        }
        var sources = snapshot.data?.sources ?? [];
        //return ListView.builder(itemBuilder: (context, index) {
        //return Text(sources[index].name??"");},
        // itemCount: sources.length,
        //);
        return Column(
          children: [
            DefaultTabController(
                length: sources.length,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      onTap: (value) {
                        selectedTabIndex=value;
                        setState(() {

                        });
                      },

                      isScrollable: true,
                      tabs: sources
                          .map((e) => TabItem(
                        sources:e,
                        isSelected: sources.elementAt(selectedTabIndex)==e,
                      ))
                          .toList()),
                )),
            FutureBuilder(future: ApiManager.getNewsData(sources[selectedTabIndex].id??""),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text("Something wrong");
                }
                var articals=snapshot.data?.articles??[];
                return Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return NewsItem(article: articals[index],);
                  },
                    itemCount: articals.length,
                  ),
                );

              },),
          ],
        );
      },
    );
  }
}
