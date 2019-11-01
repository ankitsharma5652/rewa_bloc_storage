import 'dart:async';
import 'dart:core';
import 'dart:math';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

typedef PasswordEnteredCallback = void Function(String text);
typedef IsValidCallback = void Function();
typedef CancelCallback = void Function();

class PinEntry extends StatefulWidget {
  final String title;
  final int passwordDigits;
  final Color titleColor;
  final Color backgroundColor;
  final PasswordEnteredCallback passwordEnteredCallback;

  //isValidCallback will be invoked after passcode screen will pop.
  final IsValidCallback isValidCallback;
  final CancelCallback cancelCallback;
  final String cancelLocalizedText;
  final String deleteLocalizedText;
  final Stream<bool> shouldTriggerVerification;
  final Widget bottomWidget;
  final CircleUIConfig circleUIConfig;
  final KeyboardUIConfig keyboardUIConfig;

  PinEntry({
    Key key,
    @required this.title,
    this.passwordDigits = 4,
    @required this.passwordEnteredCallback,
    @required this.cancelLocalizedText,
    @required this.deleteLocalizedText,
    @required this.shouldTriggerVerification,
    this.isValidCallback,
    this.circleUIConfig,
    this.keyboardUIConfig,
    this.bottomWidget,
    this.titleColor = Colors.black,
    this.backgroundColor,
    this.cancelCallback,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PinEntryState();
}

class _PinEntryState extends State<PinEntry>
    with SingleTickerProviderStateMixin {
  StreamSubscription<bool> streamSubscription;

  String enteredPasscode = '';
  AnimationController controller;
  Animation<double> animation;

  @override
  initState() {
    super.initState();
    streamSubscription = widget.shouldTriggerVerification
        .listen((isValid) => _showValidation(isValid));
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    final Animation curve =
        CurvedAnimation(parent: controller, curve: ShakeCurve());
    animation = Tween(begin: 0.0, end: 10.0).animate(curve)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            enteredPasscode = '';
            controller.value = 0;
          });
        }
      })
      ..addListener(() {
        setState(() {
          // the animation object’s value is the changed state
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor ?? Colors.white.withOpacity(1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: widget.titleColor,
                  fontWeight: FontWeight.w300),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 60, right: 60),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildCircles(),
              ),
            ),
            IntrinsicHeight(
              child: Container(
                margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
                child: Keyboard(
                  onDeleteCancelTap: _onDeleteCancelButtonPressed,
                  onKeyboardTap: _onKeyboardButtonPressed,
                  shouldShowCancel: enteredPasscode.length == 0,
                  cancelLocalizedText: widget.cancelLocalizedText,
                  deleteLocalizedText: widget.deleteLocalizedText,
                  keyboardUIConfig: widget.keyboardUIConfig != null
                      ? widget.keyboardUIConfig
                      : KeyboardUIConfig(),
                ),
              ),
            ),
            widget.bottomWidget != null ? widget.bottomWidget : Container()
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCircles() {
    var list = <Widget>[];
    var config = widget.circleUIConfig != null
        ? widget.circleUIConfig
        : CircleUIConfig();
    config.extraSize = animation.value;
    for (int i = 0; i < widget.passwordDigits; i++) {
      list.add(Circle(
        filled: i < enteredPasscode.length,
        circleUIConfig: config,
      ));
    }
    return list;
  }

  _onDeleteCancelButtonPressed() {
    if (enteredPasscode.length > 0) {
      setState(() {
        enteredPasscode =
            enteredPasscode.substring(0, enteredPasscode.length - 1);
      });
    } else {
      Navigator.maybePop(context);

      if (widget.cancelCallback != null) {
        widget.cancelCallback();
      }
    }
  }

  _onKeyboardButtonPressed(String text) {
    setState(() {
      if (enteredPasscode.length < widget.passwordDigits) {
        enteredPasscode += text;
        if (enteredPasscode.length == widget.passwordDigits) {
          widget.passwordEnteredCallback(enteredPasscode);
        }
      }
    });
  }

  @override
  didUpdateWidget(PinEntry old) {
    super.didUpdateWidget(old);
    // in case the stream instance changed, subscribe to the new one
    if (widget.shouldTriggerVerification != old.shouldTriggerVerification) {
      streamSubscription.cancel();
      streamSubscription = widget.shouldTriggerVerification
          .listen((isValid) => _showValidation(isValid));
    }
  }

  @override
  dispose() {
    controller.dispose();
    streamSubscription.cancel();
    super.dispose();
  }

  _showValidation(bool isValid) {
    if (isValid) {
      Navigator.maybePop(context).then((pop) => _validationCallback());
    } else {
      controller.forward();
    }
  }

  _validationCallback() {
    if (widget.isValidCallback != null) {
      widget.isValidCallback();
    } else {
      print(
          "You didn't implement validation callback. Please handle a state by yourself then.");
    }
  }
}

// curve //
class ShakeCurve extends Curve {
  @override
  double transform(double t) {
    //t from 0.0 to 1.0
    return sin(t * 3 * pi).abs();
  }
}

// lockscreen //
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passcode',
      home: LockScreen(title: 'Passcode'),
    );
  }
}

class LockScreen extends StatefulWidget {
  LockScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  bool isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You are ${isAuthenticated ? '' : 'NOT'} authenticated'),
            _defaultLockScreenButton(context),
          ],
        ),
      ),
    );
  }

  _defaultLockScreenButton(BuildContext context) => MaterialButton(
        color: Theme.of(context).primaryColor,
        child: Text('Open Default Lock Screen'),
        onPressed: () {
          _showLockScreen(context, opaque: true);
        },
      );

  _showLockScreen(BuildContext context,
      {bool opaque,
      CircleUIConfig circleUIConfig,
      KeyboardUIConfig keyboardUIConfig}) {
    Navigator.push(
        context,
        PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (context, animation, secondaryAnimation) =>
              PinEntry(
            title: 'Enter Passcode',
            circleUIConfig: circleUIConfig,
            keyboardUIConfig: keyboardUIConfig,
            passwordEnteredCallback: _onPasscodeEntered,
            cancelLocalizedText: 'Cancel',
            deleteLocalizedText: 'Delete',
            shouldTriggerVerification: _verificationNotifier.stream,
            backgroundColor: Colors.white,
            cancelCallback: _onPasscodeCancelled,
          ),
        ));
  }

  _onPasscodeEntered(String enteredPasscode) {
    bool isValid = '1234' == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      setState(() {
        this.isAuthenticated = isValid;
      });
    }
  }

  _onPasscodeCancelled() {}

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }
}

// keyboard//

typedef KeyboardTapCallback = void Function(String text);

class KeyboardUIConfig {
  final double digitSize;
  final double digitBorderWidth;
  final TextStyle digitTextStyle;
  final TextStyle deleteButtonTextStyle;
  final Color primaryColor;
  final Color digitFillColor;
  final EdgeInsetsGeometry keyboardRowMargin;
  final EdgeInsetsGeometry deleteButtonMargin;

  KeyboardUIConfig({
    this.digitSize = 80,
    this.digitBorderWidth = 1,
    this.keyboardRowMargin = const EdgeInsets.only(top: 15),
    this.primaryColor = Colors.black,
    this.digitFillColor = Colors.transparent,
    this.digitTextStyle = const TextStyle(fontSize: 30, color: Colors.black),
    this.deleteButtonMargin =
        const EdgeInsets.only(right: 25, left: 20, top: 15),
    this.deleteButtonTextStyle =
        const TextStyle(fontSize: 16, color: Colors.black),
  });
}

class Keyboard extends StatelessWidget {
  final KeyboardUIConfig keyboardUIConfig;
  final GestureTapCallback onDeleteCancelTap;
  final KeyboardTapCallback onKeyboardTap;
  final bool shouldShowCancel;
  final String cancelLocalizedText;
  final String deleteLocalizedText;

  Keyboard(
      {Key key,
      @required this.keyboardUIConfig,
      @required this.onDeleteCancelTap,
      @required this.onKeyboardTap,
      this.shouldShowCancel = true,
      @required this.cancelLocalizedText,
      @required this.deleteLocalizedText})
      : super(key: key);

  @override
  Widget build(BuildContext context) => _buildKeyboard();

  Widget _buildKeyboard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildKeyboardDigit('1'),
            _buildKeyboardDigit('2'),
            _buildKeyboardDigit('3'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildKeyboardDigit('4'),
            _buildKeyboardDigit('5'),
            _buildKeyboardDigit('6'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildKeyboardDigit('7'),
            _buildKeyboardDigit('8'),
            _buildKeyboardDigit('9'),
          ],
        ),
        Stack(
          children: <Widget>[
            Center(child: _buildKeyboardDigit('0')),
            Align(alignment: Alignment.topRight, child: _buildDeleteButton())
          ],
        ),
      ],
    );
  }

  Widget _buildKeyboardDigit(String text) {
    return Container(
      margin: keyboardUIConfig.keyboardRowMargin,
      width: keyboardUIConfig.digitSize,
      height: keyboardUIConfig.digitSize,
      child: ClipOval(
        child: Material(
          color: keyboardUIConfig.digitFillColor,
          child: InkWell(
            highlightColor: keyboardUIConfig.primaryColor,
            splashColor: keyboardUIConfig.primaryColor.withOpacity(0.4),
            onTap: () {
              onKeyboardTap(text);
            },
            child: Center(
              child: Text(
                text,
                style: keyboardUIConfig.digitTextStyle,
              ),
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: keyboardUIConfig.primaryColor,
            width: keyboardUIConfig.digitBorderWidth),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return Container(
      margin: keyboardUIConfig.deleteButtonMargin,
      height: keyboardUIConfig.digitSize,
      width: keyboardUIConfig.digitSize,
      child: ClipOval(
        child: Material(
          color: keyboardUIConfig.digitFillColor,
          child: InkWell(
            highlightColor: keyboardUIConfig.primaryColor,
            splashColor: keyboardUIConfig.primaryColor.withOpacity(0.4),
            onTap: onDeleteCancelTap,
            child: Center(
              child: Text(
                shouldShowCancel ? cancelLocalizedText : deleteLocalizedText,
                style: keyboardUIConfig.deleteButtonTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// circle //

class CircleUIConfig {
  final Color borderColor;
  final Color fillColor;
  final double borderWidth;
  final double circleSize;
  double extraSize;

  CircleUIConfig(
      {this.extraSize = 0,
      this.borderColor = Colors.black,
      this.borderWidth = 1,
      this.fillColor = Colors.black,
      this.circleSize = 20});
}

class Circle extends StatelessWidget {
  final bool filled;
  final CircleUIConfig circleUIConfig;

  Circle({Key key, this.filled = false, @required this.circleUIConfig})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: circleUIConfig.extraSize),
      width: circleUIConfig.circleSize,
      height: circleUIConfig.circleSize,
      decoration: BoxDecoration(
          color: filled ? circleUIConfig.fillColor : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
              color: circleUIConfig.borderColor,
              width: circleUIConfig.borderWidth)),
    );
  }
}
