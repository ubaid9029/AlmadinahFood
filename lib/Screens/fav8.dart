import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_home/constant/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home(menu).dart';

// import 'ImageContainer.dart';
int indeX = 5;

class FavoriteScreen extends StatefulWidget {
  final listGet;
  FavoriteScreen(this.listGet);
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[700],
        title: Text("FAVOURATE"),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: redTheme,
        height: 50.0,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: redTheme,
        items: [
          IconButton(
            onPressed: () {
              Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: Icon(
              Icons.home,
              size: 20,
              color: Colors.white,
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => FavoriteScreen()),
          //     );
          //   },
          //   icon: Icon(
          //     Icons.favorite,
          //     size: 20,
          //     color: Colors.white,
          //   ),
          // ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.listGet[0].length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                // decoration: BoxDecoration(
                // //  border: Border.all(color: Colors.red,width: 2),

                //   borderRadius: BorderRadius.circular(30),
                // ),
                child: Stack(
                  children: [
                    Container(),
                    Container(
                      width: size.width / 2.5,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage('assets/a.jpg'),
                            fit: BoxFit.cover),
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(size.height / 70),
                          bottomLeft: Radius.circular(size.height / 70),
                        ),
                      ),
                      height: size.height / 6,
                      child: Image.asset(
                        "${widget.listGet[0][index]}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: size.width / 2.6,
                      child: Container(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        width: size.width * 0.61,
                        height: size.height / 6,
                        decoration: BoxDecoration(
                            color: Colors.white,

                            // border: Border.all(color: Colors.red,width: 2),
                            border: Border.all(color: Colors.red, width: 2),
                            borderRadius:
                                BorderRadius.circular(size.height / 70)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.listGet[1][index]}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "${widget.listGet[2][index]}",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                InkWell(
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.redAccent[700],
                                    size: 30,
                                  ),
                                  onTap: () {
                                    setState(
                                      () {
                                        widget.listGet[0].removeAt(index);
                                        widget.listGet[1].removeAt(index);
                                        widget.listGet[2].removeAt(index);
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    //navigation to add to card
                                  },
                                  color: Colors.redAccent[700],
                                  child: Center(child: Text("ADD TO CARD")),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
