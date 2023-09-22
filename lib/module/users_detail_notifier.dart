import 'package:flutter/material.dart';
import 'package:web_flutter_demo/models/index.dart';
import 'package:web_flutter_demo/repository/users_repository.dart';

class UserDetailNotofier extends ChangeNotifier {
  final BuildContext context;
  final Function reload;
  final UsersModel users;
  UserDetailNotofier(this.context, this.reload, this.users) {
    getUsers();
  }
  getUsers() {
    nama.text = users.nama;
    phone.text = users.phone;
    email.text = users.email;
    notifyListeners();
  }

  TextEditingController nama = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  final keyForm = GlobalKey<FormState>();

  cek() {
    if (keyForm.currentState!.validate()) {
      simpan();
    }
  }

  var isLoading = false;
  String? error;
  simpan() async {
    isLoading = true;
    notifyListeners();
    UserRepository.Update(users.id, nama.text, phone.text, email.text)
        .then((value) {
      if (value['value'] == 1) {
        isLoading = false;
        nama.clear();
        phone.clear();
        email.clear();
        reload();
        error = value['message'];
        notifyListeners();
      } else {
        isLoading = false;
        error = value['message'];
        notifyListeners();
      }
    });
  }

  delete() async {
    isLoading = true;
    notifyListeners();
    UserRepository.Delete(users.id).then((value) {
      if (value['value'] == 1) {
        isLoading = false;
        nama.clear();
        phone.clear();
        email.clear();
        reload();
        error = value['message'];
        notifyListeners();
      } else {
        isLoading = false;
        error = value['message'];
        notifyListeners();
      }
    });
  }
}
