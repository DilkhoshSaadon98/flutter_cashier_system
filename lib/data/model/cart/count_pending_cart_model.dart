class CountPendingCartModel {
  int? pendingCartCount;
  int? cartNumber;

  CountPendingCartModel({this.pendingCartCount, this.cartNumber});

  CountPendingCartModel.fromJson(Map<String, dynamic> json) {
    pendingCartCount = json['pending_cart_count'];
    cartNumber = json['cart_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pending_cart_count'] = this.pendingCartCount;
    data['cart_number'] = this.cartNumber;
    return data;
  }
}