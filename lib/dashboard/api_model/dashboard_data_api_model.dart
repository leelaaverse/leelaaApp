class DashBoardDataApiModel {
  Data? data;
  bool? success;
  String? message;
  int? status;

  DashBoardDataApiModel({this.data, this.success, this.message, this.status});

  DashBoardDataApiModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['success'] = this.success;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? totalInvoices;
  int? totalCustomers;
  int? totalPrescriptions;
  int? pendingInvoices;
  List<RecentCustomers>? recentCustomers;

  Data({
    this.totalInvoices,
    this.totalCustomers,
    this.totalPrescriptions,
    this.pendingInvoices,
    this.recentCustomers,
  });

  Data.fromJson(Map<String, dynamic> json) {
    totalInvoices = json['totalInvoices'];
    totalCustomers = json['totalCustomers'];
    totalPrescriptions = json['totalPrescriptions'];
    pendingInvoices = json['pendingInvoices'];
    if (json['recentCustomers'] != null) {
      recentCustomers = <RecentCustomers>[];
      json['recentCustomers'].forEach((v) {
        recentCustomers!.add(new RecentCustomers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalInvoices'] = this.totalInvoices;
    data['totalCustomers'] = this.totalCustomers;
    data['totalPrescriptions'] = this.totalPrescriptions;
    data['pendingInvoices'] = this.pendingInvoices;
    if (this.recentCustomers != null) {
      data['recentCustomers'] =
          this.recentCustomers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecentCustomers {
  Address? address;
  EyeDetails? eyeDetails;
  String? sId;
  String? name;
  String? phone;
  String? email;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;

  RecentCustomers({
    this.address,
    this.eyeDetails,
    this.sId,
    this.name,
    this.phone,
    this.email,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  RecentCustomers.fromJson(Map<String, dynamic> json) {
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    eyeDetails =
    json['eyeDetails'] != null
        ? new EyeDetails.fromJson(json['eyeDetails'])
        : null;
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.eyeDetails != null) {
      data['eyeDetails'] = this.eyeDetails!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Address {
  String? street;
  String? city;
  String? state;
  String? zipCode;
  String? country;

  Address({this.street, this.city, this.state, this.zipCode, this.country});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zipCode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipCode'] = this.zipCode;
    data['country'] = this.country;
    return data;
  }
}

class EyeDetails {
  RightEye? rightEye;
  RightEye? leftEye;
  String? notes;

  EyeDetails({this.rightEye, this.leftEye, this.notes});

  EyeDetails.fromJson(Map<String, dynamic> json) {
    rightEye =
    json['rightEye'] != null
        ? new RightEye.fromJson(json['rightEye'])
        : null;
    leftEye =
    json['leftEye'] != null ? new RightEye.fromJson(json['leftEye']) : null;
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rightEye != null) {
      data['rightEye'] = this.rightEye!.toJson();
    }
    if (this.leftEye != null) {
      data['leftEye'] = this.leftEye!.toJson();
    }
    data['notes'] = this.notes;
    return data;
  }
}

class RightEye {
  String? sphere;
  String? cylinder;
  String? axis;
  String? add;
  String? pd;

  RightEye({this.sphere, this.cylinder, this.axis, this.add, this.pd});

  RightEye.fromJson(Map<String, dynamic> json) {
    sphere = json['sphere'];
    cylinder = json['cylinder'];
    axis = json['axis'];
    add = json['add'];
    pd = json['pd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sphere'] = this.sphere;
    data['cylinder'] = this.cylinder;
    data['axis'] = this.axis;
    data['add'] = this.add;
    data['pd'] = this.pd;
    return data;
  }
}
