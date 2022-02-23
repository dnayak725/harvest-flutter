class FarmerAddResponse {
  FarmerAddResponse({
    required this.status,
    required this.response,
    required this.message,
  });
  late final String status;
  late final Response response;
  late final String message;

  FarmerAddResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = Response.fromJson(json['response']);
    message = json['message'];
  }
  FarmerAddResponse.fromError(Map<String, dynamic> json) {
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
    required this.name,
    required this.aadharNumber,
    required this.phoneNumber,
    required this.pinCode,
    required this.districtId,
    required this.mandalId,
    required this.villageId,
    required this.assemblyConstituencyId,
    required this.parliamentConstituencyId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  late final String name;
  late final String aadharNumber;
  late final String phoneNumber;
  late final String pinCode;
  late final String districtId;
  late final String mandalId;
  late final String villageId;
  late final String assemblyConstituencyId;
  late final String parliamentConstituencyId;
  late final String updatedAt;
  late final String createdAt;
  late final int id;

  Response.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    aadharNumber = json['aadhar_number'];
    phoneNumber = json['phone_number'];
    pinCode = json['pin_code'];
    districtId = json['district_id'];
    mandalId = json['mandal_id'];
    villageId = json['village_id'];
    assemblyConstituencyId = json['assembly_constituency_id'];
    parliamentConstituencyId = json['parliament_constituency_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['aadhar_number'] = aadharNumber;
    _data['phone_number'] = phoneNumber;
    _data['pin_code'] = pinCode;
    _data['district_id'] = districtId;
    _data['mandal_id'] = mandalId;
    _data['village_id'] = villageId;
    _data['assembly_constituency_id'] = assemblyConstituencyId;
    _data['parliament_constituency_id'] = parliamentConstituencyId;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}
