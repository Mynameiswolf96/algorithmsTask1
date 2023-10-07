import 'package:untitled2/untitled2.dart' as untitled2;
import 'dart:io';

void main() {
  print("1 - Task1: Является ли строка палиндромом");//po

  void Task1() {
    print("Введите слово");
    String word = stdin.readLineSync() ?? '0';

    print(checkOnPalindrome(word));
  }

  print("2 - Task2: Количество всех простых чисел до введенного числа");

  void Task2() {
    print("Введите число ");
    int number = int.parse(stdin.readLineSync() ?? '0');

    print("Количество простых чисел до числа ${number}: ");
    print(getPrintNumbers(number));
  }

  print("3 - Task3: Поиск первого уникального  символа в строке ");

  void Task3() {
    print("Введите любое слово или строку");
    String word = stdin.readLineSync() ?? '0';

    print("Первая уникальная буква в строке $word является ");
    print(findFirstUniqueCharacter(word));
  }

  print("4 - Task4: Количество рабочих дней в текущем месяце");

  void Task4() {
    print("Оставшееся количество рабочих дней в текущем месяце");
    print(getWorkDaysInMonth());
  }

  print("5 - Task5: Проверка карты на валидность");

  void Task5() {
    print('Введите номер карты');
    String numberOfCard = stdin.readLineSync() ?? '0';

    print('Введите CVV');
    String CVV = stdin.readLineSync() ?? '0';

    print('Введите срок годности карты');
    String date = stdin.readLineSync() ?? '0';

    print('Введите имя владельца');
    String name = stdin.readLineSync() ?? '0';

    print('Введите фамилию владельца');
    String surname = stdin.readLineSync() ?? '0';

    print(checkCardOnValidaty(numberOfCard, CVV, date, name, surname));

    if (!checkCardOnValidaty(numberOfCard, CVV, date, name, surname)) {
      print("Неправильно введены данные карты");
    } else {
      print(
          "Введенные данные от вашей карты верны: \n$numberOfCard \n$CVV \n$date \n$name \n$surname");
    }
  }

  do {
    print("Выберете задание");
    String menu = stdin.readLineSync() ?? '0';

    switch (menu) {
      case "1":
        Task1();
        break;

      case "2":
        Task2();
        break;

      case "3":
        Task3();
        break;

      case "4":
        Task4();
        break;

      case "5":
        Task5();
        break;

      case "0":
        return;
      default:
        print("Error");
        break;
    }
  } while (true);
}

bool checkOnPalindrome(String word) {
  // чек на палиндром
  String wordStayLowCase = word.toLowerCase().trim();
  int lengthOfWord = wordStayLowCase.length;
  if (wordStayLowCase.isNotEmpty || wordStayLowCase == '') {
    print("Вы ввели пустоту");
    return false;
  }

  for (int i = 0; i < lengthOfWord / 2; i++) {
    if (wordStayLowCase[i] != wordStayLowCase[lengthOfWord - i - 1]) {
      return false;
    }
  }
  return true;
}

int getPrintNumbers(int number) {
  //простые числа до числа N
  int count = 0;

  for (int i = 2; i <= number; i++) {
    if (findDividerToNumber(i)) {
      count++;
    }
  }

  return count;
}

bool findDividerToNumber(int number) {
  // Проверка на отсутсвие  делителей у числа

  for (int i = 2; i <= number; i++) {
    if ((number % i) == 0) {
      return false;
    }
  }
  return true;
}

String? findFirstUniqueCharacter(String str) {
  //Поиск первого уникального  символа в строке
  for (int i = 0; i < str.length; i++) {
    // Проверяем, повторяется ли символ в оставшейся части строки
    if (str.indexOf(str[i]) == str.lastIndexOf(str[i])) {
      return str[i]; // Возвращаем первый неповторяющийся символ
    }
  }

  return null; // Если все символы повторяются, возвращаем null
}

int getWorkDaysInMonth() {
  //Количество рабочих дней в текущем месяце
  DateTime today = DateTime.now();
  int numDays = DateTime(today.year, DateTime.october + 1, 0).day;
  int numWorkingDays = 0;
  for (int day = 1; day <= numDays; day++) {
    DateTime dateTime = DateTime(today.year, DateTime.october, day);
    if (dateTime.weekday != DateTime.saturday &&
        dateTime.weekday != DateTime.sunday) {
      numWorkingDays++;
    }
  }

  return numWorkingDays;
}

bool checkCardOnValidaty(
    String numberOfCard, String CVV, String date, String name, String surname) {
  //Проверка карты на валидность

  if (!checkNumberOfCard(numberOfCard) ||
      !checkCVV(CVV) ||
      !checkDate(date) ||
      !checkName(name) ||
      !checkSurname(surname)) {
    return false;
  }
  return true;
}

bool checkNumberOfCard(String numberOfCard) {
  numberOfCard.trim();
  return numberOfCard.length == 16 &&
      int.tryParse(numberOfCard) != null &&
      numberOfCard[0] != '0' &&
      numberOfCard != '';
}

bool checkCVV(String CVV) {
  CVV.trim();
  return CVV.length == 3 && int.tryParse(CVV) != null && CVV != '';
}

bool checkDate(String date) {
  date.trim();
  RegExp regularExpression = RegExp(r'^\d{2}/\d{2}');
  return regularExpression.hasMatch(date) && date != '';
}

bool checkName(String name) {
  name.trim();
  RegExp containerString = RegExp(r'^\d');
  return name.isNotEmpty && containerString.hasMatch(name) && name != '';
}

bool checkSurname(String surname) {
  surname.trim();
  RegExp containerOfString = RegExp(r'^/d');
  return surname.isNotEmpty &&
      containerOfString.hasMatch(surname) &&
      surname != '';
}
