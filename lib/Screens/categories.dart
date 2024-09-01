import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'category_item.dart';

class CategoriesTab extends StatelessWidget {
  Function onClick;
  CategoriesTab({required this.onClick,super.key});

  List<CategoryModel> categories = CategoryModel.getCategories();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "pick your category of interest",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Color(0xff4F5A69)),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onClick(categories[index]);
                    },
                    child: CategoryItem(model: categories[index]));
              },
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
