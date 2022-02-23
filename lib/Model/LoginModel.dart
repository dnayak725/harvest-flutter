class LoginResponse {
  LoginResponse({
    required this.status,
    required this.message,
    required this.userDetails,
  });
  late final String status;
  late final String message;
  late final List<UserDetails> userDetails;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userDetails = List.from(json['user_details'])
        .map((e) => UserDetails.fromJson(e))
        .toList();
  }
  LoginResponse.fromError(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['user_details'] = userDetails.map((e) => e.toJson()).toList();
    return _data;
  }
}

class UserDetails {
  UserDetails({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.role,
    required this.city,
    required this.address,
    required this.mobile,
    required this.phone,
    this.avatar,
    required this.gender,
    required this.dob,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String? emailVerifiedAt;
  late final String role;
  late final String city;
  late final String address;
  late final String mobile;
  late final String phone;
  late final String? avatar;
  late final String gender;
  late final String dob;
  late final String createdAt;
  late final String updatedAt;

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = null;
    role = json['role'];
    city = json['city'];
    address = json['address'];
    mobile = json['mobile'];
    phone = json['phone'];
    avatar = null;
    gender = json['gender'];
    dob = json['dob'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['role'] = role;
    _data['city'] = city;
    _data['address'] = address;
    _data['mobile'] = mobile;
    _data['phone'] = phone;
    _data['avatar'] = avatar;
    _data['gender'] = gender;
    _data['dob'] = dob;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
