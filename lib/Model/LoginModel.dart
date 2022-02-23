class LoginResponse {
  LoginResponse({
    required this.status,
    required this.message,
  });
  late final String status;
  late final String message;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
  LoginResponse.fromError(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;

    return _data;
  }
}

class UserDetails {
  UserDetails({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.companyName,
    this.avtar,
    required this.coverImage,
    required this.website,
    required this.email,
    required this.phone,
    required this.address,
    required this.msgEmail,
    required this.socialSiteLinks,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isVerify,
    required this.package,
    required this.subscriptionStatus,
    required this.isActive,
    this.imagePath,
  });
  late final int id;
  late final String? name;
  late final String firstName;
  late final String lastName;
  late final String companyName;
  late final String? avtar;
  late final String coverImage;
  late final String website;
  late final String email;
  late final int phone;

  late final String address;
  late final int msgEmail;
  late final String socialSiteLinks;
  late final String emailVerifiedAt;
  late final String createdAt;
  late final String updatedAt;
  late final int isVerify;
  late final int package;
  late final String subscriptionStatus;

  late final String isActive;
  late final String? imagePath;

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    companyName = json['company_name'];
    avtar = json['avtar'];
    coverImage = json['cover_image'];
    website = json['website'];
    email = json['email'];
    phone = json['phone'];

    address = json['address'];
    msgEmail = json['msg_email'];
    socialSiteLinks = json['social_site_links'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isVerify = json['is_verify'];
    package = json['package'];
    subscriptionStatus = json['subscription_status'];

    isActive = json['is_active'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['company_name'] = companyName;
    _data['avtar'] = avtar;
    _data['cover_image'] = coverImage;
    _data['website'] = website;
    _data['email'] = email;
    _data['phone'] = phone;

    _data['address'] = address;
    _data['msg_email'] = msgEmail;
    _data['social_site_links'] = socialSiteLinks;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['is_verify'] = isVerify;
    _data['package'] = package;
    _data['subscription_status'] = subscriptionStatus;

    _data['is_active'] = isActive;
    _data['image_path'] = imagePath;
    return _data;
  }
}
