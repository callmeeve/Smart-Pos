import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class DateTimePickerReel extends StatelessWidget {
  const DateTimePickerReel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: DateTimePicker(
        showCursor: false,
        type: DateTimePickerType.dateTimeSeparate,
        dateMask: 'd MMM, yyyy',
        initialValue: DateTime.now().toString(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2050),
        icon: const Icon(Icons.event),
        dateLabelText: 'Tanggal',
        timeLabelText: "Pukul",
        onChanged: (value) => print(value),
        onSaved: (value) => print(value),
      ),
    );
  }
}
