class GetMondalResponse {
  GetMondalResponse({
    required this.status,
    required this.response,
  });
  late final String status;
  late final List<Responsem> response;
  
  GetMondalResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    response = List.from(json['response']).map((e)=>Responsem.fromJson(e)).toList();
  }
GetMondalResponse.fromError(Map<String, dynamic> json){
    status = json['status'];
   
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['response'] = response.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Responsem {
  Responsem({
    required this.id,
    required this.districtId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int districtId;
  late final String name;
  late final String createdAt;
  late final String updatedAt;
  
  Responsem.fromJson(Map<String, dynamic> json){
    id = json['id'];
    districtId = json['district_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['district_id'] = districtId;
    _data['name'] = name;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}