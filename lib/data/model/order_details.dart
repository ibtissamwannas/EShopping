class Autogenerated {
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDesc;
  String? itemDescAr;
  String? itemImage;
  int? itemTotal;
  int? itemIsActive;
  int? itemPrice;
  int? itemDiscount;
  String? itemTake;
  int? itemCategoryId;
  int? countitems;
  int? itemsprice;
  int? cartUserid;
  int? cartItemid;
  int? cardOrders;

  Autogenerated(
      {this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDesc,
      this.itemDescAr,
      this.itemImage,
      this.itemTotal,
      this.itemIsActive,
      this.itemPrice,
      this.itemDiscount,
      this.itemTake,
      this.itemCategoryId,
      this.countitems,
      this.itemsprice,
      this.cartUserid,
      this.cartItemid,
      this.cardOrders});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDesc = json['item_desc'];
    itemDescAr = json['item_desc_ar'];
    itemImage = json['item_image'];
    itemTotal = json['item_total'];
    itemIsActive = json['item_is_active'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    itemTake = json['item_take'];
    itemCategoryId = json['item_category_id'];
    countitems = json['countitems'];
    itemsprice = json['itemsprice'];
    cartUserid = json['cart_userid'];
    cartItemid = json['cart_itemid'];
    cardOrders = json['card_orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_name_ar'] = this.itemNameAr;
    data['item_desc'] = this.itemDesc;
    data['item_desc_ar'] = this.itemDescAr;
    data['item_image'] = this.itemImage;
    data['item_total'] = this.itemTotal;
    data['item_is_active'] = this.itemIsActive;
    data['item_price'] = this.itemPrice;
    data['item_discount'] = this.itemDiscount;
    data['item_take'] = this.itemTake;
    data['item_category_id'] = this.itemCategoryId;
    data['countitems'] = this.countitems;
    data['itemsprice'] = this.itemsprice;
    data['cart_userid'] = this.cartUserid;
    data['cart_itemid'] = this.cartItemid;
    data['card_orders'] = this.cardOrders;
    return data;
  }
}
