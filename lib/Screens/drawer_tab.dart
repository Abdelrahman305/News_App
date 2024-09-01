import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerTab extends StatelessWidget {
  Function onClick;
   DrawerTab({required this.onClick,super.key});

   static const int CATEGORY_ID=1;
   static const int SETTENGS=1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.5,
      color:  Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height*.2,
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Center(child: Text("News App",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
          ),
          InkWell(
              onTap: () {
                onClick(CATEGORY_ID);
              },
              child: Text("Categories",style: TextStyle(fontSize: 20),)),
          SizedBox(height: 20,),
          InkWell(
              onTap: () {
                onClick(SETTENGS);
              },
              child: Text("Settings",style: TextStyle(fontSize: 20),)),
        ],
      ),
    );
  }
}
