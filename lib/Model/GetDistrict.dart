class GetDistrictResponse {
  GetDistrictResponse({
    required this.status,
    required this.response,
  });
  late final String status;
  late final List<Responsed> response;

  GetDistrictResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response =
        List.from(json['response']).map((e) => Responsed.fromJson(e)).toList();
  }
  GetDistrictResponse.fromError(Map<String, dynamic> json) {
    status = json['status'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['response'] = response.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Responsed {
  Responsed({
    required this.id,
    required this.name,
    required this.stateId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String stateId;
  late final String createdAt;
  late final String updatedAt;

  Responsed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateId = json['state_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['state_id'] = stateId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
