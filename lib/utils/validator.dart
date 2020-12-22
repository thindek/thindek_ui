class Valid {
  /// 检查用户名格式
  bool isUsername(String input) {
    if (input == null || input.isEmpty) return false;
    return true;
  }

  /// 检查邮箱格式
  bool isEmail(String input) {
    if (input == null || input.isEmpty) return false;
    // 邮箱正则

    // 函数 RegExp()是flutter的正则化表达式函数
    String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
    return RegExp(regexEmail).hasMatch(input);
  }

  /// 检查字符长度
  bool checkStringLength(String input, int length) {
    if (input == null || input.isEmpty) return false;
    return input.length >= length;
  }

  /// 非空判断
  bool isNullOrEmpty(String str) {
    return str == null || str.length == 0;
  }
}
