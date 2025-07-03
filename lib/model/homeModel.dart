class HomeResponse {
  final int errorCode;
  final String message;
  final HomeData data;

  HomeResponse({
    required this.errorCode,
    required this.message,
    required this.data,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return HomeResponse(
      errorCode: json['error_code'] ?? 0,
      message: json['message'] ?? '',
      data: HomeData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error_code': errorCode,
      'message': message,
      'data': data.toJson(),
    };
  }
}

// Home data model
class HomeData {
  final List<HomeField> homeFields;
  final int notificationCount;

  HomeData({
    required this.homeFields,
    required this.notificationCount,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      homeFields: (json['home_fields'] as List<dynamic>?)
              ?.map((item) => HomeField.fromJson(item))
              .toList() ??
          [],
      notificationCount: json['notification_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'home_fields': homeFields.map((field) => field.toJson()).toList(),
      'notification_count': notificationCount,
    };
  }
}

// Base home field model
class HomeField {
  final String type;
  final List<CarouselItem>? carouselItems;
  final List<Brand>? brands;
  final List<Category>? categories;
  final String? image;
  final int? collectionId;
  final String? name;
  final List<Product>? products;
  final List<BannerItem>? banners;
  final Banner? banner;
  final Rfq? rfq;

  HomeField({
    required this.type,
    this.carouselItems,
    this.brands,
    this.categories,
    this.image,
    this.collectionId,
    this.name,
    this.products,
    this.banners,
    this.banner,
    this.rfq,
  });

  factory HomeField.fromJson(Map<String, dynamic> json) {
    return HomeField(
      type: json['type'] ?? '',
      carouselItems: json['carousel_items'] != null
          ? (json['carousel_items'] as List<dynamic>)
              .map((item) => CarouselItem.fromJson(item))
              .toList()
          : null,
      brands: json['brands'] != null
          ? (json['brands'] as List<dynamic>)
              .map((item) => Brand.fromJson(item))
              .toList()
          : null,
      categories: json['categories'] != null
          ? (json['categories'] as List<dynamic>)
              .map((item) => Category.fromJson(item))
              .toList()
          : null,
      image: json['image'],
      collectionId: json['collection_id'],
      name: json['name'],
      products: json['products'] != null
          ? (json['products'] as List<dynamic>)
              .map((item) => Product.fromJson(item))
              .toList()
          : null,
      banners: json['banners'] != null
          ? (json['banners'] as List<dynamic>)
              .map((item) => BannerItem.fromJson(item))
              .toList()
          : null,
      banner: json['banner'] != null ? Banner.fromJson(json['banner']) : null,
      rfq: json['banner'] != null ? Rfq.fromJson(json['banner']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      if (carouselItems != null)
        'carousel_items': carouselItems!.map((item) => item.toJson()).toList(),
      if (brands != null)
        'brands': brands!.map((brand) => brand.toJson()).toList(),
      if (categories != null)
        'categories': categories!.map((category) => category.toJson()).toList(),
      if (image != null) 'image': image,
      if (collectionId != null) 'collection_id': collectionId,
      if (name != null) 'name': name,
      if (products != null)
        'products': products!.map((product) => product.toJson()).toList(),
      if (banners != null)
        'banners': banners!.map((banner) => banner.toJson()).toList(),
      if (banner != null) 'banner': banner!.toJson(),
      if (rfq != null) 'rfq': rfq!.toJson(),
    };
  }
}

// Carousel item model
class CarouselItem {
  final int id;
  final String image;
  final String type;

  CarouselItem({
    required this.id,
    required this.image,
    required this.type,
  });

  factory CarouselItem.fromJson(Map<String, dynamic> json) {
    return CarouselItem(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      type: json['type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'type': type,
    };
  }
}

// Brand model
class Brand {
  final int id;
  final String name;
  final String image;

  Brand({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}

// Category model
class Category {
  final int id;
  final String name;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}

// Product model
class Product {
  final int id;
  final String image;
  final String name;
  final String currency;
  final String unit;
  final bool wishlisted;
  final bool rfqStatus;
  final int cartCount;
  final int futureCartCount;
  final bool hasStock;
  final String price;
  final String actualPrice;
  final String offer;
  final List<dynamic> offerPrices;

  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.currency,
    required this.unit,
    required this.wishlisted,
    required this.rfqStatus,
    required this.cartCount,
    required this.futureCartCount,
    required this.hasStock,
    required this.price,
    required this.actualPrice,
    required this.offer,
    required this.offerPrices,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      currency: json['currency'] ?? '',
      unit: json['unit'] ?? '',
      wishlisted: json['wishlisted'] ?? false,
      rfqStatus: json['rfq_status'] ?? false,
      cartCount: json['cart_count'] ?? 0,
      futureCartCount: json['future_cart_count'] ?? 0,
      hasStock: json['has_stock'] ?? false,
      price: json['price'] ?? '',
      actualPrice: json['actual_price'] ?? '',
      offer: json['offer'] ?? '',
      offerPrices: json['offer_prices'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'currency': currency,
      'unit': unit,
      'wishlisted': wishlisted,
      'rfq_status': rfqStatus,
      'cart_count': cartCount,
      'future_cart_count': futureCartCount,
      'has_stock': hasStock,
      'price': price,
      'actual_price': actualPrice,
      'offer': offer,
      'offer_prices': offerPrices,
    };
  }

  // Helper methods
  double get priceAsDouble => double.tryParse(price) ?? 0.0;
  double get actualPriceAsDouble => double.tryParse(actualPrice) ?? 0.0;
  double get discountAmount => actualPriceAsDouble - priceAsDouble;
  double get discountPercentage => actualPriceAsDouble > 0
      ? (discountAmount / actualPriceAsDouble) * 100
      : 0.0;
}

// Banner item model
class BannerItem {
  final String image;
  final String type;
  final int id;

  BannerItem({
    required this.image,
    required this.type,
    required this.id,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      image: json['image'] ?? '',
      type: json['type'] ?? '',
      id: json['id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'type': type,
      'id': id,
    };
  }
}

// Banner model
class Banner {
  final int id;
  final String image;
  final String type;

  Banner({
    required this.id,
    required this.image,
    required this.type,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      type: json['type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'type': type,
    };
  }
}

class Rfq {
  final int id;
  final String image;
  final String type;

  Rfq({
    required this.id,
    required this.image,
    required this.type,
  });

  factory Rfq.fromJson(Map<String, dynamic> json) {
    return Rfq(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      type: json['type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'type': type,
    };
  }
}
