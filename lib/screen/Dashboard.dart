import 'package:flutter/material.dart';
import 'package:kei_ss_barcodescanner/bottomNavBar/exportBottomBarScreen.dart';
import 'package:kei_ss_barcodescanner/component/exportComponent.dart';
import 'package:kei_ss_barcodescanner/screen/ScannerScreen.dart';
import 'package:kei_ss_barcodescanner/screen/ScannerScreen2.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _curIndex = 0;
  var result;

  List<Widget> _widgetOptions = [
    MenuDashboard(),
    MenuDashboard(),
    MenuDashboard(),
    MenuDashboard(),
  ];

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

  void _changeIndex(index){
    setState((){
      _curIndex = index;
    });
  }

  void _floatingtoast(){
    setState((){
        //  FToast.fcreatetoast(result.code);
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    extendBody: true,
    // appBar: AppBar(
    //   title: Text("KEI", style: TextStyle(fontStyle: FontStyle.italic))
    // ),
    body: SafeArea(
      child: _widgetOptions.elementAt(_curIndex),
    ),

    // BARCODE SCANNER ICON DOCKED FLOTTING BUTTON
    floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    floatingActionButton: FloatingActionButton(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      backgroundColor: Color(0xff31e077),
      tooltip: "Scanner",
      onPressed: () async {
        final result = await Navigator.push(
            context, MaterialPageRoute(builder: (context) => ScannerScreen()));
        
        EncryptDecrypt.decrypt(result.code);
        print("result : " + result.code);
        print("result : " + result);



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
            RoundedRectangleBorder(side: BorderSide(width: 16.0),borderRadius: BorderRadius.all(Radius.circular(50))),
            RoundedRectangleBorder(side: BorderSide(width: 116.0), borderRadius: BorderRadius.all(Radius.circular(50)))
          ),
          notchMargin: 7.0,
          child: Container(
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                IconButton(icon: Icon(Icons.home), onPressed: () {}),
                SizedBox(width: 40), // The dummy child
                IconButton(icon: Icon(Icons.control_point), onPressed: () {}),
                IconButton(icon: Icon(Icons.person), onPressed: () {}),
              ],
            ),
          )
        ),
      ),
    );
  }
}
