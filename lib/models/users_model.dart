import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class UsersModel {

  const UsersModel({
    required this.id,
    required this.nama,
    required this.phone,
    required this.email,
  });

  final int id;
  final String nama;
  final String phone;
  final String email;

  factory UsersModel.fromJson(Map<String,dynamic> json) => UsersModel(
    id: json['id'] as int,
    nama: json['nama'].toString(),
    phone: json['phone'].toString(),
    email: json['email'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
    'phone': phone,
    'email': email
  };

  UsersModel clone() => UsersModel(
    id: id,
    nama: nama,
    phone: phone,
    email: email
  );


  UsersModel copyWith({
    int? id,
    String? nama,
    String? phone,
    String? email
  }) => UsersModel(
    id: id ?? this.id,
    nama: nama ?? this.nama,
    phone: phone ?? this.phone,
    email: email ?? this.email,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is UsersModel && id == other.id && nama == other.nama && phone == other.phone && email == other.email;

  @override
  int get hashCode => id.hashCode ^ nama.hashCode ^ phone.hashCode ^ email.hashCode;
}
