class CategoriesModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesCreatedate;
  String? categoriesImage;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesCreatedate,
      this.categoriesImage});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesCreatedate = json['categories_createdate'];
    categoriesImage = json['categories_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_createdate'] = this.categoriesCreatedate;
    data['categories_image'] = this.categoriesImage;
    return data;
  }
}