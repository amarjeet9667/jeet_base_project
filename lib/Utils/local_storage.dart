
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorage extends GetxService {

  GetStorage getStorage = GetStorage();

  /// Initialize for local db...
  Future<LocalStorage> init() async {
    await GetStorage.init();
    return this;
  }

  /// Clear local db...
  void clear() async {
    await getStorage.erase();
  }

  /// variable like String, boolean, int,...
  final appLanguage = "".val('appLanguage');
  final isLoading = false.val("isLoading");
  final token = "".val("token");
  final filePath = "".val("filePath");
  final id = 8865865.val("id");

  final authSignWithFilePath = "".val("authSignWithFilePath");
  final civilIDWithFilePath = "".val("civilIDWithFilePath");
  final compBusiLicWithFilePath = "".val("compBusiLicWithFilePath");


/// variable for Object/Model...
  /// User model is store in local or eg. for use.
  // final _userProfile = UserProfileDetailModel().val("userProfile");

  // UserProfileDetailModel get userProfModel => _userProfile.val;
  // void setUserProfileData(UserProfileDetailModel userProfModel) {
  //   _userProfile.val = userProfModel;
  // }

}
