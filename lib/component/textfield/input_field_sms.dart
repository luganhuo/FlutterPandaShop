import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/constant_colors.dart';
import '../../constants/constant_fonts.dart';
import '../../constants/constant_spacing.dart';
import 'input_field_interface.dart';

class InputFieldSMS extends StatefulWidget {
  final String text;
  final int maxLength;
  final ShouldChangeText shouldChangeText;
  final OnTextDidChanged onTextDidChanged;
  final OnTextEndEditing onTextEndEditing;
  final StateOfChangedText stateOfChangedText;

  TextEditingController _controller = TextEditingController();
  String _preValue = "";
  InputFieldState _inputState;

  InputFieldSMS({
    Key key,
    this.maxLength = 6,
    this.text = "",
    @required this.shouldChangeText,
    @required this.onTextDidChanged,
    @required this.onTextEndEditing,
    @required this.stateOfChangedText,
  }) : super(key: key);

  @override
  _InputFieldSMSState createState() => _InputFieldSMSState();
}

class _InputFieldSMSState extends State<InputFieldSMS> {
  List<String> _allSMSCode = List<String>();
  bool _inEditing = false;

  @override
  void initState() {
    this._allSMSCode = List<String>(this.widget.maxLength);
    for (int idx = 0; idx < this.widget.maxLength; ++idx) {
      if (idx < this.widget.text.length) {
        this._allSMSCode[idx] = this.widget.text[idx];
      } else {
        this._allSMSCode[idx] = "";
      }
    }

    this.widget._controller.addListener(_textFieldWatcher);
    this.widget._controller.text = this.widget.text;

    print(this._allSMSCode);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose()
    this.widget._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colours.clear,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(fit: StackFit.loose, alignment: AlignmentDirectional.centerStart, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _codeWidgetsList(context),
            ),
            TextField(
              controller: this.widget._controller,
              style: TextStyle(color: Colours.clear),
              onEditingComplete: () => _textFieldDidEndEditing(context, this.widget._preValue),
              onSubmitted: (value) => _textFieldDidEndEditing(context, value),
              onTap: () => _textFieldOnTap(),
              keyboardType: TextInputType.number,
              cursorColor: Colours.clear,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colours.clear)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colours.clear)),
              ),
            ),
          ]),
          SizedBox(height: Spacing.xxxs),
          Text("hello world", style: PandaTextStyle.sfui.copyWith(color: Colours.red)),
        ],
      ),
    );
  }

  List<Widget> _codeWidgetsList(BuildContext context) {
    const double kGap = Spacing.xxs + Spacing.xxxs;
    List<Widget> fakeInputField = List<Widget>();

    for (int idx = 0; idx < this.widget.maxLength; ++idx) {
      String content = this._allSMSCode[idx] != null ? this._allSMSCode[idx] : "";

      fakeInputField.add(Expanded(
        child: Container(
          padding: EdgeInsets.only(top: kGap, bottom: kGap, right: kGap),
          child: _SMSCodeWidget(
            text: content,
            error: (this.widget._inputState == InputFieldState.wrong),
            highLight: (this._inEditing && this.widget._preValue.length == idx),
          ),
        ),
      ));
    }

    return fakeInputField;
  }

  void _textFieldWatcher() {
    String newValue = this.widget._controller.text;

    if (_whetherValueAcceptable(newValue) == false) {
      this._justResetToPreValue();
      return;
    }

    if (this.widget._preValue == newValue) return;

    if (this.widget.shouldChangeText != null && ((false == this.widget.shouldChangeText(newValue)) || (newValue.length > this.widget.maxLength))) {
      this._justResetToPreValue();
      return;
    }

    if (null != this.widget.onTextDidChanged) {
      this.widget.onTextDidChanged(newValue);
    }
    this.widget._preValue = newValue;

    this._refulfillEachSMSCode(newValue);

    if (null != this.widget.stateOfChangedText) {
      var newState = this.widget.stateOfChangedText(newValue);
      if (newState != this.widget._inputState && newValue.length == this.widget.maxLength) {
        setState(() {
          this.widget._inputState = newState;
        });
      }
    }
  }

  void _textFieldDidEndEditing(BuildContext context, String value) {
    if (this.widget.shouldChangeText != null && true == this.widget.shouldChangeText(value)) {
      this.widget._preValue = value;
    }

    if (this.widget.onTextEndEditing != null) {
      this.widget.onTextEndEditing(value);
    }

    setState(() {
      this._inEditing = false;
    });
  }

  void _textFieldOnTap() {
    this._justResetToPreValue();
    setState(() {
      this._inEditing = true;
    });
  }

  void _refulfillEachSMSCode(String value) {
    if (value.length > this.widget.maxLength) {
      value = value.substring(0, this.widget.maxLength);
    }

    setState(() {
      for (int idx = 0; idx < this.widget.maxLength; ++idx) {
        if (idx < value.length) {
          this._allSMSCode[idx] = value[idx];
        } else {
          this._allSMSCode[idx] = "";
        }
      }
    });
  }

  void _justResetToPreValue() {
    this.widget._controller.text = this.widget._preValue;
    this.widget._controller.selection = TextSelection(
      baseOffset: this.widget._preValue.length,
      extentOffset: this.widget._preValue.length,
    );
  }

  bool _whetherValueAcceptable(String value) {
    RegExp smsReg = RegExp(r"^[0-9]*$");
    Iterable<Match> matches = smsReg.allMatches(value);
    return matches.length > 0;
  }
}

class _SMSCodeWidget extends StatelessWidget {
  final String text;
  final bool highLight;
  final bool error;

  const _SMSCodeWidget({Key key, this.text = "", this.highLight = false, this.error = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.loose(Size(44, 44)),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: (this.error ? Colours.red : Colours.dark),
          width: (this.highLight ? 2.0 : 1.0),
        )),
        color: Colours.clear,
      ),
      child: Center(
        child: Stack(children: <Widget>[
          Text(this.text),
        ]),
      ),
    );
  }
}
