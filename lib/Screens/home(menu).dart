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
  var ctrgy = "FROZEN", ctrgyIndex;
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
    List myKeys = ["ALL"];

    for (int i = 0; i < items.length; i++) {
      var keys = items[i].keys;
      myKeys.add(keys.elementAt(0));
      // print(myKeys);
    }

    return SafeArea(
      child: Scaffold(
        // backgroundColor: redTheme,
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
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          child: Expanded(
            child: Container(
              // height: 50.0,
              decoration: BoxDecoration(
                gradient: redT,
              ),
              child: BottomNavigationBar(
                currentIndex: 0,
                backgroundColor: Colors.transparent,
                iconSize: 35,
                selectedFontSize: 18.0,
                selectedLabelStyle: TextStyle(
                  color: yela1,
                ),
                unselectedLabelStyle: TextStyle(
                  color: Colors.white,
                ),
                unselectedFontSize: 15.0,
                selectedIconTheme: IconThemeData(color: yela1),
                unselectedIconTheme: IconThemeData(color: Colors.white),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    // ignore: deprecated_member_use
                    title: Text(
                      "Home",
                      style: TextStyle(color: yelo2),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    // ignore: deprecated_member_use
                    title: Text(
                      "Favorite",
                      // style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(),
        body: Column(
          children: <Widget>[
            /***************************UPPER COONTAINER *********/
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    height: 50,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: textfield(),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  // Divider(
                  //   color: redTheme,
                  // ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 30,
                      right: 35,
                    ),
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20),
                        // color: Colors.pink,
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: myKeys.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        // ignore: deprecated_member_use
                        return FlatButton(
                          // hoverColor: Colors.orange,
                          onPressed: () {
                            ctrgyIndex = index;
                            ctrgy = myKeys[index];
                            print(ctrgy);
                          },
                          child: Text(
                            '${myKeys[index]}',
                            style: TextStyle(
                              color: redTheme,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: redTheme),
            /****************************Items GRID CONTAINER****************/
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: items[0][ctrgy].length,
                padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.8),
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () async {
                      var image = items[0][ctrgy][index][3][0];
                      var price = items[0][ctrgy][index][1];
                      var name = items[0][ctrgy][index][0];
                      var desc = items[0][ctrgy][index][2];

                      var getList = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CardDetails(
                                  image, name, price, desc, listGet, index)));
                      listGet[0] = listGet[0] + getList[0];
                      listGet[1] = listGet[1] + getList[1];
                      listGet[2] = listGet[2] + getList[2];

                      print(getList);
                      print(listGet);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 175,
                          height: 130,
                          decoration: BoxDecoration(
                            gradient: redT,
                            // color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage(
                                    "${items[0][ctrgy][index][3][0]}"),
                                fit: BoxFit.cover),
                            border: Border.all(color: redTheme, width: 2),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          width: 175,
                          height: 89,
                          decoration: BoxDecoration(
                            // border: Border.all(color: redTheme, width: 1),
                            // color: Colors.white,
                            gradient: redT,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${items[0][ctrgy][index][0]}",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: yelo2,
                                    fontWeight: FontWeight.w900),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Price: ${items[0][ctrgy][index][1]}",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: yelo2,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
