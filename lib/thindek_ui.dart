library thindek_ui;

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';

part 'utils/colors.dart';
part 'utils/radii.dart';
part 'utils/screen.dart';
part 'utils/validator.dart';
part 'utils/values.dart';

part 'basic_widgets/avatar.dart';
part 'basic_widgets/image.dart';
part 'basic_widgets/scaffold.dart';
part 'basic_widgets/space.dart';
part 'basic_widgets/toast.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
