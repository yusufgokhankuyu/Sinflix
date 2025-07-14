import 'dart:io';

abstract class ProfileEvent {}

class LoadUserProfile extends ProfileEvent {}

class UploadUserPhoto extends ProfileEvent {
  final File file;
  UploadUserPhoto(this.file);
}
