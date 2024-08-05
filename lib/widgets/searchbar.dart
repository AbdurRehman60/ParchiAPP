import 'package:flutter/material.dart';
import 'package:parchi_app/constants/color_theme.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.onChanged});
  final ValueChanged<String> onChanged;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 355,
      height: 53,
      child: TextField(
        controller: _searchController,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: 'Search by event name ',
          hintStyle:
              TextStyle(fontSize: 14, color: parchiColorTheme().darkgreen),
          prefixIcon: Icon(
            Icons.search,
            color: parchiColorTheme().darkgreen,
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide.none),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
