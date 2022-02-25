class AddCorpResponse {
  AddCorpResponse({
    required this.status,
    required this.response,
    required this.message,
  });
  late final String status;
  late final Response response;
  late final String message;

  AddCorpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = Response.fromJson(json['response']);
    message = json['message'];
  }
  AddCorpResponse.fromError(Map<String, dynamic> json) {
    status = json['status'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['response'] = response.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Response {
  Response({
    required this.commodityId,
    required this.farmerId,
    required this.aadharNumber,
    required this.parentCommodityId,
    required this.productId,
    required this.priceId,
    this.productQuantity,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  late final String commodityId;
  late final String farmerId;
  late final String aadharNumber;
  late final String parentCommodityId;
  late final String productId;
  late final String priceId;
  late final String? productQuantity;
  late final String updatedAt;
  late final String createdAt;
  late final int id;

  Response.fromJson(Map<String, dynamic> json) {
    commodityId = json['commodity_id'];
    farmerId = json['farmer_id'];
    aadharNumber = json['aadhar_number'];
    parentCommodityId = json['parent_commodity_id'];
    productId = json['product_id'];
    priceId = json['price_id'];
    productQuantity = json['product_quantity'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['commodity_id'] = commodityId;
    _data['farmer_id'] = farmerId;
    _data['aadhar_number'] = aadharNumber;
    _data['parent_commodity_id'] = parentCommodityId;
    _data['product_id'] = productId;
    _data['price_id'] = priceId;
    _data['product_quantity'] = productQuantity;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}
