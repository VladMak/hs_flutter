import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:myapp/views/PersonalDataProtection.dart';

import '../main.dart';
import '../models/Api.dart';
import '../models/CustomTextFields.dart';
import 'Cabinet.dart';

String? validateEmail(value) {
  var regemail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (value.isEmpty) {
    return 'Адрес электронной почты не должен быть пустым';
  }

  if (regemail.hasMatch(value)) {
    print("Корректная почта");
  } else {
    return ("Некорректная почта");
  }

  return null;
}

class LoginSignupPage extends StatefulWidget {
  LoginSignupPage(
      {Key? key,
      required Queue<BuildContext> this.queue,
      required this.updateTitle})
      : super(key: key);

  Queue<BuildContext> queue;
  final ValueChanged<String?> updateTitle;

  @override
  State<StatefulWidget> createState() => new _LoginSignupPageState();
}

enum FormMode { LOGIN, SIGNUP }

class _LoginSignupPageState extends State<LoginSignupPage> {
  final _formKey = new GlobalKey<FormState>();

  late String _email;
  late String _password;
  late String _name;
  String _errorMessage = "";

  // this will be used to identify the form to show
  FormMode _formMode = FormMode.LOGIN;
  bool _isIos = false;
  bool _isLoading = false;
  Color focusColor = Color.fromARGB(0xFF, 0xB3, 0x19, 0x18);
  late FocusNode _focusNode;

  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /*appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: new Text(
          "Вход в Хлеб-Соль",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(0xFF, 0xEC, 0xBA, 0x10),
      ),*/
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            formWidget(),
            policy(),
            loginButtonWidget(),
            secondaryButton(),
            errorWidget(),
            progressWidget()
          ],
        ),
      ),
    );
  }

  Widget policy() {
    return _formMode == FormMode.LOGIN
        ? Container()
        : Row(children: [
            _MyCheckbox(),
            GestureDetector(
              child: Text("Я принимаю политику конфиденциальности"),
              onTap: () {
                Navigator.push(
                    keyFragmentBody.currentContext as BuildContext,
                    MaterialPageRoute(
                        builder: (context) => PersonalDataProtection()));
              },
            )
          ]);
  }

  Widget progressWidget() {
    if (_isLoading) {
      return const Center(
          child: CircularProgressIndicator(
              color: Color.fromARGB(0xFF, 0xB3, 0x19, 0x18)));
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget formWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _mobileNumWidget(),
          _emailWidget(),
          _passwordWidget(),
        ],
      ),
    );
  }

  Widget _mobileNumWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: TextFieldItem(
        focusColor: focusColor,
        labelText: 'Мобильный телефон',
        icon: Icons.phone_android,
        keyboardType: TextInputType.phone,
        onTap: () {},
        onSave: (value) => _name = value.trim(),
        onValidate: (value) =>
            value.isEmpty ? 'Необходимо указать рабочий номер телефона' : null,
      ),
    );
  }

  Widget _emailWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFieldItem(
        focusColor: focusColor,
        labelText: 'Адрес электронной почты',
        icon: Icons.mail,
        keyboardType: TextInputType.emailAddress,
        onTap: () {},
        onSave: (value) => _email = value.trim(),
        onValidate: (value) => validateEmail(value),
      ),
    );
  }

  Widget _passwordWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: AuthFormTextField(
        focusColor: focusColor,
        labelText: 'Пароль',
        hidden: true,
        icon: Icons.lock,
        saver: (value) => _password = value.trim(),
        validator: (value) =>
            value.isEmpty ? 'Пароль не должен быть пустым' : null,
      ),
    );
  }

  Widget loginButtonWidget() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: new MaterialButton(
          elevation: 5.0,
          minWidth: 200.0,
          height: 42.0,
          color: Color.fromARGB(0xFF, 0xB3, 0x19, 0x18),
          child: _formMode == FormMode.LOGIN
              ? new Text('Войти',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white))
              : new Text('Регистрация',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed: _validateAndSubmit,
        ));
  }

  Widget secondaryButton() {
    return new FlatButton(
      child: _formMode == FormMode.LOGIN
          ? new Text('Создать аккаунт',
              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500))
          : new Text('Уже зарегистрированы? Войти',
              style:
                  new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
      onPressed: _formMode == FormMode.LOGIN ? showSignupForm : showLoginForm,
    );
  }

  void showSignupForm() {
    _formKey.currentState!.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void showLoginForm() {
    _formKey.currentState!.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }

  Widget errorWidget() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 18.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w700),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (_validateAndSave()) {
      String userId = "";
      try {
        if (_formMode == FormMode.LOGIN) {
          Api api = Api();
          var logged =
              await api.login(name: _name, email: _email, pswd: _password);
          if (logged) {
            // СЮДА в случае успешного входа, перекинуть на главную страницу, или на Кабинет
            Navigator.of(widget.queue.removeLast()).pushReplacement(
                MaterialPageRoute(builder: (context) => Cabinet()));
            widget.queue.addLast(
                keyFragmentBody.currentState?.getContext() as BuildContext);
            widget.updateTitle(screenTitles[Screen.Cabinet]);
          } else {
            // СЮДА не успешный ввод пароля
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Ошибка'),
                content: Text(
                    "Неверное имя пользователя, пароль или адрес электронной почты. Повторите попытку."),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Закрыть');
                      setState(() {
                        _isLoading = false;
                      });
                    },
                    child: const Text('Закрыть'),
                  ),
                ],
              ),
            );
          }
        } else {
          Api api = Api();

          var logged = await api.registration(
              name: _name, email: _email, pswd: _password);
          print("LOGGED {$logged}");
          await _confirmCodeDialog(context);
          if (_textFieldController.text == logged) {
            // Коды совпали
            Navigator.of(widget.queue.removeLast()).pushReplacement(
                MaterialPageRoute(builder: (context) => Cabinet()));
            widget.queue.addLast(
                keyFragmentBody.currentState?.getContext() as BuildContext);
            widget.updateTitle(screenTitles[Screen.Cabinet]);

            setState(() {
              _isLoading = false;
            });
          } else {
            setState(() {
              _isLoading = false;
              _errorMessage = "Неверный код!";
            });
          }
          /*if (logged != "false") {
            // СЮДА в случае успешного входа, перекинуть на главную страницу, или на Кабинет
            Navigator.of(widget.queue.removeLast()).pushReplacement(
                MaterialPageRoute(builder: (context) => Cabinet()));
            widget.queue.addLast(
                keyFragmentBody.currentState?.getContext() as BuildContext);
            widget.updateTitle(screenTitles[Screen.Cabinet]);
          } else {
            // СЮДА не успешный ввод пароля
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Ошибка'),
                content: Text(
                    "Не удалось зарегистрировать пользователя. Повторите попытку."),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Закрыть');
                    },
                    child: const Text('Закрыть'),
                  ),
                ],
              ),
            );
          }*/
        }

        if (userId.length > 0 && userId != null) {
          //widget.onSignedIn();
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
          if (_isIos) {
            //_errorMessage = e.details;
          } else {
            //_errorMessage = e.message;
          }
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _confirmCodeDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Подтверждение электронной почты'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Введите код подтверждения"),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Отмена'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('Подтвердить'),
              onPressed: () {
                print(_textFieldController.text);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

class _MyCheckbox extends StatefulWidget {
  const _MyCheckbox({Key? key}) : super(key: key);

  @override
  State<_MyCheckbox> createState() => __MyCheckboxState();
}

class __MyCheckboxState extends State<_MyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
