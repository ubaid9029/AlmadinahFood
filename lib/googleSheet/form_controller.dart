// import 'dart:convert' as convert;
// import 'dart:html';

// import 'package:http/http.dart' as http;

// import 'form.dart';
// // import '../model/form.dart';

// /// FormController is a class which does work of saving FeedbackForm in Google Sheets using
// /// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
// class FormController {
//   // Google App Script Web URL.
//   static const URL =
//       "https://script.google.com/macros/s/AKfycbxvHFBkT9ZhZn8qc0VH5JzZpYxGeE3tyK9_LHE85JqAInwuG7xdxXvsK60Et-JkLfbp0Q/exec";

//   // Success Status Message
//   static const STATUS_SUCCESS = "SUCCESS";

//   /// Async function which saves feedback, parses [feedbackForm] parameters
//   /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
//   // void submitForm(
//   //     FeedbackForm feedbackForm, void Function(String) callback) async {
//   //   try {
//   //     await http.post(URL, body: feedbackForm.toJson()).then((response) async {
//   //       if (response.statusCode == 302) {
//   //         var url = response.headers['location'];
//   //         await http.get(Url).then((response) {
//   //           callback(convert.jsonDecode(response.body)['status']);
//   //         });
//   //       } else {
//   //         callback(convert.jsonDecode(response.body)['status']);
//   //       }
//   //     });
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }

//   /// Async function which loads feedback from endpoint URL and returns List.
// //   Future<List<FeedbackForm>> getFeedbackList() async {
// //     return await http.get(URL).then((response) {
// //       var jsonFeedback = convert.jsonDecode(response.body) as List;
// //       return jsonFeedback.map((json) => FeedbackForm.fromJson(json)).toList();
// //     });
// //   }
// // }
// }
