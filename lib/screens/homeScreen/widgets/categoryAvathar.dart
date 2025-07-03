import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../model/homeModel.dart';

class CategoryAvathar extends StatelessWidget {
  CategoryAvathar({super.key, required this.categoriesList});
  List<Category> categoriesList;
  @override
  Widget build(BuildContext context) {
    final bool useTwoLines = categoriesList.length > 5;

    List<List<Category>> groupedCategories = [];
    if (useTwoLines) {
      for (int i = 0; i < categoriesList.length; i += 2) {
        groupedCategories.add(categoriesList.sublist(
            i, i + 2 > categoriesList.length ? categoriesList.length : i + 2));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Shop By Brand",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'View All',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: useTwoLines ? 240 : 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                useTwoLines ? groupedCategories.length : categoriesList.length,
            itemBuilder: (context, index) {
              final items = useTwoLines
                  ? groupedCategories[index]
                  : [categoriesList[index]];
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  mainAxisAlignment: useTwoLines
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.center,
                  children: items.map<Widget>((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: _getCategoryColor(item.name),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.network(
                                item.image,
                                width: 40,
                                height: 40,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.image_not_supported);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item.name,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getCategoryColor(String categoryName) {
    final random = Random(categoryName.hashCode);
    return Color.fromARGB(
      255,
      150 + random.nextInt(100),
      150 + random.nextInt(100),
      150 + random.nextInt(100),
    );
  }
}
