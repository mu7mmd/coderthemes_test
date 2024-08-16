import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 235,
      child: TextField(
        cursorHeight: 16,
        cursorWidth: 1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 4),
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search, size: 20),
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.background,
        ),
      ),
    );
  }
}
