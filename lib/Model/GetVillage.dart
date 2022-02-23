class GetVillagelResponse {
  GetVillagelResponse({
    required this.status,
    required this.response,
  });
  late final String status;
  late final List<Response> response;
  
  GetVillagelResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    response = List.from(json['response']).map((e)=>Response.fromJson(e)).toList();
  }
 GetVillagelResponse.fromError(Map<String, dynamic> json){
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
    required this.mandalId,
    required this.name,
     this.createdAt,
     this.updatedAt,
  });
  late final int id;
  late final int mandalId;
  late final String name;
  late final Null createdAt;
  late final Null updatedAt;
  
  Response.fromJson(Map<String, dynamic> json){
    id = json['id'];
    mandalId = json['mandal_id'];
    name = json['name'];
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['mandal_id'] = mandalId;
    _data['name'] = name;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}