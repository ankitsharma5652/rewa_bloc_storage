

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rewahub/ui/styles/styles.dart';

class AddCard extends StatefulWidget {
  AddCard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextStyle style = TextStyle(
    fontFamily: 'Montserrat',
  );

  int selectedTab = 0;
  bool _value1 = false; //for toggle button
  bool _value2 = false;
  void _onChanged1(bool value) => _value1 = value;
  void _onChanged2(bool value) => _value2 = value; //for toggle button
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _formKey = new GlobalKey<FormState>();
  var numberController = new TextEditingController();
  var _paymentCard = CardValPage();
  var _autoValidate = false;
  var _card = new CardValPage();

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        WhitelistingTextInputFormatter.digitsOnly,
        new LengthLimitingTextInputFormatter(19),
        new CardNumberInputFormatter(),
      ],
      controller: numberController,
      style: style,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        icon: CardUtils.getCardIcon(_paymentCard.type),
        labelText: "Card Number",
        suffixIcon: CardUtils.getCardIcon(_paymentCard.type),
        hintText: 'xxxx - xxxx - xxxx - xxxx',
      ),
      onSaved: (String value) {
        print('onSaved = $value');
        print('Num controller has = ${numberController.text}');
        _paymentCard.number = CardUtils.getCleanedNumber(value);
      },
      validator: CardUtils.validateCardNum,
    );
  }

  Widget Exp_Date() {
    return TextFormField(
      inputFormatters: [
        WhitelistingTextInputFormatter.digitsOnly,
        new LengthLimitingTextInputFormatter(4),
        new CardFormatterPage()
      ],
      style: style,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
        labelText: "Exp Date",
        hintText: "MM/YY",
      ),
      validator: CardUtils.validateDate,
      keyboardType: TextInputType.number,
      onSaved: (value) {
        List<int> expiryDate = CardUtils.getExpiryDate(value);
        _paymentCard.month = expiryDate[0];
        _paymentCard.year = expiryDate[1];
      },
    );
  }

  Widget name() {
    return TextFormField(
      style: style,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
        labelText: "Name",
        hintText: "Name of the card holder",
      ),
      onSaved: (String value) {
        _card.name = value;
      },
      keyboardType: TextInputType.text,
      validator: (String value) => value.isEmpty ? CardFormMsg.fieldReq : null,
    );
  }

  Widget CVV() {
    return Row(
      children: <Widget>[
        // Padding(
        //   padding: const EdgeInsets.only(right: 16.0),
        //   child: Icon(Icons.date_range, color: Colors.red),
        // ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: TextFormField(
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                new LengthLimitingTextInputFormatter(4),
              ],
              obscureText: true,
              style: style,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
                labelText: "CVV",
                hintText: "XXXX",
              ),
              validator: CardUtils.validateCVV,
              keyboardType: TextInputType.number,
              onSaved: (value) {
                _paymentCard.cvv = int.parse(value);
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Row(
              children: <Widget>[
                new Text(
                  'Save Card',
                ),
                SizedBox(
                  width: 21.0,
                ),
                new Switch(
                  value: _value1,
                  onChanged: _onChanged1,
                  inactiveThumbColor: reddish,
                  activeColor: reddish,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  final text1 =
      Text("Please Enter the card details and Click the below Button");

  Widget nextButon() {
    return Container(
      height: 55,
      margin: const EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 30.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [blushish, reddish]),
        // border: Border.all(color: Colors.p, width: 2.0),
        borderRadius: BorderRadius.all(
            Radius.circular(17.0) //         <--- border radius here
            ),
        color: Colors.white,
      ),
      child: MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCard()),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'NEXT',
                style: h1TextBlack.copyWith(
                    color: Colors.white, fontWeight: FontWeight.normal),
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: new Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Container(
              height: 270.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.topRight,
                  begin: Alignment.topLeft,
                  stops: [0.05, 0.3],
                  colors: [blushish, reddish],
                ),
              ),
              //color: Color.fromRGBO(100, 60, 97, 1),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 70.0,
                ),
                Container(
                  margin: EdgeInsets.only(top: 0.0),
                  child: new Text(
                    'PAYMENT METHODS',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TabBar(
                  isScrollable: false,
                  labelStyle: Theme.of(context).textTheme.body2,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2, color: Colors.white),
                    insets: EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                  ),
                  onTap: (int position) {
                    setState(() {
                      selectedTab = position;
                    });
                  },
                  tabs: [
                    Tab(
                      child: new Text(
                        "Credit Card",
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .apply(color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: new Text(
                        "Debit Card",
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .apply(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                selectedTab == 0 ? creditCard() : debitCard(),
              ],
            ),
            //MyApp(),
          ],
        ),
      ),
    );
  }

  Widget creditCard() {
    return Card(
      
      margin: const EdgeInsets.only(
        top: 40.0,
        left: 20.0,
        right: 20.0,
        // bottom: 40.0
      ),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
        height: 450.0,
        width: 370.0,
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Form(
              key: _formKey,
              autovalidate: _autoValidate,
              //crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisSize: MainAxisSize.min,
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                    child: emailField(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                    child: Exp_Date(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                    child: name(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                    child: CVV(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 40.0, 0, 0),
                    child: text1,
                  ),
                  nextButon()
                ],
              ))),
        ),
      ),
    );
  }

  Widget debitCard() {
    return Card(
      
      margin: const EdgeInsets.only(
        top: 40.0,
        left: 20.0,
        right: 20.0,
        // bottom: 40.0
      ),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
        height: 450.0,
        width: 370.0,
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Form(
              key: _formKey,
              autovalidate: _autoValidate,
              //crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisSize: MainAxisSize.min,
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                    child: emailField(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                    child: Exp_Date(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                    child: name(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                    child: CVV(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 40.0, 0, 0),
                    child: text1,
                  ),
                  nextButon()
                ],
              ))),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    numberController.removeListener(_getCardTypeFrmNumber);
    numberController.dispose();
    super.dispose();
  }

  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(numberController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      this._paymentCard.type = cardType;
    });
  }

  void _validateInputs() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      setState(() {
        _autoValidate = true; // Start validating on every change.
      });
      _showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      // Encrypt and send send payment details to payment gateway
      _showInSnackBar('Payment card is valid');
    }
  }

  Widget _getPayButton() {
    return new RaisedButton(
      onPressed: _validateInputs,
      color: Colors.deepOrangeAccent,
      splashColor: Colors.deepPurple,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(const Radius.circular(100.0)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
      textColor: Colors.white,
      child: new Text(
        CardFormMsg.pay.toUpperCase(),
        style: const TextStyle(fontSize: 17.0),
      ),
    );
  }

  void _showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value),
      duration: new Duration(seconds: 3),
    ));
  }
}


// card - formatter // 

class CardFormatterPage extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}
// card - val //
class CardValPage {
  CardType type;
  String number;
  String name;
  int month;
  int year;
  int cvv;

  CardValPage(
      {this.type, this.number, this.name, this.month, this.year, this.cvv});

  @override
  String toString() {
    return '[Type: $type, Number: $number, Name: $name, Month: $month, Year: $year, CVV: $cvv]';
  }
}

enum CardType {
  Master,
  Others,
}

class CardUtils {
  static String validateCVV(String value) {
    if (value.isEmpty) {
      return CardFormMsg.fieldReq;
    }

    if (value.length < 3 || value.length > 4) {
      return "CVV is invalid";
    }
    return null;
  }

  static String validateDate(String value) {
    if (value.isEmpty) {
      return CardFormMsg.fieldReq;
    }

    int year;
    int month;
    // The value contains a forward slash if the month and year has been
    // entered.
    if (value.contains(new RegExp(r'(\/)'))) {
      var split = value.split(new RegExp(r'(\/)'));
      // The value before the slash is the month while the value to right of
      // it is the year.
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      // Only the month was entered
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }

    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return 'Expiry month is invalid';
    }

    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return 'Expiry year is invalid';
    }

    if (!hasDateExpired(month, year)) {
      return "Card has expired";
    }
    return null;
  }

  /// Convert the two-digit year to four-digit year if necessary
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) {
    return !(month == null || year == null) && isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static List<int> getExpiryDate(String value) {
    var split = value.split(new RegExp(r'(\/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is more than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
  }

  static String getCleanedNumber(String text) {
    RegExp regExp = new RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  static Widget getCardIcon(CardType cardType) {
    String img = "";
    Icon icon;
    switch (cardType) {
      case CardType.Master:
        img = 'assets/images/mastercard.png';
        break;

      case CardType.Others:
        icon = new Icon(
          Icons.credit_card,
          size: 40.0,
          color: Colors.grey[600],
        );
        break;
    }
    Widget widget;
    if (img.isNotEmpty) {
      widget = new Image.asset(
        'assets/images/$img',
        width: 40.0,
      );
    } else {
      widget = icon;
    }
    return widget;
  }

  /// With the card number with Luhn Algorithm
  /// https://en.wikipedia.org/wiki/Luhn_algorithm
  static String validateCardNum(String input) {
    if (input.isEmpty) {
      return CardFormMsg.fieldReq;
    }

    input = getCleanedNumber(input);

    if (input.length < 8) {
      return CardFormMsg.numberIsInvalid;
    }

    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(input[length - i - 1]);

      // every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return CardFormMsg.numberIsInvalid;
  }

  static CardType getCardTypeFrmNumber(String input) {
    CardType cardType;
    if (input.startsWith(new RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.Master;
    } else if (input.length <= 8) {
      cardType = CardType.Others;
    }

    return cardType;
  }
}

class CardFormMsg {
  static const String appName = 'Payment Card Demo';
  static const String fieldReq = 'This field is required';
  static const String numberIsInvalid = 'Card is invalid';
  static const String pay = 'Pay';
}