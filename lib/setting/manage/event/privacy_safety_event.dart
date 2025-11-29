abstract class PrivacySafetyEvent {}

class GetInitialData extends PrivacySafetyEvent {}

class BackCall extends PrivacySafetyEvent {}

class CallDataSave extends PrivacySafetyEvent {}

class onChangeCall extends PrivacySafetyEvent {
  bool? hideLocation;

  bool? protectProfilePhoto;

  bool? personalDataHide;

  onChangeCall({
    this.hideLocation,
    this.protectProfilePhoto,
    this.personalDataHide,

  });
}

