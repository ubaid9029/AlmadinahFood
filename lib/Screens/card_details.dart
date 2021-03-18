import 'package:flutter/material.dart';
import 'package:food_home/Screens/user_details.dart';
import 'package:food_home/constant/constants.dart';
import 'package:food_home/json.dart';
import 'package:slimy_card/slimy_card.dart';
import 'Add to cart.dart';
import 'fav8.dart';

class CardDetails extends StatefulWidget {
  final image, name, price, desc, listGet;
  CardDetails(this.image, this.name, this.price, this.desc, this.listGet);
  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  List selectedItem = [[], [], []];
  @override
  void initState() {
    selectedItem = [[], [], []];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: redTheme,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, selectedItem);
          },
          icon: Icon(
            Icons.arrow_back,
            color: redTheme,
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddToCart(widget.listGet)),
                );
                // print(selectedItem);
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
          "Item Details",
          style: TextStyle(
            color: redTheme,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SlimyCard(
              color: redTheme,
              width: size.width,
              topCardHeight: size.height * 0.35,
              bottomCardHeight: 250,
              borderRadius: 15,
              topCardWidget: topCardWidget(
                  "${widget.image}", size.width, size.height * 0.4),
              bottomCardWidget: bottomCardWidget(),
              slimeEnabled: true,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Recently Viewed",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.start,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: size.width,
              height: 165,
              child: item(),
            ),
          ],
        ),
      ),
    );
  }

  Widget item() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Stack(children: [
          Container(
            margin: EdgeInsets.only(left: 25),
            width: 155,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage("${items[0]['FROZEN'][index][3][0]}"),
                  fit: BoxFit.cover),
              border: Border.all(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
            height: 200,
          ),
        ]);
      },
    );
  }

  Widget topCardWidget(String imagePath, var width, var height) {
    return Container(
      height: height,
      width: width,
      // child: CarouselSlider(
      //     items: items,
      //     options: CarouselOptions(
      //       height: 400,
      //       aspectRatio: 16 / 9,
      //       viewportFraction: 0.8,
      //       initialPage: 0,
      //       enableInfiniteScroll: true,
      //       reverse: false,
      //       autoPlay: true,
      //       autoPlayInterval: Duration(seconds: 3),
      //       autoPlayAnimationDuration: Duration(milliseconds: 800),
      //       autoPlayCurve: Curves.fastOutSlowIn,
      //       enlargeCenterPage: true,
      //       // onPageChanged: callbackFunction,
      //       scrollDirection: Axis.horizontal,
      //     )),
      decoration: BoxDecoration(
        gradient: redT,
        borderRadius: BorderRadius.circular(15),

        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(imagePath)),
        //
      ),
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget bottomCardWidget() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.name}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Price: ${widget.price}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${widget.desc}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      selectedItem[0].add(widget.image);
                      selectedItem[1].add(widget.name);
                      selectedItem[2].add(widget.price);
                      if (selectedItem[0] != null) {
                        widget.listGet[0] = widget.listGet[0] + selectedItem[0];
                        widget.listGet[1] = widget.listGet[1] + selectedItem[1];
                        widget.listGet[2] = widget.listGet[2] + selectedItem[2];
                      }
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FavoriteScreen(widget.listGet)));
                  },
                  color: redTheme,
                  icon: Icon(
                    Icons.favorite,
                    size: 20,
                    color: Colors.white,
                  ),
                  // minWidth: 50.0,
                  // height: 42,
                ),
                SizedBox(
                  width: 20,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {
                    setState(() {
                      selectedItem[0].add(widget.image);
                      selectedItem[1].add(widget.name);
                      selectedItem[2].add(widget.price);
                      if (selectedItem[0] != null) {
                        widget.listGet[0] = widget.listGet[0] + selectedItem[0];
                        widget.listGet[1] = widget.listGet[1] + selectedItem[1];
                        widget.listGet[2] = widget.listGet[2] + selectedItem[2];
                      }
                    });
                  },
                  color: Color(0xffA02621),
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  minWidth: 100.0,
                  height: 45,
                ),
                SizedBox(
                  width: 20,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserDetail()));
                  },
                  color: Color(0xffA02621),
                  child: Text(
                    "Buy Now",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  minWidth: 100.0,
                  height: 42,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
