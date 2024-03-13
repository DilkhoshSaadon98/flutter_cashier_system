class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsCode;
  String? itemsBarcode;
  String? itemsSellingprice;
  String? itemsBuingprice;
  String? itemsWholesaleprice;
  String? itemsCount;
  String? itemsType;
  String? itemsCostprice;
  String? itemsDesc;
  int? itemsCat;
  String? itemsCreatedate;
  String? itemsBddate;
  String? itemsExpiredate;

  ItemsModel(
      {this.itemsId,
      this.itemsName,
      this.itemsCode,
      this.itemsBarcode,
      this.itemsSellingprice,
      this.itemsBuingprice,
      this.itemsWholesaleprice,
      this.itemsCount,
      this.itemsType,
      this.itemsCostprice,
      this.itemsDesc,
      this.itemsCat,
      this.itemsCreatedate,
      this.itemsBddate,
      this.itemsExpiredate});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsCode = json['items_code'];
    itemsBarcode = json['items_barcode'];
    itemsSellingprice = json['items_sellingprice'];
    itemsBuingprice = json['items_buingprice'];
    itemsWholesaleprice = json['items_wholesaleprice'];
    itemsCount = json['items_count'];
    itemsType = json['items_type'];
    itemsCostprice = json['items_costprice'];
    itemsDesc = json['items_desc'];
    itemsCat = json['items_cat'];
    itemsCreatedate = json['items_createdate'];
    itemsBddate = json['items_bddate'];
    itemsExpiredate = json['items_expiredate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_code'] = this.itemsCode;
    data['items_barcode'] = this.itemsBarcode;
    data['items_sellingprice'] = this.itemsSellingprice;
    data['items_buingprice'] = this.itemsBuingprice;
    data['items_wholesaleprice'] = this.itemsWholesaleprice;
    data['items_count'] = this.itemsCount;
    data['items_type'] = this.itemsType;
    data['items_costprice'] = this.itemsCostprice;
    data['items_desc'] = this.itemsDesc;
    data['items_cat'] = this.itemsCat;
    data['items_createdate'] = this.itemsCreatedate;
    data['items_bddate'] = this.itemsBddate;
    data['items_expiredate'] = this.itemsExpiredate;
    return data;
  }
}