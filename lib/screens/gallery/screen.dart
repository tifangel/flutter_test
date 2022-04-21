import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myflutterapp/model/gallery.dart';
import 'package:myflutterapp/utility/app_url.dart';
import 'package:myflutterapp/utility/constants.dart';
import 'package:myflutterapp/components/search_box.dart';

import 'components/card_item.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  late Future<List<Gallery>> listGallery;

  Future<List<Gallery>> fetchList() async {
    final response = await http.get(Uri.parse(AppUrl.gallery));
    final res = jsonDecode(response.body);
    if (res['status_code'] == 200) {
      List<Gallery> values =
          List<Gallery>.from(res['data'].map((data) => Gallery.fromJson(data)));
      return values;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    listGallery = fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        SearchBox(
          onChanged: (String value) {},
        ),
        Expanded(
          child: FutureBuilder<List<Gallery>>(
              future: listGallery,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.count(
                    crossAxisCount: 3,
                    padding: EdgeInsets.all(defaultPadding),
                    crossAxisSpacing: defaultPadding,
                    children: List.generate(
                        snapshot.data!.length,
                        (index) =>
                            CardItem(image: snapshot.data![index].image)),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ],
    ));
  }
}
