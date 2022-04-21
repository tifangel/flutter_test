import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myflutterapp/utility/constants.dart';
import 'package:myflutterapp/model/user.dart';
import 'package:myflutterapp/utility/app_url.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<User> user;

  Future<User> fetchUser() async {
    final response = await http.get(Uri.parse(AppUrl.dataUser));
    final res = jsonDecode(response.body);
    if (res['status_code'] == 200) {
      // List<User> values = List<User>.from(
      //     json.decode(response.body).map((data) => User.fromJson(data)));
      return User.fromJson(res['data']);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    user = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User>(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: defaultPadding * 2),
                          child: CircleAvatar(
                            radius: 48,
                            backgroundImage:
                                NetworkImage(snapshot.data!.avatar),
                          ),
                        ),
                        Text(snapshot.data!.fullname),
                        Text(snapshot.data!.email),
                        Text(snapshot.data!.phone),
                      ]));
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
