class ParentComodityResponse {
  ParentComodityResponse({
    required this.status,
    required this.response,
  });
  late final String status;
  late final List<Responsep> response;

  ParentComodityResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response =
        List.from(json['response']).map((e) => Responsep.fromJson(e)).toList();
  }
  ParentComodityResponse.fromError(Map<String, dynamic> json) {
    status = json['status'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['response'] = response.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Responsep {
  Responsep({
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

  Responsep.fromJson(Map<String, dynamic> json) {
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
