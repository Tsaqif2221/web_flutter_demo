import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter_demo/module/tambah_users_notifier.dart';

class TambahUserPage extends StatelessWidget {
  final Function reload;
  const TambahUserPage({super.key, required this.reload});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => TambahUsersNotifier(context, reload),
        child: Consumer<TambahUsersNotifier>(
            builder: (context, value, child) => SafeArea(
                    child: Scaffold(
                  body: Column(
                    children: [
                      Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        color: Colors.blueAccent,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                )),
                            const Text(
                              "Tambah User",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Form(
                              key: value.keyForm,
                              child: ListView(
                                padding: const EdgeInsets.all(16),
                                children: [
                                  TextFormField(
                                    validator: (e) {
                                      if (e!.isEmpty) {
                                        return "Wajib diisi!";
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: value.nama,
                                    decoration: const InputDecoration(
                                        labelText: "Nama Lengkap"),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  TextFormField(
                                    validator: (e) {
                                      if (e!.isEmpty) {
                                        return "Wajib diisi!";
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: value.phone,
                                    decoration: const InputDecoration(
                                        labelText: "Nomor Ponsel"),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  TextFormField(
                                    validator: (e) {
                                      if (e!.isEmpty) {
                                        return "Wajib diisi!";
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: value.email,
                                    decoration: const InputDecoration(
                                        labelText: "Email"),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      value.cek();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 12,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.blueAccent),
                                      child: const Text(
                                        "Simpan",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  value.error != null
                                      ? Text("${value.error}")
                                      : const SizedBox()
                                ],
                              )))
                    ],
                  ),
                ))));
  }
}
