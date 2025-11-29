class UserLoginModel {
  int? status;
  bool? success;
  String? token;
  String? phone;
  User? user;
  String? message;

  UserLoginModel({
    this.status,
    this.success,
    this.token,
    this.phone,
    this.user,
    this.message,
  });

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    token = json['token'];
    phone = json['phone'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['token'] = this.token;
    data['phone'] = this.phone;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;
  String? phone;
  String? phoneCode;
  String? role;
  String? imageId;
  bool? isVerified;
  String? lastOtpSentAt;
  String? resetPasswordToken;
  String? resetPasswordExpire;
  String? fcmToken;
  String? deviceType;
  String? createdAt;
  int? iV;

  User({
    this.sId,
    this.name,
    this.email,
    this.phone,
    this.phoneCode,
    this.role,
    this.imageId,
    this.isVerified,
    this.lastOtpSentAt,
    this.resetPasswordToken,
    this.resetPasswordExpire,
    this.fcmToken,
    this.deviceType,
    this.createdAt,
    this.iV,
  });

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    phoneCode = json['phoneCode'];
    role = json['role'];
    imageId = json['imageId'];
    isVerified = json['isVerified'];
    lastOtpSentAt = json['lastOtpSentAt'];
    resetPasswordToken = json['resetPasswordToken'];
    resetPasswordExpire = json['resetPasswordExpire'];
    fcmToken = json['fcmToken'];
    deviceType = json['deviceType'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['phoneCode'] = this.phoneCode;
    data['role'] = this.role;
    data['imageId'] = this.imageId;
    data['isVerified'] = this.isVerified;
    data['lastOtpSentAt'] = this.lastOtpSentAt;
    data['resetPasswordToken'] = this.resetPasswordToken;
    data['resetPasswordExpire'] = this.resetPasswordExpire;
    data['fcmToken'] = this.fcmToken;
    data['deviceType'] = this.deviceType;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
