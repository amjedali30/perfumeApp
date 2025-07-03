import 'package:flutter/material.dart';

import '../../../model/homeModel.dart';

class BrandBanner extends StatelessWidget {
  BrandBanner({super.key, required this.brands});
  List<Brand> brands;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
            )
          ],
        ),
        Container(
          height: 130,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(width: 15);
                },
                scrollDirection: Axis.horizontal,
                itemCount: brands.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    width: 140,
                    child: Image(image: NetworkImage(brands[index].image)),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
