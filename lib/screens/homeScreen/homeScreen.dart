import 'package:ecommerce_app/provider/homeProvider.dart';
import 'package:ecommerce_app/screens/homeScreen/widgets/banner.dart';
import 'package:ecommerce_app/screens/homeScreen/widgets/bannerGrid.dart';
import 'package:ecommerce_app/screens/homeScreen/widgets/brandBanner.dart';
import 'package:ecommerce_app/screens/homeScreen/widgets/categoryAvathar.dart';
import 'package:ecommerce_app/screens/homeScreen/widgets/productList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }

  getData() async {
    await Provider.of<HomeProvider>(context, listen: false).fetchHomeData();
  }

  @override
  Widget build(BuildContext context) {
    List data = Provider.of<HomeProvider>(context, listen: false).homeDataList;
    print(data);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: RichText(
          text: const TextSpan(
            text: 'Welcome, ',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
            ),
            children: [
              TextSpan(
                text: 'James!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: const Icon(
              Icons.notifications_none,
              size: 28,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            headerSection(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final field = data[index];
                  print(field.type);
                  print(field.banners);
                  switch (field.type) {
                    case 'carousel':
                      return BannerSection(
                        items: field.carouselItems,
                      );
                    case 'brands':
                      return BrandBanner(brands: field.brands!);
                    case 'category':
                      return CategoryAvathar(categoriesList: field.categories!);
                    case 'rfq':
                      return _buildRfqBanner(field.image!);
                    case 'collection':
                      return ProductList(
                          title: field.name!, products: field.products!);
                    case 'future-order':
                      return _buildRfqBanner(field.image!);
                    case 'banner-grid':
                      return BannerGrid(banners: field.banners);
                    case 'banner':
                      return _buildRfqBanner(field.banner?.image);
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget headerSection() {
    return Container(
      height: 80,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              children: [
                Text(
                  'Scan Here',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.qr_code_scanner, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRfqBanner(String image) {
    return Column(
      children: [
        SizedBox(height: 15),
        Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ))),
      ],
    );
  }
}
