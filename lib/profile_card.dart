import 'dart:async';

import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  // 现在时间，动态计算
  DateTime _now = DateTime.now();

  Timer? _timer;

  // 宝宝几天了
  final int _babyDays = 71;

  @override
  void initState() {
    super.initState();

    // 每秒更新一次时间
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  // 在 dispose 时取消定时器
  @override
  void dispose() {
    super.dispose();

    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 实时显示现在的时间，格式 YYYY-MM-DD HH:mm:ss，并且每秒都会更新
            Text(
              '现在时间：${_now.year}-${_now.month}-${_now.day} ${_now.hour}:${_now.minute}:${_now.second}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            // 宝宝几天了
            Text(
              '宝宝已经$_babyDays天啦',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
