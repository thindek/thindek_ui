library thindek_ui;

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:extended_text/extended_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';

part 'utils/colors.dart';
part 'utils/radii.dart';
part 'utils/screen.dart';
part 'utils/validator.dart';

part 'basic_widgets/avatar.dart';
part 'basic_widgets/content.dart';
part 'basic_widgets/image.dart';
part 'basic_widgets/scaffold.dart';
part 'basic_widgets/space.dart';
part 'basic_widgets/swiper.dart';
part 'basic_widgets/toast.dart';
part 'basic_widgets/verticalTabs.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

/// 服务器信息
// const LEANCLOUD_APP_ID = 'z6PuVkPJMuKCBTXVFVHfoJLI-gzGzoHsz';
// const LEANCLOUD_APP_KEY = 'wfUiXmQxBFIxGgclGtWgOA4H';
// const SERVER_API_URL = 'https://z6puvkpj.lc-cn-n1-shared.com';

/// 默认布局边距
const MARGIN_RATIO = 0.035;
const IMG_GAP_RATIO = 0.08;

/// 长列表刷新粒度

// const C_SKIP = 20; // Conference

/// 字体表
const double bodyF = 30; // 正文字体
