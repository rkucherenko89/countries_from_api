import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const styleActiv = TextStyle(color: Colors.black);
    const styleHint = TextStyle(color: Colors.black);
    final style = widget.text.isEmpty ? styleHint : styleActiv;

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(Icons.search, color: style.color),
        suffixIcon: widget.text.isNotEmpty
            ? GestureDetector(
                child: Icon(Icons.close, color: style.color),
                onTap: () {
                  controller.clear();
                  widget.onChanged('');
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              )
            : null,
        hintText: widget.hintText,
      ),
      onChanged: widget.onChanged,
    );
  }
}
