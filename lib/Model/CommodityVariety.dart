class CommodityVarietyResponse {
  CommodityVarietyResponse({
    required this.status,
    required this.response,
  });
  late final String status;
  late final List<Response> response;
  
  CommodityVarietyResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    response = List.from(json['response']).map((e)=>Response.fromJson(e)).toList();
  }
CommodityVarietyResponse.fromError(Map<String, dynamic> json){
    status = json['status'];
   
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['response'] = response.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Response {
  Response({
    required this.id,
    required this.commodityId,
    required this.parentCommodityId,
    required this.name,
    required this.productId,
    required this.arrivalSeason,
    required this.bagType,
    required this.isPerishable,
    required this.createdAt,
    required this.updatedAt,
    required this.getProductsWithPrice,
  });
  late final int id;
  late final int commodityId;
  late final int parentCommodityId;
  late final String name;
  late final String productId;
  late final String arrivalSeason;
  late final String bagType;
  late final String isPerishable;
  late final String createdAt;
  late final String updatedAt;
  late final List<GetProductsWithPrice> getProductsWithPrice;
  
  Response.fromJson(Map<String, dynamic> json){
    id = json['id'];
    commodityId = json['commodity_id'];
    parentCommodityId = json['parent_commodity_id'];
    name = json['name'];
    productId = json['product_id'];
    arrivalSeason = json['arrival_season'];
    bagType = json['bag_type'];
    isPerishable = json['is_perishable'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getProductsWithPrice = List.from(json['get_products_with_price']).map((e)=>GetProductsWithPrice.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['commodity_id'] = commodityId;
    _data['parent_commodity_id'] = parentCommodityId;
    _data['name'] = name;
    _data['product_id'] = productId;
    _data['arrival_season'] = arrivalSeason;
    _data['bag_type'] = bagType;
    _data['is_perishable'] = isPerishable;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['get_products_with_price'] = getProductsWithPrice.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class GetProductsWithPrice {
  GetProductsWithPrice({
    required this.id,
    required this.commodityId,
    required this.parentCommodityId,
    required this.productId,
    required this.price,
    required this.uom,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int commodityId;
  late final int parentCommodityId;
  late final int productId;
  late final int price;
  late final String uom;
  late final String createdAt;
  late final String updatedAt;
  
  GetProductsWithPrice.fromJson(Map<String, dynamic> json){
    id = json['id'];
    commodityId = json['commodity_id'];
    parentCommodityId = json['parent_commodity_id'];
    productId = json['product_id'];
    price = json['price'];
    uom = json['uom'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['commodity_id'] = commodityId;
    _data['parent_commodity_id'] = parentCommodityId;
    _data['product_id'] = productId;
    _data['price'] = price;
    _data['uom'] = uom;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}