import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Users {
  String address;
  String backgroundPicture;
  String email;
  String firstAndLastName;
  String id;
  bool isBuyer;
  String joinDate;
  String phoneNumber;
  String profilePicture;
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/users.txt');
}

Future<Users> readUser() async {
  try {
    final file = await _localFile;

    // Read the file
    Users contents = (await file.readAsString()) as Users;

    return contents;
  } catch (e) {
    // If encountering an error, return 0
    return null;
  }
}

createUser() {}

bool isUserAdded() {}
