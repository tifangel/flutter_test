import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myflutterapp/components/search_box.dart';
import 'package:myflutterapp/model/place.dart';
import 'package:myflutterapp/screens/place/components/image_carousel.dart';
import 'package:myflutterapp/utility/app_url.dart';
import 'package:myflutterapp/utility/constants.dart';

import 'components/card_item.dart';

class PlacePage extends StatefulWidget {
  const PlacePage({Key? key}) : super(key: key);

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  late Future<List<Place>> listPlace;

  Future<List<Place>> fetchList() async {
    final response = await http.get(Uri.parse(AppUrl.place));
    final res = jsonDecode(response.body);
    if (res['status_code'] == 200) {
      List<Place> values = List<Place>.from(
          res['data']['content'].map((data) => Place.fromJson(data)));
      return values;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    listPlace = fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SearchBox(
          onChanged: (String value) {},
        ),
        Expanded(
          child: FutureBuilder<List<Place>>(
              future: listPlace,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      padding: EdgeInsets.all(defaultPadding),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var item = snapshot.data![index];
                        if (item.type == 'image') {
                          return CardItem(item: item);
                        } else {
                          return ImageCarousel(item: item);
                        }
                      });
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ]),
    );
  }
}
