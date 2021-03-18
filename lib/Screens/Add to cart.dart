import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_home/constant/constants.dart';
import '../googleSheet/feedback_list.dart';
// import '../googleSheet/form.dart';
import '../googleSheet/form_controller.dart';

import 'user_details.dart';

class AddToCart extends StatefulWidget {
  final selectedItems;
  AddToCart(this.selectedItems);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<AddToCart> {
  // void _submitForm() {
  //   // Validate returns true if the form is valid, or false
  //   // otherwise.
  //   // if (_formKey.currentState.validate())
  //   //  {
  //   // If the form is valid, proceed.
  //   FeedbackForm feedbackForm = FeedbackForm(
  //     widget.selectedItems.toString(),
  //     widget.listGet.toString(),
  //     widget.listGet.toString(),
  //     widget.listGet.toString(),
  //   );

  //   FormController formController = FormController();

  //   // Submit 'feedbackForm' and save it in Google Sheets.
  //   formController.submitForm(feedbackForm, (String response) {
  //     print("Response: $response");
  //     if (response == FormController.STATUS_SUCCESS) {
  //       // Feedback is saved succesfully in Google Sheets.
  //       // _showSnackbar("Feedback Submitted");
  //     } else {
  //       // Error Occurred while saving data in Google Sheets.
  //       // _showSnackbar("Error Occurred!");
  //     }
  //   });
  //   // }
  // }
  List listGet = [[], [], []];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add To Cart",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: redTheme,
      ),
      body: Stack(children: [
        Container(
          child: ListView.builder(
              itemCount: widget.selectedItems[0].length,
              itemBuilder: (context, i) {
                return Container(
                  child: Column(
                    children: [
                      // ignore: deprecated_member_use

                      InkWell(
                        child: Card(
                          shadowColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.0)),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 120,
                                width: 130,
                                child: Image.asset(
                                    "${widget.selectedItems[0][i]}"),
                              ),
                              Container(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${widget.selectedItems[1][i]}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                    Text(
                                      "Price: ${widget.selectedItems[2][i]}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 120.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0))),
                                            onPressed: () {},
                                            color: Color(0xffA02621),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                            minWidth: 10.0,
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0))),
                                            onPressed: () {},
                                            color: redTheme,
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                            minWidth: 10.0,
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          IconButton(
                                            // shape: RoundedRectangleBorder(
                                            //     borderRadius: BorderRadius.all(
                                            //         Radius.circular(20.0))),
                                            onPressed: () {
                                              setState(() {
                                                widget.selectedItems[0]
                                                    .removeAt(i);
                                                widget.selectedItems[1]
                                                    .removeAt(i);
                                                widget.selectedItems[2]
                                                    .removeAt(i);
                                              });

                                              print(widget.selectedItems);
                                            },
                                            color: redTheme,
                                            icon: Icon(
                                              Icons.delete_outline_rounded,
                                              size: 35.0,
                                              color: redTheme,
                                            ),
                                            // minWidth: 10.0,
                                            // height: 10,
                                          ),
                                          // ignore: deprecated_member_use
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.83,
          left: MediaQuery.of(context).size.width * 0.35,
          height: 50.0,
          width: 150.0,
          // ignore: deprecated_member_use
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10.0,
            hoverColor: Colors.black,
            color: redTheme,
            onPressed: () {},
            child: Text(
              'BUY NOW',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
