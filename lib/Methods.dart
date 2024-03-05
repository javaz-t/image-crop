import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


pickImage(imageSource)async{
 XFile? file= await ImagePicker().pickImage(source: imageSource);
 File image = File(file!.path);
 if(image!=null){
   return image;
 }

}

 Future<File?> cropImage(File? image) async {
   CroppedFile? croppedFile =
   await ImageCropper().cropImage(
     sourcePath: image!.path, uiSettings: [
     AndroidUiSettings(
       toolbarColor: Colors.red,
       toolbarTitle: "Cropper",
       toolbarWidgetColor: Colors.yellow,
       initAspectRatio: CropAspectRatioPreset.square,
       lockAspectRatio: true,
         hideBottomControls:true,
         showCropGrid:true


     ),
   ],
   );

   if (croppedFile?.path != null) {
     return File(croppedFile!.path);
   } else {
     return null;
   }


}