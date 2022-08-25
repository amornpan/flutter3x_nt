import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> login(Map<dynamic, dynamic> fromValue) async {
    //print(fromValue['email']);
    //print(fromValue['password']);
    var url = Uri.parse('https://api.codingthailand.com/api/login');
    var response = await http.post(
      url,
      body: {
        'email': fromValue['email'],
        'password': fromValue['password'],
      },
    );

    if (response.statusCode == 200) {
      //lointoken = json.decode(response.body);
      //return lointoken;
      print(response.body);
    } else {
      // throw Exception('Found error from APIs connection.!!');
       print(response.body);
    }
  }

  // Future<void> login(Map fromValue) async{

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueGrey.shade200,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange, Colors.orange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 80,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'R&D',
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 25),
                      child: Column(
                        children: [
                          FormBuilder(
                            key: _formKey,
                            autovalidateMode: AutovalidateMode.always,
                            child: Column(
                              children: [
                                FormBuilderTextField(
                                  name: 'email',
                                  maxLines: 1,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    filled: true,
                                    fillColor: Colors.yellow.shade100,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                        errorText: 'กรุณาป้อนข้อมูลอีเมลด้วย'),
                                    FormBuilderValidators.email(
                                        errorText: 'รูปแบบอีเมลไม่ถูกต้อง'),
                                  ]),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                FormBuilderTextField(
                                  name: 'password',
                                  maxLines: 1,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    filled: true,
                                    fillColor: Colors.yellow.shade100,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                        errorText:
                                            'กรุณาป้อนข้อมูลรหัสผ่านด้วย'),
                                    FormBuilderValidators.minLength(6,
                                        errorText:
                                            'รหัสผ่านต้องมีความยาวอย่างน้อย 6 ตัวอักษร'),
                                  ]),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: MaterialButton(
                                        height: 50,
                                        textColor: Colors.white,
                                        color: Colors.blueGrey,
                                        onPressed: () {
                                          _formKey.currentState!.save();
                                          if (_formKey.currentState!
                                              .validate()) {
                                            //print('### ${_formKey.currentState!.value}');
                                            login(_formKey.currentState!.value);
                                          }
                                        },
                                        child: const Text(
                                          'เข้าสู่ระบบ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
