class FeedbackForm {

  final String _feedback;
  final String _rate;


  FeedbackForm(this._rate, this._feedback);

  String toParams() =>
      "?rate=$_rate&feedback=$_feedback";

}