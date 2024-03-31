import 'package:fodoq/common/models/response_model.dart';
import 'package:fodoq/features/profile/domain/models/userinfo_model.dart';
import 'package:fodoq/interface/repository_interface.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileRepositoryInterface extends RepositoryInterface {
  Future<ResponseModel> updateProfile(
      UserInfoModel userInfoModel, XFile? data, String token);
  Future<ResponseModel> changePassword(UserInfoModel userInfoModel);
}
