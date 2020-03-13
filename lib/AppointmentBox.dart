import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/CalendarData.dart';

class AppointmentBox extends StatefulWidget {
  final double topVal;
  final Color color;
  final double height;
  final String text;

  AppointmentBox({Key key, this.topVal, this.color, this.height, this.text})
      : super(key: key);

  @override
  _AppointmentBoxState createState() => _AppointmentBoxState();
}

class _AppointmentBoxState extends State<AppointmentBox>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  // Alignment _dragAlignment = Alignment.topCenter;
  Animation<Alignment> _animation;
  double flexTop;
  double flexTopInit;

  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    flexTopInit = widget.topVal;
    flexTop = widget.topVal;
    print("init flexTop = " + flexTop.toString());

    _controller.addListener(() {
      // setState(() {
      //   _dragAlignment = _animation.value;
      // });
      print(_animation.value);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: GestureDetector(
        onLongPressMoveUpdate: (details) {
          var result = details.localOffsetFromOrigin.dy ~/ 20;
          if (result != 0) {
            setState(() {
              flexTop = result * 20 + flexTopInit;
            });
          }
        },
        onLongPressEnd: (details) {
          setState(() {
            flexTopInit = flexTop;
          });
        },
        onTap: () {
          print("widget.text = " + widget.text);
          Provider.of<CalendarData>(context, listen: false)
              .setText(widget.text);

          Scaffold.of(context).openDrawer();
        },
        onDoubleTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Form(
                  // key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          child: Text(widget.text),
                          onPressed: () {
                            // if (_formKey.currentState.validate()) {
                            //   _formKey.currentState.save();
                            // }
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
          print(widget.text);
        },
        child: Container(
          child: Center(child: Text(widget.text)),
          decoration: new BoxDecoration(
            color: widget.color,
            borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
          ),
          width: 120,
          height: widget.height,
        ),
      ),
      top: flexTop,
    );
  }
}
