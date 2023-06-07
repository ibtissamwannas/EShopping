class Categories {
  int? categoriesId;
  String? categoryName;
  String? categoryNameAr;
  String? categoryImage;
  String? categoryDatetime;

  Categories(
      {this.categoriesId,
      this.categoryName,
      this.categoryNameAr,
      this.categoryImage,
      this.categoryDatetime});

  Categories.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoryName = json['category_name'];
    categoryNameAr = json['category_name_ar'];
    categoryImage = json['category_image'];
    categoryDatetime = json['category_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['category_name'] = this.categoryName;
    data['category_name_ar'] = this.categoryNameAr;
    data['category_image'] = this.categoryImage;
    data['category_datetime'] = this.categoryDatetime;
    return data;
  }
}
