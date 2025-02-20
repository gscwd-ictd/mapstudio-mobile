import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PfdfListDetail extends StatefulWidget {
  int fixtureCount;
  String fixtureName;
  String fixtureDesc;
  String fixtureImage;

  PfdfListDetail({
    super.key,
    required this.fixtureCount,
    required this.fixtureName,
    required this.fixtureDesc,
    required this.fixtureImage,
  });

  @override
  State<PfdfListDetail> createState() => _PfdfListDetailState();
}

class _PfdfListDetailState extends State<PfdfListDetail>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 2,
        color: Color.fromARGB(255, 240, 238, 238),
      ))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  widget.fixtureCount.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ClipRRect(
                child: Image(
                  image: AssetImage(widget.fixtureImage),
                  height: 75,
                  width: 75,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.fixtureName,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.fixtureDesc,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: const Image(
                        image: AssetImage("assets/images/btn_plus.png"),
                        height: 40,
                        width: 40,
                      ),
                      iconSize: 40,
                      onPressed: () {},
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: const Image(
                        image: AssetImage("assets/images/btn_minus.png"),
                        height: 40,
                        width: 40,
                      ),
                      iconSize: 40,
                      onPressed: () {},
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
