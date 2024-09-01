import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Screens/tab_bar.dart';
import 'package:news_app/Screens/tab_item.dart';
import 'package:news_app/apis/api_manager.dart';
import 'package:news_app/models/category_model.dart';

import 'categories.dart';
import 'drawer_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
        drawer: DrawerTab(onClick:onDrawerClick,),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text(
            "News App",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        body:selectedCategory == null? CategoriesTab(
          onClick: onCategorySelect,
        ):TabBarWidget(id: selectedCategory!.id,),
      ),
    );
  }

  CategoryModel? selectedCategory = null;

  onDrawerClick(id){
    if(id==DrawerTab.CATEGORY_ID){
      selectedCategory=null;

    }else if(id==DrawerTab.SETTENGS){}
    setState(() {});

  }

  onCategorySelect(cat) {
    selectedCategory = cat;
    setState(() {});
  }
}
