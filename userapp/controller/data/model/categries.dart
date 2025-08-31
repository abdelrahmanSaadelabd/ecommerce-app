class categries {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesDatatime;
  String? categoriesImage;

  categries({
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesDatatime,
    this.categoriesImage,
  });

  categries.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesDatatime = json['categories_datatime'];
    categoriesImage = json['categories_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_datatime'] = this.categoriesDatatime;
    data['categories_image'] = this.categoriesImage;
    return data;
  }
}

class ItemView {
  final int itemsId;
  final String itemsName;
  final String itemsNameAr;
  final String itemsDesc;
  final String itemsDescAr;
  final int itemsCount;
  final int itemsActive;
  final String itemsImage;
  final double itemsPrice;
  final int itemsDiscount;
  final DateTime itemsDatetime;
  final int itemsCate;
  final int categoriesId;
  final String categoriesName;
  final String categoriesNameAr;
  final DateTime categoriesDatetime;
  final String categoriesImage;

  ItemView({
    required this.itemsId,
    required this.itemsName,
    required this.itemsNameAr,
    required this.itemsDesc,
    required this.itemsDescAr,
    required this.itemsCount,
    required this.itemsActive,
    required this.itemsImage,
    required this.itemsPrice,
    required this.itemsDiscount,
    required this.itemsDatetime,
    required this.itemsCate,
    required this.categoriesId,
    required this.categoriesName,
    required this.categoriesNameAr,
    required this.categoriesDatetime,
    required this.categoriesImage,
  });

  factory ItemView.fromJson(Map<String, dynamic> json) {
    return ItemView(
      itemsId: json['items_id'],
      itemsName: json['items_name'],
      itemsNameAr: json['items_name_ar'],
      itemsDesc: json['items_desc'],
      itemsDescAr: json['items_desc_ar'],
      itemsCount: json['items_count'],
      itemsActive: json['items_active'],
      itemsImage: json['items_image'],
      itemsPrice:
          (json['items_price'] is int)
              ? (json['items_price'] as int).toDouble()
              : json['items_price'],
      itemsDiscount: json['items_discount'],
      itemsDatetime: DateTime.parse(json['items_datatime'].split('\\n')[0]),
      itemsCate: json['items_cate'],
      categoriesId: json['categories_id'],
      categoriesName: json['categories_name'],
      categoriesNameAr: json['categories_name_ar'],
      categoriesDatetime: DateTime.parse(
        json['categories_datatime'].split('\\n')[0],
      ),
      categoriesImage: json['categories_image'],
    );
  }
}
