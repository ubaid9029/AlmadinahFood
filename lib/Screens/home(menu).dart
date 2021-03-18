import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_home/Screens/fav8.dart';
import 'package:food_home/constant/constants.dart';
import 'package:food_home/json.dart';
import 'Add to cart.dart';
import 'card_details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List listGet = [[], [], []];

  Widget textfield() {
    return TextField(
      cursorColor: redTheme,
      decoration: InputDecoration(
        hintText: "Search here",
        fillColor: Colors.black,
        focusColor: redTheme,
        prefixIcon: Icon(
          Icons.search,
          color: redTheme,
          size: 30.0,
        ),
        hoverColor: redTheme,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: redTheme,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: redTheme,
          ),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddToCart(listGet)),
                  );
                },
                icon: Icon(
                  Icons.shopping_cart,
                  size: 40,
                  color: redTheme,
                ),
              ),
            )
          ],
          title: Text(
            "Menu",
            style: TextStyle(
              color: redTheme,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: redTheme,
          height: 50.0,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: redTheme,
          items: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              icon: Icon(
                Icons.home,
                size: 20,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FavoriteScreen(listGet)),
                );
              },
              icon: Icon(
                Icons.favorite,
                size: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
        drawer: Drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                alignment: Alignment.center,
                height: 50,
                margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                child: textfield(),
              ),
              CONTAINER(
                margin: EdgeInsets.only(top: 10),
                width: size.width * 0.98,
                height: size.height * 0.72,
                color: Colors.white,
                border: Border.all(
                  color: redTheme,
                  width: 3,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                ),
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      // ListView.builder(
                      //     itemCount: 5,
                      //     scrollDirection: Axis.horizontal,
                      //     shrinkWrap: true,
                      //     itemBuilder: (context, index) {
                      //       return Text('ALL');
                      //     }),
                      GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: items[0]["FROZEN"].length,
                        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 15,
                            childAspectRatio: 0.8),
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                            onTap: () async {
                              var image = items[0]['FROZEN'][index][3][0];
                              var price = items[0]['FROZEN'][index][1];
                              var name = items[0]['FROZEN'][index][0];
                              var desc = items[0]['FROZEN'][index][2];

                              var getList = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CardDetails(
                                          image, name, price, desc, listGet)));
                              listGet[0] = listGet[0] + getList[0];
                              listGet[1] = listGet[1] + getList[1];
                              listGet[2] = listGet[2] + getList[2];

                              print(getList);
                              print(listGet);
                            },
                            child: Stack(
                              children: [
                                CONTAINER(
                                  width: 175,
                                  height: 130,
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${items[0]['FROZEN'][index][3][0]}"),
                                      fit: BoxFit.cover),
                                  border:
                                      Border.all(color: Colors.red, width: 1),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                Positioned(
                                  top: 130,
                                  child: CONTAINER(
                                    padding: EdgeInsets.only(left: 10, top: 10),
                                    width: 175,
                                    height: 89,
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Colors.red, width: 2),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${items[0]['FROZEN'][index][0]}",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text(
                                            "Price: ${items[0]['FROZEN'][index][1]}",
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
