import 'package:flutter/material.dart';

class IoDateTimeEntry {
  final String label;
  final String date;
  final String time;

  IoDateTimeEntry({
    required this.label,
    required this.date,
    required this.time,
  });
}

class IoDateTimeSummaryCard extends StatelessWidget {
  final List<IoDateTimeEntry> entries;

  const IoDateTimeSummaryCard({super.key, required this.entries});

  Widget _chip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Text(text, style: TextStyle(fontSize: 14, color: Colors.black87)),
    );
  }

  Widget _entry(IoDateTimeEntry entry) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(entry.label, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Row(children: [_chip("${entry.date}   ${entry.time}")]),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Row> rows = [];
    for (int i = 0; i < entries.length; i += 2) {
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _entry(entries[i]),
            if (i + 1 < entries.length)
              _entry(entries[i + 1])
            else
              Expanded(child: Container()),
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Column(children: rows),
    );
  }
}
