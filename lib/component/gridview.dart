import 'package:flutter/material.dart';
import 'package:kei_ss_barcodescanner/component/exportComponent.dart';

class GridViewCreator extends StatefulWidget {
  final List<Widget> menuIconWidgets;
  final int count;
  GridViewCreator({ this.count, this.menuIconWidgets});

  @override
  _GridViewCreatorState createState() => _GridViewCreatorState();
}

class _GridViewCreatorState extends State<GridViewCreator> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // return GridView(
    //   semanticChildCount: 3,
    //   primary: false,
    //   padding: EdgeInsets.symmetric(
    //     horizontal: width * .01,
    //     vertical: width * 0.06,
    //   ),
    //   // crossAxisSpacing: 10,
    //   // mainAxisSpacing: 10,
    //   // crossAxisCount: crossAxisCount,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    //   children : menuIconWidgets

    //   // itemCount: menuIconWidgets.length,
    //   // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //   //   crossAxisCount: crossAxisCount,
    //   // ),
    //   // itemBuilder: (BuildContext context, int index) {
    //   //   return menuIconWidgets.map((menuIconWidget) => menuIconWidget).toList();
    //   // },
    // );

    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            // children: menuIconWidgets
            children: <Widget>[
              MenuIcons(header: "Overview",color: Color(0xff53d3ee),icon: Icons.insert_chart),
              MenuIcons(header: "Category",color: Color(0xff4a8df5),icon: Icons.category),
              MenuIcons(header: "Category",color: Color(0xffac93fb),icon: Icons.category),
            ],
          ),
        ),
      ],
    );
  }
}
