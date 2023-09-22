import 'package:web_flutter_demo/module/tambah_users_page.dart';

const url = "http://localhost/workshop_flutter/api";

class NetworkURL {
  // ignore: non_constant_identifier_names
  static String TambahUser() {
    return "$url/insert.php";
  }

  static String getUsers() {
    return "$url/get_users.php";
  }

  static String updateUsers() {
    return "$url/update_users.php";
  }

  static String deleteUsers() {
    return "$url/delete_users.php";
  }
}
