import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:samir_flutter_ui_challenge/challenge_3_animated_gs_feedback/data/feedback_model.dart';

class FormViewModel {
  // Callback function to give response of status of current request.
  final void Function(String) callback;

  // Google App Script Web URL
  static const String url =
      "https://script.google.com/macros/s/AKfycbwSjJiZyI07cdipUBPtXSRIjTH2aJDw8vCuORg7wFvpSHSOCLE/exec";

  static const sucessStatus = "SUCCESS";

  FormViewModel(this.callback);

  void submitForm(FeedbackForm feedbackForm) async {
    try {
      await http.get(Uri.parse(url + feedbackForm.toParams())).then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      rethrow;
    }
  }
}
