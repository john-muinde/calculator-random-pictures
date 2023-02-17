import 'package:get/get.dart';

class MainController extends GetxController {
  var answer = "".obs;
  var text1 = 0.0.obs;
  var text2 = 0.0.obs;

  void setAnswer(value1, value2) {
    answer.value = (value1 + value2).toString();
    text1.value = value1;
    text2.value = value2;
  }
}
