import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constants/dummy.dart';
import '../widgets/category_item.dart';
import 'category_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  void _goToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryPage.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: _contentBody(),
    );
  }

  Widget _contentBody() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: Dummy.dummyCategories.length,
      itemBuilder: (context, index) {
        final category = Dummy.dummyCategories[index];
        return CategoryItem(
          category: category,
          onPressed: () => _goToCategoryPage(context, category),
        );
      },
    );
  }
}
