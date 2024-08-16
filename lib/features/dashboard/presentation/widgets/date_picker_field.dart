import 'package:flutter/material.dart';
import 'package:vph_web_date_picker/vph_web_date_picker.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/text_styles.dart';
import 'date_picker_icon_box.dart';

class DatePickerField extends StatefulWidget {
  const DatePickerField({super.key});

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime _selectedDate = DateTime.now();

  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: _dateFormat());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextField(
              controller: _controller,
              style: TextStyles.mediumBold,
              decoration: const InputDecoration(
                hoverColor: Colors.transparent,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding12,
                ),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: DatePickerIconBox(
                  icon: Icons.calendar_month,
                  borderRadius: BorderRadiusDirectional.horizontal(
                    end: Radius.circular(4),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide.none,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide.none,
                ),
              ),
              onTap: () async {
                final pickedDate = await showWebDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 14000)),
                  width: 250,
                  withoutActionButtons: true,
                );
                if (pickedDate != null) {
                  _selectedDate = pickedDate;
                  _controller.text = _dateFormat();
                }
              },
            ),
          ),
        ),
        const SizedBox(width: AppDimensions.padding8),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              _selectedDate = DateTime.now();
              _controller.text = _dateFormat();
            },
            child: const DatePickerIconBox(
              icon: Icons.autorenew_rounded,
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
          ),
        ),
      ],
    );
  }

  String _dateFormat() {
    return '${_twoDigitsFormat(_selectedDate.day)}/${_twoDigitsFormat(_selectedDate.month)}/${_selectedDate.year}';
  }

  String _twoDigitsFormat(int number) {
    return _selectedDate.day.toString().padLeft(2, '0');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
