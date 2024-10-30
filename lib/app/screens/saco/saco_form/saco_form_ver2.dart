import 'package:flutter/material.dart';

class SacoFormV2 extends StatefulWidget {
  const SacoFormV2({Key? key}) : super(key: key);

  @override
  State<SacoFormV2> createState() => _SacoFormV2State();
}

class _SacoFormV2State extends State<SacoFormV2> {
  final double _headerHeight = 40.0;
  final double _maxHeight = 600.0;
  bool _isDragUp = true;
  double _bodyHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(child: Text("Custom Scrollable Bottom Sheet ")),
          Positioned(
            top: 0.0,
            child: AnimatedContainer(
                constraints: BoxConstraints(
                  maxHeight: this._maxHeight,
                  minHeight: this._headerHeight,
                ),
                curve: Curves.easeOut,
                height: this._headerHeight,
                duration: const Duration(milliseconds: 600),
                child: GestureDetector(
                  onVerticalDragUpdate: (DragUpdateDetails data) {},
                  onVerticalDragEnd: (DragEndDetails data) {},
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: _size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 2.0,
                                  blurRadius: 4.0),
                            ]),
                        height: this._headerHeight,
                        child: Text("drag me"),
                      ),
                      Expanded(
                        child: Container(
                          width: _size.width,
                          color: Colors.greenAccent,
                          alignment: Alignment.center,
                          child: Text("it worked!"),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
