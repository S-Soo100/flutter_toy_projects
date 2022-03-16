import 'package:flutter/material.dart';


TextStyle myTextStyle() => const TextStyle(color: Colors.indigoAccent, fontSize: 16.0);

TextStyle myBoxNameStyle() {
  return const TextStyle(
    color: Colors.indigoAccent,
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
  );
}

class TextFormWidget extends StatefulWidget {
  const TextFormWidget(
      {Key? key,
        required this.boxName,
        required this.textEditingController,
        this.validator,
        this.inputFormatter,
        this.submit,
        this.onSaved})
      : super(key: key);

  final String boxName;
  final validator;
  final TextEditingController textEditingController;
  final inputFormatter;
  final onSaved;
  final Function? submit;

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    TextInputAction action = TextInputAction.next;
    if (widget.submit != null) action = TextInputAction.done;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.boxName,
            style: myBoxNameStyle(),
          ),
          TextFormField(
            textInputAction: action,
            onEditingComplete: () =>
            {if (widget.submit != null) widget.submit!()},
            onSaved: widget.onSaved,
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.always,
            controller: widget.textEditingController,
            style: myTextStyle(),
            decoration: const InputDecoration(
              // contentPadding: EdgeInsets.zero,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.indigoAccent),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.indigoAccent, width: 3.0),
              ),
            ),
            inputFormatters: widget.inputFormatter,
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}