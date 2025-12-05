class UserLoginModel {
  bool? success;
  String? message;
  Data? data;

  UserLoginModel({this.success, this.message, this.data});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? accessToken;
  String? refreshToken;

  Data({this.user, this.accessToken, this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}

class User {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  Null? avatar;
  Null? bio;
  Null? location;
  Null? website;
  Null? coverImage;
  Null? phoneNumber;
  Null? dateOfBirth;
  Null? twitterLink;
  Null? instagramLink;
  Null? linkedinLink;
  Null? githubLink;
  Null? discordLink;
  Null? googleId;
  List<Null>? oauthProviders;
  String? role;
  bool? isEmailVerified;
  Null? emailVerificationToken;
  Null? emailVerificationExpires;
  Null? passwordResetToken;
  Null? passwordResetExpires;
  String? lastLogin;
  int? loginAttempts;
  Null? lockUntil;
  bool? isActive;
  bool? isBanned;
  Null? banReason;
  Null? banExpiresAt;
  int? totalCreations;
  String? totalEarnings;
  int? coinBalance;
  int? totalCoinsEarned;
  int? totalCoinsSpent;
  Null? subscriptionTier;
  Null? subscriptionStatus;
  Null? subscriptionStartDate;
  Null? subscriptionEndDate;
  Null? subscriptionRenewalDate;
  int? monthlyGenerationsUsed;
  int? monthlyGenerationsLimit;
  int? dailyGenerationsUsed;
  int? dailyGenerationsLimit;
  Null? generationResetDate;
  Null? notificationSettings;
  Null? privacySettings;
  Null? displaySettings;
  String? verificationStatus;
  List<Null>? verificationDocuments;
  Null? verifiedAt;

  User({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.avatar,
    this.bio,
    this.location,
    this.website,
    this.coverImage,
    this.phoneNumber,
    this.dateOfBirth,
    this.twitterLink,
    this.instagramLink,
    this.linkedinLink,
    this.githubLink,
    this.discordLink,
    this.googleId,
    this.oauthProviders,
    this.role,
    this.isEmailVerified,
    this.emailVerificationToken,
    this.emailVerificationExpires,
    this.passwordResetToken,
    this.passwordResetExpires,
    this.lastLogin,
    this.loginAttempts,
    this.lockUntil,
    this.isActive,
    this.isBanned,
    this.banReason,
    this.banExpiresAt,
    this.totalCreations,
    this.totalEarnings,
    this.coinBalance,
    this.totalCoinsEarned,
    this.totalCoinsSpent,
    this.subscriptionTier,
    this.subscriptionStatus,
    this.subscriptionStartDate,
    this.subscriptionEndDate,
    this.subscriptionRenewalDate,
    this.monthlyGenerationsUsed,
    this.monthlyGenerationsLimit,
    this.dailyGenerationsUsed,
    this.dailyGenerationsLimit,
    this.generationResetDate,
    this.notificationSettings,
    this.privacySettings,
    this.displaySettings,
    this.verificationStatus,
    this.verificationDocuments,
    this.verifiedAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    bio = json['bio'];
    location = json['location'];
    website = json['website'];
    coverImage = json['coverImage'];
    phoneNumber = json['phoneNumber'];
    dateOfBirth = json['dateOfBirth'];
    twitterLink = json['twitterLink'];
    instagramLink = json['instagramLink'];
    linkedinLink = json['linkedinLink'];
    githubLink = json['githubLink'];
    discordLink = json['discordLink'];
    googleId = json['googleId'];
    if (json['oauthProviders'] != null) {
      oauthProviders = <Null>[];
      json['oauthProviders'].forEach((v) {
        oauthProviders!.add(v);
      });
    }
    role = json['role'];
    isEmailVerified = json['isEmailVerified'];
    emailVerificationToken = json['emailVerificationToken'];
    emailVerificationExpires = json['emailVerificationExpires'];
    passwordResetToken = json['passwordResetToken'];
    passwordResetExpires = json['passwordResetExpires'];
    lastLogin = json['lastLogin'];
    loginAttempts = json['loginAttempts'];
    lockUntil = json['lockUntil'];
    isActive = json['isActive'];
    isBanned = json['isBanned'];
    banReason = json['banReason'];
    banExpiresAt = json['banExpiresAt'];
    totalCreations = json['totalCreations'];
    totalEarnings = json['totalEarnings'];
    coinBalance = json['coinBalance'];
    totalCoinsEarned = json['totalCoinsEarned'];
    totalCoinsSpent = json['totalCoinsSpent'];
    subscriptionTier = json['subscriptionTier'];
    subscriptionStatus = json['subscriptionStatus'];
    subscriptionStartDate = json['subscriptionStartDate'];
    subscriptionEndDate = json['subscriptionEndDate'];
    subscriptionRenewalDate = json['subscriptionRenewalDate'];
    monthlyGenerationsUsed = json['monthlyGenerationsUsed'];
    monthlyGenerationsLimit = json['monthlyGenerationsLimit'];
    dailyGenerationsUsed = json['dailyGenerationsUsed'];
    dailyGenerationsLimit = json['dailyGenerationsLimit'];
    generationResetDate = json['generationResetDate'];
    notificationSettings = json['notificationSettings'];
    privacySettings = json['privacySettings'];
    displaySettings = json['displaySettings'];
    verificationStatus = json['verificationStatus'];
    if (json['verificationDocuments'] != null) {
      verificationDocuments = <Null>[];
      json['verificationDocuments'].forEach((v) {
        verificationDocuments!.add(v);
      });
    }
    verifiedAt = json['verifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['bio'] = this.bio;
    data['location'] = this.location;
    data['website'] = this.website;
    data['coverImage'] = this.coverImage;
    data['phoneNumber'] = this.phoneNumber;
    data['dateOfBirth'] = this.dateOfBirth;
    data['twitterLink'] = this.twitterLink;
    data['instagramLink'] = this.instagramLink;
    data['linkedinLink'] = this.linkedinLink;
    data['githubLink'] = this.githubLink;
    data['discordLink'] = this.discordLink;
    data['googleId'] = this.googleId;
    if (this.oauthProviders != null) {
      data['oauthProviders'] = this.oauthProviders!.map((v) => v).toList();
    }
    data['role'] = this.role;
    data['isEmailVerified'] = this.isEmailVerified;
    data['emailVerificationToken'] = this.emailVerificationToken;
    data['emailVerificationExpires'] = this.emailVerificationExpires;
    data['passwordResetToken'] = this.passwordResetToken;
    data['passwordResetExpires'] = this.passwordResetExpires;
    data['lastLogin'] = this.lastLogin;
    data['loginAttempts'] = this.loginAttempts;
    data['lockUntil'] = this.lockUntil;
    data['isActive'] = this.isActive;
    data['isBanned'] = this.isBanned;
    data['banReason'] = this.banReason;
    data['banExpiresAt'] = this.banExpiresAt;
    data['totalCreations'] = this.totalCreations;
    data['totalEarnings'] = this.totalEarnings;
    data['coinBalance'] = this.coinBalance;
    data['totalCoinsEarned'] = this.totalCoinsEarned;
    data['totalCoinsSpent'] = this.totalCoinsSpent;
    data['subscriptionTier'] = this.subscriptionTier;
    data['subscriptionStatus'] = this.subscriptionStatus;
    data['subscriptionStartDate'] = this.subscriptionStartDate;
    data['subscriptionEndDate'] = this.subscriptionEndDate;
    data['subscriptionRenewalDate'] = this.subscriptionRenewalDate;
    data['monthlyGenerationsUsed'] = this.monthlyGenerationsUsed;
    data['monthlyGenerationsLimit'] = this.monthlyGenerationsLimit;
    data['dailyGenerationsUsed'] = this.dailyGenerationsUsed;
    data['dailyGenerationsLimit'] = this.dailyGenerationsLimit;
    data['generationResetDate'] = this.generationResetDate;
    data['notificationSettings'] = this.notificationSettings;
    data['privacySettings'] = this.privacySettings;
    data['displaySettings'] = this.displaySettings;
    data['verificationStatus'] = this.verificationStatus;
    if (this.verificationDocuments != null) {
      data['verificationDocuments'] = this.verificationDocuments!
          .map((v) => v)
          .toList();
    }
    data['verifiedAt'] = this.verifiedAt;
    return data;
  }
}
