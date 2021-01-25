import 'package:flutter/material.dart';
import '../component/exportComponent.dart';

class MenuDashboard extends StatelessWidget {
  const MenuDashboard({
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff475ea1))),
                    Row(children: [
                      Icon(Icons.add_circle_rounded,
                          color: Colors.orange),
                      Text("example@example.com",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.orange,
                          )
                        ),
                      ]
                    )
                  ],
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color(0xff48d3f2),
                    // border:  Border.all(),
                    shape: BoxShape.circle,
                    // boxShadow: <BoxShadow>[
                    //   BoxShadow(blurRadius: 5.0, spreadRadius: 2.0, color: Color(0xff475ea1),)
                    // ]
                  ),
                )
              ]
            ),
          ),

          // SEARCHING BAR
          SearchBar(),

          // MENU ICONS BUTTONS WITH GRID SYSTEM
          Expanded(
            child: GridViewCreator(),
          ),
        ],
      )
    );
  }
}
