import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/CalendarData.dart';

class AppointmentBox extends StatefulWidget {
  final double topVal;
  final Color color;
  final double duration;
  final String text;

  AppointmentBox({Key key, this.topVal, this.color, this.duration, this.text})
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
  int lastResult = -1;

  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    flexTopInit = widget.topVal;
    flexTop = widget.topVal;
    print("init flexTop = " + flexTop.toString());

    _controller.addListener(() {
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
          int stepper = 24;
          int result = details.localOffsetFromOrigin.dy ~/ stepper;
          if (result != lastResult) {
            print("stepper=$result");
            setState(() {
              flexTop = result * stepper + flexTopInit;
              print(flexTop);
            });
          }
          lastResult = result;
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
              border: Border.all(color: Colors.blueAccent)),
          width: 100,
          height: widget.duration,
        ),
      ),
      top: flexTop,
    );
  }
}
