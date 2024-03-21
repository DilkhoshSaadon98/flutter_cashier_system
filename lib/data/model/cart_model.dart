class CartModel {
  String? itemsPrice;
  int? countItems;
  int? cartId;
  int? cartItemsId;
  int? cartOrders;
  int? cartNumber;
  String? cartCreateDate;
  String? cartStatus;
  int? itemsId;
  String? itemsName;
  String? itemsBarcode;
  int? itemsSellingprice;
  int? itemsBuingprice;
  int? itemsWholesaleprice;
  int? itemsCount;
  String? itemsType;
  int? itemsCostprice;
  String? itemsDesc;
  int? itemsCat;
  String? itemsCreatedate;

  CartModel(
      {this.itemsPrice,
      this.countItems,
      this.cartId,
      this.cartItemsId,
      this.cartOrders,
      this.cartNumber,
      this.cartCreateDate,
      this.cartStatus,
      this.itemsId,
      this.itemsName,
      this.itemsBarcode,
      this.itemsSellingprice,
      this.itemsBuingprice,
      this.itemsWholesaleprice,
      this.itemsCount,
      this.itemsType,
      this.itemsCostprice,
      this.itemsDesc,
      this.itemsCat,
      this.itemsCreatedate});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsPrice = json['items_price'];
    countItems = json['count_items'];
    cartId = json['cart_id'];
    cartItemsId = json['cart_items_id'];
    cartOrders = json['cart_orders'];
    cartNumber = json['cart_number'];
    cartCreateDate = json['cart_create_date'];
    cartStatus = json['cart_status'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_price'] = this.itemsPrice;
    data['count_items'] = this.countItems;
    data['cart_id'] = this.cartId;
    data['cart_items_id'] = this.cartItemsId;
    data['cart_orders'] = this.cartOrders;
    data['cart_number'] = this.cartNumber;
    data['cart_create_date'] = this.cartCreateDate;
    data['cart_status'] = this.cartStatus;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
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
    return data;
  }
}