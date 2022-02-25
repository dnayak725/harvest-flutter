class HistoryCorpResponse {
  HistoryCorpResponse({
    required this.status,
    required this.response,
  });
  late final String status;
  late final List<Response> response;

  HistoryCorpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response =
        List.from(json['response']).map((e) => Response.fromJson(e)).toList();
  }
  HistoryCorpResponse.fromError(Map<String, dynamic> json) {
    status = json['status'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['response'] = response.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Response {
  Response({
    required this.id,
    required this.farmerId,
    required this.aadharNumber,
    required this.commodityId,
    required this.parentCommodityId,
    required this.productId,
    required this.priceId,
    this.productQuantity,
    this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
    required this.getFarmer,
    required this.getCommodityDetail,
    required this.getParentCommodity,
    required this.getProduct,
    required this.getPrice,
  });
  late final int id;
  late final int farmerId;
  late final String aadharNumber;
  late final int commodityId;
  late final int parentCommodityId;
  late final int productId;
  late final int priceId;
  late final productQuantity;
  late final phoneNumber;
  late final String createdAt;
  late final String updatedAt;
  late final GetFarmer getFarmer;
  late final GetCommodityDetail getCommodityDetail;
  late final GetParentCommodity getParentCommodity;
  late final GetProduct getProduct;
  late final GetPrice getPrice;

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    farmerId = json['farmer_id'];
    aadharNumber = json['aadhar_number'];
    commodityId = json['commodity_id'];
    parentCommodityId = json['parent_commodity_id'];
    productId = json['product_id'];
    priceId = json['price_id'];
    productQuantity = json['product_quantity'];
    phoneNumber = json[''];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getFarmer = GetFarmer.fromJson(json['get_farmer']);
    getCommodityDetail =
        GetCommodityDetail.fromJson(json['get_commodity_detail']);
    getParentCommodity =
        GetParentCommodity.fromJson(json['get_parent_commodity']);
    getProduct = GetProduct.fromJson(json['get_product']);

    getPrice = GetPrice.fromJson(json['get_price']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['farmer_id'] = farmerId;
    _data['aadhar_number'] = aadharNumber;
    _data['commodity_id'] = commodityId;
    _data['parent_commodity_id'] = parentCommodityId;
    _data['product_id'] = productId;
    _data['price_id'] = priceId;
    _data['product_quantity'] = productQuantity;
    _data['phone_number'] = phoneNumber;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['get_farmer'] = getFarmer.toJson();
    _data['get_commodity_detail'] = getCommodityDetail.toJson();
    _data['get_parent_commodity'] = getParentCommodity.toJson();
    _data['get_product'] = getProduct.toJson();
    _data['get_price'] = getPrice.toJson();
    return _data;
  }
}

class GetFarmer {
  GetFarmer({
    required this.id,
    required this.name,
    required this.aadharNumber,
    required this.phoneNumber,
    required this.pinCode,
    required this.districtId,
    required this.mandalId,
    required this.villageId,
    required this.parliamentConstituencyId,
    required this.assemblyConstituencyId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String aadharNumber;
  late final String phoneNumber;
  late final int pinCode;
  late final int districtId;
  late final int mandalId;
  late final int villageId;
  late final int parliamentConstituencyId;
  late final int assemblyConstituencyId;
  late final String createdAt;
  late final String updatedAt;

  GetFarmer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    aadharNumber = json['aadhar_number'];
    phoneNumber = json['phone_number'];
    pinCode = json['pin_code'];
    districtId = json['district_id'];
    mandalId = json['mandal_id'];
    villageId = json['village_id'];
    parliamentConstituencyId = json['parliament_constituency_id'];
    assemblyConstituencyId = json['assembly_constituency_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['aadhar_number'] = aadharNumber;
    _data['phone_number'] = phoneNumber;
    _data['pin_code'] = pinCode;
    _data['district_id'] = districtId;
    _data['mandal_id'] = mandalId;
    _data['village_id'] = villageId;
    _data['parliament_constituency_id'] = parliamentConstituencyId;
    _data['assembly_constituency_id'] = assemblyConstituencyId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class GetCommodityDetail {
  GetCommodityDetail({
    required this.id,
    required this.commodityName,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String commodityName;
  late final String createdAt;
  late final String updatedAt;

  GetCommodityDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commodityName = json['commodity_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['commodity_name'] = commodityName;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class GetParentCommodity {
  GetParentCommodity({
    required this.id,
    required this.commodityId,
    required this.pcName,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int commodityId;
  late final String pcName;
  late final String createdAt;
  late final String updatedAt;

  GetParentCommodity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commodityId = json['commodity_id'];
    pcName = json['pc_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['commodity_id'] = commodityId;
    _data['pc_name'] = pcName;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class GetProduct {
  GetProduct({
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

  GetProduct.fromJson(Map<String, dynamic> json) {
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
    return _data;
  }
}

class GetPrice {
  GetPrice({
    required this.id,
    required this.commodityId,
    required this.parentCommodityId,
    required this.productId,
    required this.price,
    required this.uom,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int? id;
  late final int? commodityId;
  late final int? parentCommodityId;
  late final int? productId;
  late final price;
  late final String? uom;
  late final String? createdAt;
  late final String? updatedAt;

  GetPrice.fromJson(Map<String, dynamic> json) {
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
