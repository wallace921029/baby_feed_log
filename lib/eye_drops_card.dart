import 'package:flutter/material.dart';

class EyeDropsCard extends StatefulWidget {
  const EyeDropsCard({super.key});

  @override
  State<EyeDropsCard> createState() => _EyeDropsCardState();
}

class _EyeDropsCardState extends State<EyeDropsCard> {
  // 眼药水次数
  int _count = 0;

  // 输入框控制器
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _textController.text = _count.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '眼药水',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      _count = _count - 1;
                      _textController.text = _count.toString();
                    });
                  },
                ),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '次数',
                    ),
                    readOnly: true,
                    controller: _textController,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _count = _count + 1;
                      _textController.text = _count.toString();
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
