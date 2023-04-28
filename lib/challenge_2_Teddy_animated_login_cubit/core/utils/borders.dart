part of values;

mixin GlobalAppBorders {
  static RoundedRectangleBorder circular10 =
      RoundedRectangleBorder(borderRadius: GlobalAppBorderRadius.r_10);
}

class GlobalAppSizedBox {
  static const SizedBox h_10 = SizedBox(
    height: GlobalAppSizes.s_10,
  );

  static const SizedBox w_40 = SizedBox(
    width: GlobalAppSizes.s_40,
  );
}

class GlobalAppSpacers {}

class GlobalAppEdgeInsets {
  // all
  static const EdgeInsets a_5 = EdgeInsets.all(GlobalAppSizes.s_5);
  static const EdgeInsets a_16 = EdgeInsets.all(GlobalAppSizes.s_16);
  static const EdgeInsets a_30 = EdgeInsets.all(GlobalAppSizes.s_30);
  // right
  static const EdgeInsets right25 = EdgeInsets.only(right: GlobalAppSizes.s_25);

  // left
  static const EdgeInsets l_30 = EdgeInsets.only(left: GlobalAppSizes.s_30);

  // mix
  static const EdgeInsets right20Top20 =
      EdgeInsets.only(right: GlobalAppSizes.s_20, top: GlobalAppSizes.s_20);
  static const EdgeInsets left20Top12 =
      EdgeInsets.only(left: GlobalAppSizes.s_20, top: GlobalAppSizes.s_12);
  static const EdgeInsets left2Top3Bottom3 = EdgeInsets.only(
      left: GlobalAppSizes.s_2,
      top: GlobalAppSizes.s_3,
      bottom: GlobalAppSizes.s_3);
  static const EdgeInsets left30Right30 =
      EdgeInsets.only(left: GlobalAppSizes.s_30, right: 30.0);

  // symmetric mix
  static const EdgeInsets sh_10v_16 = EdgeInsets.symmetric(
    horizontal: GlobalAppSizes.s_10,
    vertical: GlobalAppSizes.s_16,
  );
  static const EdgeInsets sh_40v_14 = EdgeInsets.symmetric(
    horizontal: GlobalAppSizes.s_40,
    vertical: GlobalAppSizes.s_14,
  );

  static const EdgeInsets sv_10 =
      EdgeInsets.symmetric(vertical: GlobalAppSizes.s_10);
      static const EdgeInsets sv_20 =
      EdgeInsets.symmetric(vertical: GlobalAppSizes.s_20);
}
