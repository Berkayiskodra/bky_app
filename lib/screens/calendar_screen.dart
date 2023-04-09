import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<CalendarScreen> {

  DateTime? selectedDate;

  getToday() {
    selectedDate = DateTime.now();
    setState(() {});
  }

  getTomorrow() {
    selectedDate = DateTime.now();
    selectedDate = selectedDate!.add(const Duration(days: 1));
    setState(() {});
  }

  getNextDay() {
    if (selectedDate == null) {
      selectedDate = DateTime.now();
    } else {
      selectedDate = selectedDate!.add(const Duration(days: 1));
    }
    setState(() {});
  }

  getNextMonth() {
    selectedDate = DateTime.now();
    selectedDate = selectedDate!.add(const Duration(days: 30));
    setState(() {});
  }

  showDate() {
    if (selectedDate != null) {
      return Text(selectedDate.toString());
    } else {
    return const Text('Tarih Yok');
    }
  }

  showFormatedDate() {
    if (selectedDate != null) {
      var tarihim = DateFormat('dd.MM.yyy').format(selectedDate!);
      return Text(tarihim.toString());
    } else {
    return const Text('Tarih Yok');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(192, 192, 192, 3),
      appBar: AppBar(
        title: const Text('Calendar Screen'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: 243,
                width: double.infinity,
                alignment: Alignment.centerRight,
                //color: Colors.orange
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/c.cover.jpeg')),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => getToday(),
              child: const Text('Bugün'),
            ),
            const SizedBox(height: 7),
            ElevatedButton(
              onPressed: () => getTomorrow(),
              child: const Text('Yarın'),
            ),
            const SizedBox(height: 7),
            ElevatedButton(
              onPressed: () => getNextMonth(),
              child: const Text('30 gün sonra'),
            ),
            const SizedBox(height: 7),
            ElevatedButton(
              onPressed: () => getNextDay(),
              child: const Text('Sonraki Gün'),
            ),
            const SizedBox(height: 20),
            showFormatedDate()
          ],
      ),
    );
  }
}