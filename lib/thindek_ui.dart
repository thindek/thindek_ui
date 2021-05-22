library thindek_ui;

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'basic_widgets/avatar.dart';
part 'basic_widgets/content.dart';
part 'basic_widgets/image.dart';
part 'basic_widgets/scaffold.dart';
part 'basic_widgets/space.dart';
part 'basic_widgets/swiper.dart';
part 'basic_widgets/toast.dart';
part 'basic_widgets/verticalTabs.dart';
part 'utils/colors.dart';
part 'utils/radii.dart';
part 'utils/validator.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

/// 默认布局边距
const MARGIN_RATIO = 0.035;
const IMG_GAP_RATIO = 0.08;

/// 字体表
const double bodyF = 30; // 正文字体
