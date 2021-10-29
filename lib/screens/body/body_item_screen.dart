import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/models.dart';

//Bodyの入力値の作成、更新などのアクション設定します
class BodyItemScreen extends StatefulWidget {
  final Function(BodyItem) onCreate;
  final Function(BodyItem) onUpdate;
  final BodyItem? originalItem;
  final bool isUpdating;

  const BodyItemScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  })  : isUpdating = (originalItem != null),
        super(key: key);

  @override
  State<BodyItemScreen> createState() => _BodyItemScreenState();
}

class _BodyItemScreenState extends State<BodyItemScreen> {
  final _weightController = TextEditingController();
  int _weight = 0;
  DateTime _binputDate = DateTime.now();

  @override
  void initState() {
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _weightController.value = originalItem.weight as TextEditingValue;
      _weight = originalItem.weight;
      final date = originalItem.date;
      _binputDate = date;
    }
    _weightController.addListener(() {
      setState(() {
        _weight = _weightController.value as int;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {}, //後ほど保存ボタンを設定します。
          )
        ],
        elevation: 0.0,
        title: Text(
          'Input Weight',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildbodyField(),
          ],
        ),
      ),
    );
  }

  Widget buildbodyField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _weightController,
          keyboardType: TextInputType.number,
          cursorColor: Colors.blue,
        )
      ],
    );
  }
}
