import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

// import '/presentation/providers/view/provider_view_post.dart';
// import '../../../presentation/providers/data/provider_acaunt.dart';

class ImgPicker {
  static Future<List<String>> pickMulti(context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
      // allowedExtensions: ["txt"],
    );

    if (result != null) {
      final PlatformFile imgFile = result.files.first;
      final List<String> imgs = result.paths.map((e) => e!).toList();
      debugPrint(
          "==================================================================================================");
      // final postP = PostP.of(context, listen: false);
      // postP.addImgPath(imgFile.path!);
      // postP.addImgsPath(imgs);
      // final List<List<String>> objs = await TestConverter().txtToTest(txtFile);
      // if (objs.isEmpty) {
      //   debugPrint("txt can't convert test!!!");
      // } else {
      //   debugPrint("Test sucsessed!");
      //   ProcessTest(context).changeTest(objs);
      // }
      debugPrint(
          "==================================================================================================");
    } else {
      debugPrint("Image not selected!!!");
    }
    return [];
  }

  static Future<String?> pick(context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      // allowedExtensions: ["txt"],
    );
    String? imgPath;
    if (result != null) {
      imgPath = result.paths.first;
      debugPrint(
          "==================================================================================================");
      // final acauntP = AcauntP.of(context, listen: false);
      // postP.addImgPath(imgFile.path!);
      // acauntP.changeAvatarImg(imgPath);
      // final List<List<String>> objs = await TestConverter().txtToTest(txtFile);
      // if (objs.isEmpty) {
      //   debugPrint("txt can't convert test!!!");
      // } else {
      //   debugPrint("Test sucsessed!");
      //   ProcessTest(context).changeTest(objs);
      // }
      debugPrint(
          "==================================================================================================");
    } else {
      debugPrint("Image not selected!!!");
    }
    return imgPath;
  }
}
