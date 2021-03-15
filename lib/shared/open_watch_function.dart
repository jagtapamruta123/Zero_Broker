//  Future<Null> _selectTime(BuildContext context) async {
//     final TimeOfDay picked = await showTimePicker(
//       context: context,
//       initialTime: selectedTime,
//     );
//     if (picked != null)
//       setState(() {
//         selectedTime = picked;
//         _hour = selectedTime.hour.toString();
//         _minute = selectedTime.minute.toString();
//         _time = _hour + ' : ' + _minute;
//         _fromTime.text = _time;
//         // _fromTime.text = formatDate(
//         //     DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
//         //     [hh, ':', nn, " ", am]).toString();
//       });
//   }
