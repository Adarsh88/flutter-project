import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _idcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _gendercontroller = TextEditingController();
  bool _switchValue = false;

  @override
  void initState() {
    super.initState();
    _namecontroller.addListener(() {
      final String text = _namecontroller.text.toLowerCase();
      _namecontroller.value = _namecontroller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    _idcontroller.addListener(() {
      final String text = _idcontroller.text.toLowerCase();
      _idcontroller.value = _idcontroller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    _emailcontroller.addListener(() {
      final String text = _emailcontroller.text.toLowerCase();
      _emailcontroller.value = _emailcontroller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    _gendercontroller.addListener(() {
      final String text = _gendercontroller.text.toLowerCase();
      _gendercontroller.value = _gendercontroller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            top: screenSize.height * 0.10,
            left: screenSize.width / 15,
            right: screenSize.width / 15,
            bottom: 0),
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenSize.height * 0.04),
                const Text(
                  'New User',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF263b5e)),
                ),
                Form(
                  key: formKey,
                  child: SizedBox(
                    width: screenSize.width > 800
                        ? screenSize.width / 3
                        : screenSize.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenSize.height * 0.04,
                          ),
                          TextFormField(
                            controller: _idcontroller,
                            decoration: const InputDecoration(
                                labelText: 'Enter your id'),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[0-9]{1,6}$').hasMatch(value)) {
                                return "Enter Correct ID";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: screenSize.height * 0.04,
                          ),
                          TextFormField(
                            controller: _namecontroller,
                            decoration: const InputDecoration(
                                labelText: 'Enter your name'),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                return "Enter Correct Name";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: screenSize.height * 0.04,
                          ),
                          TextFormField(
                            controller: _emailcontroller,
                            decoration: const InputDecoration(
                                labelText: 'Enter your email'),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                return "Enter Correct Email";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: screenSize.height * 0.04,
                          ),
                          TextFormField(
                            controller: _gendercontroller,
                            decoration: const InputDecoration(
                                labelText: 'Enter your gender'),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                return "Enter Correct Gender";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: screenSize.height * 0.03,
                          ),
                          Row(
                            children: [
                              Text('Status'),
                              Switch(
                                value: _switchValue,
                                onChanged: (value) {
                                  setState(() {
                                    _switchValue = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    formKey.currentState!.validate();
                                  },
                                  child: const Text('Submit')),
                            ),
                          )
                        ]),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
