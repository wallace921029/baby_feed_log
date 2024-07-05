import 'package:flutter/material.dart';

class AdCard extends StatefulWidget {
  const AdCard({super.key});

  @override
  State<AdCard> createState() => _AdCardState();
}

class _AdCardState extends State<AdCard> {
  // 变量标记是否已经吃AD
  bool _isEaten = false;

  // 吃ad的时间
  DateTime? _eatenTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _isEaten ? Colors.green[50] : null,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '今天吃AD了吗？',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Switch(
              value: _isEaten,
              onChanged: (bool value) {
                setState(() {
                  _isEaten = value;
                  if (_isEaten) {
                    _eatenTime = DateTime.now();
                  } else {
                    _eatenTime = null;
                  }
                });
              },
            ),
            if (_isEaten)
              Text(
                _eatenTime != null
                    ? '${_eatenTime!.year}-${_eatenTime!.month}-${_eatenTime!.day} ${_eatenTime!.hour}:${_eatenTime!.minute}:${_eatenTime!.second}'
                    : '-',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
