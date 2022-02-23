class ComodityResponse {
  ComodityResponse({
    required this.status,
    required this.response,
  });
  late final String status;
  late final List<Responsec> response;

  ComodityResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response =
        List.from(json['response']).map((e) => Responsec.fromJson(e)).toList();
  }
  ComodityResponse.fromError(Map<String, dynamic> json) {
    status = json['status'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['response'] = response.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Responsec {
  Responsec({
    required this.id,
    required this.commodityName,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String commodityName;
  late final String createdAt;
  late final String updatedAt;

  Responsec.fromJson(Map<String, dynamic> json) {
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
