import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: M()
    );
  }
}

class M extends StatefulWidget {
  @override
  _M createState() => _M();
}

class _M extends State<M> {
  GlobalKey<ScaffoldState> sk = GlobalKey<ScaffoldState>();
  List<String> m = ['Accessories','Trousers','Jacket','Shoes','Coat','More'];
  double a = 120.0;
  double b = 60.0;
  double c = 50.0;
  double d = 0;
  double e = 60.0;
  double s;

  List q(){
    List<Widget> q = List();
    q.add(SizedBox(height: c+20.0));
    int p = 0;
    m.forEach((f){q.add(Expanded(
      child: Material(
        color: Color.fromRGBO(238,228,219,1.0),
        child: InkWell(
          onTap: (){sk.currentState.showSnackBar(SnackBar(content: Text('$f')));},
          child: Center(
            child: Text(f, style: TextStyle(fontSize: 36.0-2*p++, fontFamily: 'T'))
          )
        )
      )
    ));});
    q.add(SizedBox(height: 2*e));
    return q;
  }

  @override
  Widget build(BuildContext context) {
    s = MediaQuery.of(context).size.width/2;
    return Scaffold(
      key: sk,
      backgroundColor: Color.fromRGBO(238,228,219,1.0),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: a,
              child: Center(
                child: Text(
                  'Men\'s',
                  style: TextStyle(fontSize: 60.0, fontFamily: 'T')
                ),
              ),
            ),
            SizedBox(height: b),
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Column(children: q()),
                  Row(
                    children: [
                      Expanded(
                        child: Transform(
                          transform: Matrix4.skewY(atan((c+d+e/2)/s)),
                          child: Container(color: Color.fromRGBO(107,86,81,1.0))
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: c+d+e/2),
                        width: 2.0,
                        color: Color.fromRGBO(95,75,71,1.0)
                      ),
                      Expanded(
                        child: Transform(
                          alignment: FractionalOffset.center,
                          transform: Matrix4.rotationY(pi),
                          child: Transform(
                            transform: Matrix4.skewY(atan((c+d+e/2)/s)),
                            child: Container(color: Color.fromRGBO(107,86,81,1.0))
                          )
                        )
                      )
                    ]
                  ),
                  Transform.translate(
                    offset: Offset(0.0, c+d),
                    child: Container(
                      width: 50.0,
                      height: e,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        color: Color.fromRGBO(62,5,11,1.0)
                      ),
                      child: GestureDetector(
                        onVerticalDragUpdate: (details){
                          setState(() {
                            d = details.globalPosition.dy < a+b+c+e ? 0 : details.globalPosition.dy-a-b-c-e;
                          });
                        }
                      )
                    )
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}