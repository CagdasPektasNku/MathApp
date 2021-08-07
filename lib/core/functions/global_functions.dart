import 'dart:math';

class GlobalFunctions {
  int randomNumberMaker() {
    Random random = new Random();
    int randomNumber = random.nextInt(100) + 1;

    return randomNumber;
  }

  int result(int a, int b) {
    int trueAnswer = a + b;

    return trueAnswer;
  }

  int resultMinus(int a, int b) {
    int minusAnswer = a - b;
    return minusAnswer;
  }
}
