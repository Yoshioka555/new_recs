import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../user/email_reset_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/link.dart';

import '../login/login_page.dart';
import '../user/edit_user_page.dart';
import 'drawer_model.dart';

class UserDrawer extends StatelessWidget {
  // 定数コンストラクタ
  const UserDrawer({Key? key,}) : super(key: key);

  // build()
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DrawerModel>(
      create: (_) => DrawerModel()..fetchUserList(),
      child: Drawer(
        backgroundColor: Colors.white,
        child: Consumer<DrawerModel>(builder: (context, model, child) {
          return ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                    color: Colors.yellow
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Menu&MyAccount',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Expanded(
                      child: Text('UserName：${model.name}',),
                    ),
                    Expanded(
                      child: Text('Group：${model.group}',),
                    ),
                    Expanded(
                      child: Text('Grade：${model.grade}',),
                    ),
                    Expanded(child: Text('Email：${model.email}',),
                    ),
                    Expanded(child: Text('出席状況：${model.status}',),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: TextButton.icon(
                  icon: const Icon(
                    Icons.logout_outlined,
                  ),
                  onPressed: () async {
                    try {
                      showDialog(
                          context: context,
                          builder: (_) => CupertinoAlertDialog(
                            title: const Text("ログアウトしますか？"),
                            actions: [
                              CupertinoDialogAction(
                                  isDestructiveAction: true,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel')),
                              CupertinoDialogAction(
                                child: const Text('OK'),
                                onPressed: () {
                                  FirebaseAuth.instance.signOut();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) {
                                          return const LoginPage();
                                        }
                                    ),
                                  );
                                  const snackBar = SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text('ログアウトしました'),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                },
                              )
                            ],
                          ));

                    } catch (e) {
                      //失敗した場合
                      final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(e.toString()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  label: const Text('ログアウト'),
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                title: TextButton.icon(
                  onPressed: () async {
                    //メールアドレスとパスワード変更ページに遷移
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) {
                            return const EmailResetPage();
                          }
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.email_rounded,
                  ),
                  label: const Text('Email変更'),
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                title: TextButton.icon(
                  onPressed: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) {
                            return EditMyPage(name: model.name, group: model.group, grade: model.grade, userImage: model.imgURL,);
                          }
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.manage_accounts,
                  ),
                  label: const Text('アカウント情報変更'),
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Link(
                  // 開きたいWebページのURLを指定
                  uri: Uri.parse('https://p.al.kansai-u.ac.jp/'),
                  // targetについては後述
                  target: LinkTarget.self,
                  builder: (BuildContext ctx, FollowLink? openLink) {
                    return TextButton.icon(
                      onPressed: openLink,
                      label: const Text(
                        'Polemanage',
                      ),
                      icon: const Icon(Icons.poll),
                    );
                  },
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Link(
                  // 開きたいWebページのURLを指定
                  uri: Uri.parse('https://al.kansai-u.ac.jp/'),
                  // targetについては後述
                  target: LinkTarget.self,
                  builder: (BuildContext ctx, FollowLink? openLink) {
                    return TextButton.icon(
                      onPressed: openLink,
                      label: const Text(
                        '研究室ホームページ',
                      ),
                      icon: const Icon(Icons.home),
                    );
                  },
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
            ],
          );
        }),
      ),
    );
  }
}


