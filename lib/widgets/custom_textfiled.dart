// ignore_for_file: library_private_types_in_public_api

// ignore: unnecessary_import
import 'package:flutter/material.dart';
import 'package:parchi_app/constants/color_theme.dart';
import 'package:parchi_app/constants/text_theme.dart';

class CustomTextField1 extends StatefulWidget {
  final TextEditingController controller;
  final Icon prefixIcon;
  final String hintText;
  final TextStyle hintStyle;
  final String? Function(String?)? validator;
  final List<String> suggestions;
  final ValueChanged<String>? onSuggestionSelected;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;

  const CustomTextField1({
    super.key,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
    required this.hintStyle,
    this.validator,
    this.suggestions = const [],
    this.onSuggestionSelected,
    this.enabledBorder,
    this.focusedBorder,
  });

  @override
  _CustomTextField1State createState() => _CustomTextField1State();
}

class _CustomTextField1State extends State<CustomTextField1> {
  late List<String> _filteredSuggestions;

  @override
  void initState() {
    super.initState();
    _filteredSuggestions = widget.suggestions;
  }

  void _filterSuggestions(String input) {
    setState(() {
      _filteredSuggestions = widget.suggestions
          .where((suggestion) =>
              suggestion.toLowerCase().contains(input.toLowerCase()))
          .toList();
    });
  }

  void _clearInput() {
    widget.controller.clear();
    _filterSuggestions('');
    if (widget.onSuggestionSelected != null) {
      widget.onSuggestionSelected!('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 04,
          borderRadius: BorderRadius.circular(8),
          child: TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: parchiColorTheme().neutral200,
                ),
              ),
              enabledBorder: widget.enabledBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: parchiColorTheme().white,
                    ),
                  ),
              focusedBorder: widget.focusedBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: parchiColorTheme().black,
                    ),
                  ),
              suffixIcon: widget.controller.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: parchiColorTheme().darkgreen,
                        weight: 50,
                      ),
                      onPressed: _clearInput,
                    )
                  : null,
            ),
            validator: widget.validator,
            onChanged: (text) {
              _filterSuggestions(text);
              if (widget.onSuggestionSelected != null) {
                widget.onSuggestionSelected!(text);
              }
            },
          ),
        ),
        if (_filteredSuggestions.isNotEmpty)
          Container(
            constraints: const BoxConstraints(maxHeight: 200),
            color: parchiColorTheme().tracesofember,
            child: ListView.builder(
              itemCount: _filteredSuggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _filteredSuggestions[index],
                    style: parchiTextTheme().heading7.copyWith(
                          fontWeight: FontWeight.w600,
                          color: parchiColorTheme().darkgreen,
                        ),
                  ),
                  onTap: () {
                    widget.controller.text = _filteredSuggestions[index];
                    setState(() {
                      _filteredSuggestions.clear();
                    });
                    if (widget.onSuggestionSelected != null) {
                      widget.onSuggestionSelected!(_filteredSuggestions[index]);
                    }
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}
