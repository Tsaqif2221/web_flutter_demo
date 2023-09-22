import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_flutter_demo/module/tambah_users_page.dart';
import 'package:web_flutter_demo/module/users_detail_page.dart';
import 'package:web_flutter_demo/module/users_notifier.dart';

class usersPage extends StatelessWidget {
  const usersPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UsersNotifier(context),
      child: Consumer<UsersNotifier>(
        builder: (context, value, child) => SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TambahUserPage(reload: () => value.getUsers())));
              },
              backgroundColor: Colors.blueAccent,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  color: Colors.blueAccent,
                  child: Row(
                    children: const [
                      Text(
                        "User Page",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      value.isLoading
                          ? SizedBox(
                              height: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("please wait.."),
                                ],
                              ),
                            )
                          : value.list.isNotEmpty
                              ? ListView.builder(
                                  itemCount: value.list.length,
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemBuilder: (context, i) {
                                    final data = value.list[i];
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: InkWell(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                UserDetailPage(
                                                    reload: () =>
                                                        value.getUsers(),
                                                    users: data),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(data.nama),
                                            Text(data.phone),
                                            Text(data.email),
                                            const Divider(
                                              thickness: 1,
                                              height: 20,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                              : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
