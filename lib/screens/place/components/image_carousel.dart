import 'package:flutter/material.dart';
import 'package:myflutterapp/model/place.dart';
import 'package:myflutterapp/utility/constants.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Place item;

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AspectRatio(
        aspectRatio: 1.81,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            PageView.builder(
                itemCount: widget.item.media.length,
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                itemBuilder: (context, index) => ClipRRect(
                      child: Image.network(
                        widget.item.media[index],
                        fit: BoxFit.cover,
                      ),
                    )),
            Positioned(
              bottom: defaultPadding,
              right: defaultPadding,
              child: Row(
                children: List.generate(
                    widget.item.media.length,
                    (index) => Padding(
                          padding:
                              const EdgeInsets.only(left: defaultPadding / 4),
                          child: IndicatorDot(isActive: index == _currentIndex),
                        )),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: defaultPadding),
        child: Text(
          widget.item.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: defaultPadding),
        child: Text(
          widget.item.content,
          style: const TextStyle(color: bodyTextColor),
        ),
      ),
    ]);
  }
}

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white38,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
