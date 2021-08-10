import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  var _itemSelectedIndex = 0;
  //final _pageController = PageController();
  Widget pageDot(int page) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _itemSelectedIndex = page;
        }
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          color: page == _itemSelectedIndex ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }

  Widget usualButtonView(String text, Color color, textColor){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: (){},
            child: Container(
              height: 40,
              child: Center(
                child: Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(IconData iconData, String label){
    return BottomNavigationBarItem(icon: Icon(iconData), label: label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                    onTap: (){},
                    child: Text("Skip", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.blue),)),
              ),
            ],
          ),
          Spacer(),
          Container(
            height: MediaQuery.of(context).size.height *3/5,
            child: PageView(
              controller: PageController(),
              onPageChanged: (index) {
                setState(() {
                  _itemSelectedIndex = index;
                });
              },
              children: [
                Column(children: [
                  Expanded(child: Container()),
                  Image.asset("assets/apple.png", scale: 1,),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("If they're there, we'll find'em", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      "SeatGeek bring together tickets from hundreds of sites to save you time and money.",
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(child: Container()),
                ],),
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pageDot(0),
              pageDot(1),
              pageDot(2),
            ],
          ),
          Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              usualButtonView("Sign up", Colors.blue[700], Colors.white),
              usualButtonView("Log in", Colors.blue[700], Colors.white),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(onTap: (){}, child: Text("Terms of Use", style: TextStyle(color: Colors.grey, fontSize: 12),)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: Text("|", style: TextStyle(color: Colors.grey, fontSize: 12),),
              ),
              InkWell(onTap: (){}, child: Text("Privacy Policy", style: TextStyle(color: Colors.grey, fontSize: 12),)),
            ],
          ),
          Spacer()
        ],
      ),
    );
  }
}