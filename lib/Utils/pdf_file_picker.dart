
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:hamilton_base_project/Utils/utils.dart';
import 'package:hamilton_base_project/main.dart';

class PdfFilePicker {

  RxString? authorizedSignatory = ''.obs;
  RxString? civilID = ''.obs;
  RxString? companyBusinessLicense = ''.obs;

  Future<void> pickFile(int fileCode) async {

    if(fileCode == 0) {
      authorizedSignatory?.value = '';
    } else if(fileCode == 1) {
      civilID?.value = '';
    }  else if(fileCode == 2) {
      companyBusinessLicense?.value = '';
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {

      String fileExtension = result.files.single.extension ?? "";
      if(fileExtension.isEmpty || !(fileExtension.endsWith("pdf"))) {
        Utils.message(
          title: "Upload Error".tr,
          body: "Only pdf file is allowed to select.".tr,
          error: true,
        );
        return;
      }

      String path = result.files.single.path ?? '';
      String fileName = result.files.single.name;
      switch(fileCode) {
        case 0:
          localStorage.authSignWithFilePath.val = path;
          authorizedSignatory?.value = fileName;
          break;
        case 1:
          localStorage.civilIDWithFilePath.val = path;
          civilID?.value = fileName;
          break;
        case 2:
          localStorage.compBusiLicWithFilePath.val = path;
          companyBusinessLicense?.value = fileName;
          break;
      }
    }
    else {
      // Utils.msg("File Selection", "Didn't select file.");
    }

  }

}
