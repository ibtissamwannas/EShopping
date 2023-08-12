import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUI {
  static GetSnackBar SuccessSnackbar({title = null, String message = ""}) {
    return GetSnackBar(
      title: title,
      message: null,
      icon: const Icon(
        Icons.done,
        color: Colors.white,
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      borderRadius: 10,
    );
  }

  static GetSnackBar ErrorSnackbar({String message = ""}) {
    return GetSnackBar(
      title: null,
      message: null,
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
      icon: const Icon(
        Icons.warning,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      borderRadius: 10,
    );
  }

  static GetSnackBar ErrorSnackbarWithTitle({title = "", String message = ""}) {
    return GetSnackBar(
      title: null,
      titleText: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
      message: null,
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
      icon: const Icon(
        Icons.warning,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      borderRadius: 10,
    );
  }

  static GetSnackBar NoInternetSnackbar(
      {String title = "", String message = ""}) {
    return GetSnackBar(
      title: null,
      message: null,
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
      icon: const Icon(
        Icons.wifi_off_outlined,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      borderRadius: 10,
    );
  }
}
