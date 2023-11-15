class AddressModelData {
  int? id;
  int? userId;
  String? city;
  String? street;
  double? lat;
  double? lon;
  String? name;

  AddressModelData(
      {this.id,
      this.userId,
      this.city,
      this.street,
      this.lat,
      this.lon,
      this.name});

  AddressModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
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
    data['city'] = this.city;
    data['street'] = this.street;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['name'] = this.name;
    return data;
  }
}
