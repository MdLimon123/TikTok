import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/Model/user_model.dart';
import 'package:tiktok_clone/Route/route.dart';
import 'package:tiktok_clone/Screens/Auth/login_screen.dart';
import 'package:tiktok_clone/Screens/HomeScreen/home_screen.dart';
import 'package:tiktok_clone/const.dart';

class AuthController extends GetxController {
  late Rx<File?> _pickedImage;

  late Rx<User?> user;

  var isLoading = false.obs;

  File? get profilePhoto => _pickedImage.value;

  @override
  void onReady() {
    super.onReady();
    user = Rx<User?>(firebaseAuth.currentUser);
    user.bindStream(firebaseAuth.authStateChanges());
    ever(user, setInitalScreen);
    print(firebaseAuth.currentUser);
  }

  setInitalScreen(User? user) {
    if (user == null) {
      Get.offAll(LoginScreen());
    } else {
      Get.offAll(HomeScreen());
    }
  }

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      Get.snackbar('Profile Picture',
          'You have successfully selected your profile picture!');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  void register(
      String userName, String email, String password, File? image) async {
    isLoading(true);
    try {
      if (userName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);

        String downloadUrl = await _uploadToStorage(image);

        UserModel userModel = UserModel(
            name: userName,
            profilePhoto: downloadUrl,
            email: email,
            uid: cred.user!.uid);

        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(userModel.toJson());
      } else {
        Get.snackbar('Error Creating Account', 'Please enter your fields');
      }
    } catch (e) {
      Get.snackbar('Error Creating Account', e.toString());
    } finally {
      isLoading(false);
    }
  }

  void loginUser(String email, String password) async {
    isLoading(true);
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        print('log success');
      } else {
        Get.snackbar('Error Logging in', 'Please enter all the fields');
      }
    } catch (e) {
      Get.snackbar('Error Logging in', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
