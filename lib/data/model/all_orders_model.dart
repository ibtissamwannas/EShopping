class AllOrderModel {
  int? id;
  int? userId;
  int? ordersAddress;
  int? ordersType;
  int? ordersPriceDelivery;
  int? ordersPrice;
  int? ordersCoupon;
  String? ordresTime;
  int? paymentType;
  String? orderTotalprice;
  int? orderStatus;
  int? addressId;
  int? addressUserId;
  String? city;
  String? street;
  double? lat;
  double? lon;
  String? name;

  AllOrderModel(
      {this.id,
      this.userId,
      this.ordersAddress,
      this.ordersType,
      this.ordersPriceDelivery,
      this.ordersPrice,
      this.ordersCoupon,
      this.ordresTime,
      this.paymentType,
      this.orderTotalprice,
      this.orderStatus,
      this.addressId,
      this.addressUserId,
      this.city,
      this.street,
      this.lat,
      this.lon,
      this.name});

  AllOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPriceDelivery = json['orders_price_delivery'];
    ordersPrice = json['orders_price'];
    ordersCoupon = json['orders_coupon'];
    ordresTime = json['ordres_time'];
    paymentType = json['payment_type'];
    orderTotalprice = json['order_totalprice'];
    orderStatus = json['order_status'];
    addressId = json['address_id'];
    addressUserId = json['address_user_id'];
    city = json['city'];
    street = json['street'];
    lat = json['lat'];
    lon = json['lon'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_price_delivery'] = this.ordersPriceDelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_coupon'] = this.ordersCoupon;
    data['ordres_time'] = this.ordresTime;
    data['payment_type'] = this.paymentType;
    data['order_totalprice'] = this.orderTotalprice;
    data['order_status'] = this.orderStatus;
    data['address_id'] = this.addressId;
    data['address_user_id'] = this.addressUserId;
    data['city'] = this.city;
    data['street'] = this.street;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['name'] = this.name;
    return data;
  }
}
