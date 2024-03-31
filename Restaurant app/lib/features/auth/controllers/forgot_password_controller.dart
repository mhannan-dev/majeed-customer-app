import 'package:fodoq_restaurant/common/models/response_model.dart';
import 'package:fodoq_restaurant/common/widgets/custom_snackbar_widget.dart';
import 'package:fodoq_restaurant/features/auth/domain/services/forgot_password_service_interface.dart';
import 'package:fodoq_restaurant/features/profile/domain/models/profile_model.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController implements GetxService {
  final ForgotPasswordServiceInterface forgotPasswordServiceInterface;
  ForgotPasswordController({required this.forgotPasswordServiceInterface});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _verificationCode = '';
  String get verificationCode => _verificationCode;

  Future<ResponseModel> forgotPassword(String? email) async {
    _isLoading = true;
    update();
    ResponseModel responseModel =
        await forgotPasswordServiceInterface.forgotPassword(email);
    _isLoading = false;
    update();
    return responseModel;
  }

  void updateVerificationCode(String query) {
    _verificationCode = query;
    update();
  }

  Future<ResponseModel> verifyToken(String? email) async {
    _isLoading = true;
    update();
    ResponseModel responseModel = await forgotPasswordServiceInterface
        .verifyToken(email, _verificationCode);
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<bool> changePassword(
      ProfileModel updatedUserModel, String password) async {
    _isLoading = true;
    update();
    bool isSuccess;
    bool success = await forgotPasswordServiceInterface.changePassword(
        updatedUserModel, password);
    _isLoading = false;
    if (success) {
      Get.back();
      showCustomSnackBar('password_updated_successfully'.tr, isError: false);
      isSuccess = true;
    } else {
      isSuccess = false;
    }
    update();
    return isSuccess;
  }

  Future<ResponseModel> resetPassword(String? resetToken, String? email,
      String password, String confirmPassword) async {
    _isLoading = true;
    update();
    ResponseModel responseModel = await forgotPasswordServiceInterface
        .resetPassword(resetToken, email, password, confirmPassword);
    _isLoading = false;
    update();
    return responseModel;
  }
}
