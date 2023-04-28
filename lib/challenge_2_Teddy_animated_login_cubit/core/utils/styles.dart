part of values;

mixin GlobalAppStyles {

   static const TextStyle whiteBoldStyle =
      TextStyle(fontWeight: FontWeight.bold, color: Colors.white);


  static TextStyle googleFontsGenerator(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.roboto(
      color: color,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }
}
