import 'package:flutter/material.dart';

class MenuIcons extends StatelessWidget {
  final String header;
  final Color color;
  final IconData icon;
  final Widget route;
  MenuIcons({@required this.header,@required this.color,@required this.icon, this.route});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
          child: Container(
            decoration: BoxDecoration(
              color: color.withOpacity(0.7),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: <BoxShadow>[
                BoxShadow(color: color.withOpacity(0.2), offset: Offset(2.0,6.0), blurRadius: 3.0,)
              ],
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  // color.withOpacity(0.7),
                  // color.withOpacity(0.4),
                  // color.withOpacity(0.2),
                  color.withAlpha(255),
                  color.withAlpha(220),
                  color.withAlpha(180),
                ]
              ),
              border: Border.all(color: color, width: 5.0),
            ),
            child: FlatButton(
              onPressed: (){},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon,
                    color: color,
                    size: 36.0,
                  ),
                  Text(header.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0)
                    ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
