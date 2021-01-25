import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 7.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 45,
        decoration : BoxDecoration(
          // color: Color(0xffecfafd),
          color: Color(0xff8fd3ea),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Color(0xff475ea1), offset: new Offset(2.0, 4.0),blurRadius: 4.0), 
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Search..."),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(icon: Icon(Icons.search), onPressed: null)
            )
          ]
        )
      ),
    );
  }
}