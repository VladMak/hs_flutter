import 'package:flutter/material.dart';

// Обычное текстовое поле
class TextFieldItem extends StatefulWidget {
  String? value; // Значение, отображаемое в поле
  bool? readOnly; // Только чтение
  Color focusColor; // Цвет, которым будет выделяться лэйбл и подчёркивание поля
  String labelText; // Текст лэйбла
  IconData? icon;
  int? maxLines;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  final void Function()? onTap; // Событие при нажатии
  final void Function(String)? onSave;
  final String? Function(String)? onValidate;

  TextFieldItem(
      {Key? key,
      this.value,
      this.readOnly = false,
      required this.focusColor,
      required this.labelText,
      this.icon,
      this.maxLines = 1,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      required this.onTap,
      this.onSave,
      this.onValidate})
      : super(key: key);

  // объект для хранения содержимого текстового поля
  final textController = TextEditingController();

  @override
  State<TextFieldItem> createState() => TextFieldItemState();
}

class TextFieldItemState<T extends TextFieldItem> extends State<T> {
  // Объект для обработки "фокуса"
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    // Логика заполнения при каждом обновлении стэйта
    if (widget.textController.text == "") {
      if (widget.value != null) widget.textController.text = widget.value!;
    }
    // Ставим курсор в конец содержимого
    widget.textController.selection = TextSelection.fromPosition(
        TextPosition(offset: widget.textController.text.length));
    // Это нужно, чтобы цвет выделения менялся
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(func) {
    super.didUpdateWidget(func);
    widget.textController.text = func.textController.text;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Widget? _hasIcon() {
    if (widget.icon != null) {
      return Icon(widget.icon,
          color:
              _focusNode.hasFocus ? widget.focusColor : Colors.grey.shade500);
    }
  }

  // Непосредственно текстовое поле
  TextFormField _rootTextField() {
    return TextFormField(
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      textInputAction: widget.textInputAction,
      textCapitalization: TextCapitalization.sentences,
      focusNode: _focusNode,
      controller: widget.textController,
      cursorColor: widget.focusColor,
      readOnly: widget.readOnly!,
      onFieldSubmitted: (v) {
        _focusNode.unfocus();
      },
      onTap: () {
        setState(() {
          widget.onTap!();
        });
      },
      onEditingComplete: () {
        setState(() {});
      },
      validator: (value) {
        if (widget.onValidate != null) return widget.onValidate!(value!);
      },
      onSaved: (value) {
        widget.onSave!(value!);
      },
      // Настраиваем дизайн
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.focusColor)),
        labelStyle: TextStyle(
            color:
                _focusNode.hasFocus ? widget.focusColor : Colors.grey.shade500),
        labelText: widget.labelText,
        icon: _hasIcon(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _rootTextField();
  }
}

// Производный класс - текстовое поле с выпадающим списком
class DropDownTextField extends TextFieldItem {
  // Поля те же самые плюс items - коллекция значений выпадающего списка
  String? value;
  bool? readOnly;
  Color focusColor;
  String labelText;
  final List<String> items;
  IconData? icon;
  final void Function()? onTap;
  final void Function(String)? onSave;
  final String? Function(String)? onValidate;

  DropDownTextField(
      {Key? key,
      this.value,
      this.readOnly = false,
      required this.focusColor,
      required this.labelText,
      required this.items,
      this.icon,
      required this.onTap,
      this.onSave,
      this.onValidate})
      : super(
            key: key,
            value: value,
            readOnly: readOnly,
            focusColor: focusColor,
            labelText: labelText,
            icon: icon,
            onTap: onTap,
            onSave: onSave,
            onValidate: onValidate);

  @override
  State<DropDownTextField> createState() => DropDownTextFieldState();
}

class DropDownTextFieldState extends TextFieldItemState<DropDownTextField> {
  // Слой для выпадающего списка
  late OverlayEntry _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    // Логика заполнения при каждом обновлении стэйта
    if (widget.textController.text == "") {
      if (widget.value != null) widget.textController.text = widget.value!;
    }

    // Это нужно, чтобы цвет выделения менялся, и сам выпадающий список появлялся
    _focusNode.addListener(() {
      setState(() {});
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context)!.insert(this._overlayEntry);
      } else {
        try {
          _overlayEntry.remove();
        } catch (e) {}
      }
    });
  }

  // Метод для создания выпадающего списка
  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
        builder: (context) => Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, size.height + 5.0),
                child: Material(
                  elevation: 4.0,
                  child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: widget.items.map<ListTile>((String item) {
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            widget.textController.text = item;
                            _overlayEntry.remove();
                            _focusNode.unfocus();
                          },
                        );
                      }).toList()),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: _rootTextField(),
    );
  }
}

class AuthFormTextField extends StatefulWidget {
  Color focusColor;
  String labelText;
  IconData icon;
  bool? hidden;
  final String? Function(String)? validator;
  final void Function(String)? saver;

  AuthFormTextField(
      {Key? key,
      required this.focusColor,
      required this.labelText,
      required this.icon,
      this.hidden = false,
      required this.validator,
      required this.saver})
      : super(key: key);

  @override
  State<AuthFormTextField> createState() => _AuthFormTextFieldState();
}

class _AuthFormTextFieldState extends State<AuthFormTextField> {
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      obscureText: widget.hidden as bool,
      keyboardType: TextInputType.name,
      autofocus: false,
      focusNode: _focusNode,
      cursorColor: widget.focusColor,
      decoration: new InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.focusColor)),
        labelText: widget.labelText,
        labelStyle: TextStyle(
            color:
                _focusNode.hasFocus ? widget.focusColor : Colors.grey.shade500),
        icon: Icon(widget.icon,
            color:
                _focusNode.hasFocus ? widget.focusColor : Colors.grey.shade500),
      ),
      validator: (value) {
        return widget.validator!(value!);
      },
      onSaved: (value) {
        widget.saver!(value!);
      },
    );
  }
}
