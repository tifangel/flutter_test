import 'package:flutter/material.dart';
import 'package:myflutterapp/model/place.dart';
import 'package:myflutterapp/utility/constants.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key? key, required this.item}) : super(key: key);

  final Place item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
              child: Image.network(
            item.image,
            fit: BoxFit.cover,
            width: 200,
          )),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    item.content,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: bodyTextColor),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
