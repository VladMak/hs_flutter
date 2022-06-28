import 'dart:collection';

import 'package:flutter/material.dart';

import '../main.dart';
import '../models/Api.dart';
import 'Cabinet.dart';

class LoginSignupPage extends StatefulWidget {

  LoginSignupPage({Key? key, required Queue<BuildContext> this.queue, required this.updateTitle}): super(key: key);

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
            loginButtonWidget(),
            secondaryButton(),
            errorWidget(),
            progressWidget()
          ],
        ),
      ),
    );
  }

  Widget progressWidget() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
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
          _nameWidget(),
          _emailWidget(),
          _passwordWidget(),
        ],
      ),
    );
  }

  Widget _nameWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.name,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Имя пользователя',
            icon: new Icon(
              Icons.person_pin_rounded,
              color: Colors.grey,
            )),
        validator: (value) =>
            value!.isEmpty ? 'Имя пользователя не должно быть пустым' : null,
        onSaved: (value) => _name = value!.trim(),
      ),
    );
  }

  Widget _emailWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Адрес электронной почты',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value!.isEmpty
            ? 'Адрес электронной почты не должен быть пустым'
            : null,
        onSaved: (value) => _email = value!.trim(),
      ),
    );
  }

  Widget _passwordWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Пароль',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) =>
            value!.isEmpty ? 'Пароль не должен быть пустым' : null,
        onSaved: (value) => _password = value!.trim(),
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
          color: Colors.blue,
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
              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300))
          : new Text('Уже зарегестрированы? Войти',
              style:
                  new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
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
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
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
          }
          else {
            // СЮДА не успешный ввод пароля
            showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Ошибка'),
              content: Text("Неверное имя пользователя, пароль или адрес электронной почты. Повторите попытку."),
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
          }
        } else {
          Api api = Api();
          var logged =
              await api.registration(name: _name, email: _email, pswd: _password);
          if (logged) {
            // СЮДА в случае успешного входа, перекинуть на главную страницу, или на Кабинет
            Navigator.of(widget.queue.removeLast()).pushReplacement(
                  MaterialPageRoute(builder: (context) => Cabinet()));
            widget.queue.addLast(
                keyFragmentBody.currentState?.getContext() as BuildContext);
            widget.updateTitle(screenTitles[Screen.Cabinet]);
          }
          else {
            // СЮДА не успешный ввод пароля
            showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Ошибка'),
              content: Text("Не удалось зарегистрировать пользователя. Повторите попытку."),
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
          }
        }
        setState(() {
          _isLoading = false;
        });

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
}
