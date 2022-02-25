class FarmerListResponse {
  FarmerListResponse({
    required this.status,
    required this.response,
  });
  late final String status;
  late final List<Response> response;

  FarmerListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response =
        List.from(json['response']).map((e) => Response.fromJson(e)).toList();
  }

  FarmerListResponse.fromError(Map<String, dynamic> json) {
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
  late final id;
  late final name;
  late final aadharNumber;
  late final phoneNumber;
  late final pinCode;
  late final districtId;
  late final mandalId;
  late final villageId;
  late final parliamentConstituencyId;
  late final assemblyConstituencyId;
  late final createdAt;
  late final updatedAt;

  Response.fromJson(Map<String, dynamic> json) {
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
