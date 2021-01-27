import 'package:flutter/material.dart';
import 'package:kei_ss_barcodescanner/helper/bottomNavBar/exportBottomBarScreen.dart';
import 'package:kei_ss_barcodescanner/helper/class/exportClass.dart';
import 'package:kei_ss_barcodescanner/helper/component/exportComponent.dart';
import 'package:kei_ss_barcodescanner/screen/ScannerScreen.dart';
import 'package:kei_ss_barcodescanner/screen/ScannerScreen2.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _curIndex = 0;
  var result;
  // List<Widget> _widgetOptions;
  static DecodeRetMsg decode;

  // @override
  // void initState() {
  //   super.initState();

  // }

  List<BottomNavigationBarItem> _bottomNavBarItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.menu),
      label: "Menu",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.control_point),
      label: "Points",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profile",
    )
  ];

  void _changeIndex(index) {
    setState(() {
      _curIndex = index;
    });
  }

  void _floatingtoast() {
    setState(() {
      //  FToast.fcreatetoast(result.code);
    });
  }

  void runFToast(){
      decode == null || decode.status == null ? "" :
      decode.status == 1 ? FToast.fcreatetoast(msg: decode.dataMsg, backgroundColor: Colors.green) : FToast.fcreatetoast(msg: decode.dataMsg);
      DecodeRetMsg.toNull();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = [
      MenuDashboard(decode: decode),
      MenuDashboard(decode: decode),
      MenuDashboard(),
      MenuDashboard(),
    ];
    return Scaffold(
      extendBody: true,
      // appBar: AppBar(
      //   title: Text("KEI", style: TextStyle(fontStyle: FontStyle.italic))
      // ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_curIndex),
      ),

      // BARCODE SCANNER ICON DOCKED FLOTTING BUTTON
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        backgroundColor: Color(0xff31e077),
        tooltip: "Scanner",
        onPressed: () async {
          final result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => ScannerScreen()));

          // result="EW2bxX4oDaJFi7Kr8yBgC/BD9Wi9M1c/lPWKVno5R3IA";
          // result = "KO47NDEp2ft6Ug/wz4d8epSVOhSTAYUpRBRDjQFfmuA=";

          setState(() {
            decode = EncryptDecrypt.decrypt(result.code);
            // decode = EncryptDecrypt.decrypt(result);
            // _changeIndex(0);
            runFToast();
          });
          
          print("result : " + result.code);
          // print("result : " + result);
          print("decode : " + decode.dataMsg);

          // Scaffold.of(context)
          // ..removeCurrentSnackBar()
          // ..showSnackBar(SnackBar(content: Text("$result")));
        },
        child: Icon(Icons.qr_code_scanner_rounded),
      ),

      // BOTTOM NAVIGATION BAR
      // bottomNavigationBar: Container(
      //   padding: EdgeInsets.all(10.0),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(50.0),
      //     boxShadow: [
      //       BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
      //     ],
      //   ),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(50.0),
      //     child: BottomNavigationBar(
      //       currentIndex: _curIndex,
      //       items: _bottomNavBarItem,
      //       onTap: _changeIndex,
      //       ),
      //     ),
      //   ),

      // bottomNavigationBar: Container(
      //   margin: const EdgeInsets.symmetric(vertical: 8.0),
      //   child: BottomAppBar(
      //     elevation: 5.0,
      //     shape: AutomaticNotchedShape(
      //       RoundedRectangleBorder(side: BorderSide(width: 16.0),borderRadius: BorderRadius.all(Radius.circular(50))),
      //       RoundedRectangleBorder(side: BorderSide(width: 116.0), borderRadius: BorderRadius.all(Radius.circular(50)))
      //     ),
      //     notchMargin: 7,
      //     clipBehavior: Clip.antiAlias,
      //     child: Container(
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(50.0),
      //         boxShadow: [
      //           BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
      //         ],
      //       ),
      //       child: BottomNavigationBar(
      //         elevation: 5.0,
      //         currentIndex: _curIndex,
      //         items: _bottomNavBarItem,
      //         onTap: _changeIndex,
      //       ),
      //     )
      //   ),
      // ),

      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 8.0),
        child: BottomAppBar(
          elevation: 5.0,
          shape: AutomaticNotchedShape(
              RoundedRectangleBorder(
                  side: BorderSide(width: 16.0),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              RoundedRectangleBorder(
                  side: BorderSide(width: 116.0),
                  borderRadius: BorderRadius.all(Radius.circular(50)))),
          notchMargin: 7.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: BottomNavigationBar(
              selectedFontSize: 16.0,
              selectedIconTheme: IconThemeData(size: 26),
              selectedItemColor: Colors.red,
              selectedLabelStyle:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              showSelectedLabels: true,
              type: BottomNavigationBarType.fixed,
              currentIndex: _curIndex,
              items: _bottomNavBarItem,
              onTap: _changeIndex,
            ),
          ),
        ),
      ),
    );
  }
}
