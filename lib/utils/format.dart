import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';

class Format {
  static String formatMoney(String money) {
    MoneyFormatterOutput fmf = MoneyFormatter(
        amount: double.parse(money),
        settings: MoneyFormatterSettings(
          symbol: 'vnđ',
          thousandSeparator: ',',
          decimalSeparator: ',',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 0,
        )).output;

    return fmf.symbolOnRight;
  }

  static String formatNumber(num? money,
      {String? symbol = '', int? fractionDigits = 3}) {
    MoneyFormatterOutput fmf = MoneyFormatter(
        amount: (money ?? 0).toDouble(),
        settings: MoneyFormatterSettings(
          symbol: symbol,
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: '',
          fractionDigits: fractionDigits,
        )).output;
    final num fractionDigitsOnly = num.tryParse(fmf.fractionDigitsOnly) ?? 0;
    return fractionDigitsOnly == 0
        ? fmf.symbolOnRight.split(',').first
        : fmf.symbolOnRight;
  }

  static String formatMoneyVer2(String money) {
    MoneyFormatterOutput fmf = MoneyFormatter(
        amount: double.parse(money),
        settings: MoneyFormatterSettings(
          symbol: '',
          thousandSeparator: ',',
          decimalSeparator: ',',
          symbolAndNumberSeparator: '',
          fractionDigits: 0,
        )).output;

    return fmf.symbolOnRight;
  }

  static String formatTimestampToDatetime(int timestamp, String type) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    DateFormat dateFormat = DateFormat(type);

    return dateFormat.format(dateTime);
  }

  static DateTime formatStringToDateTime(String dateTime, String type) {
    DateFormat dateFormat = DateFormat(type);
    return dateFormat.parse(dateTime);
  }
}

class Validation {
  static bool isValidName(String name) {
    final validCharacters = RegExp(
        r'^[a-zA-Z\sÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$');
    if (!validCharacters.hasMatch(name.trim()) || name.trim() != name) {
      return false;
    }
    return true;
  }

  static bool isContainSpace(String string) {
    return string.contains(' ');
  }

  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static bool isValidPriceNumber(String price) {
    final regex = RegExp(r'^[1-9]\d{6,}$');
    return regex.hasMatch(price);
  }
}
