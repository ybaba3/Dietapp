import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/models.dart';

//exerciseの入力値の作成、更新などのアクション設定します
class ExerciseItemScreen extends StatefulWidget {
  final Function(ExerciseItem) onCreate;
  final Function(ExerciseItem) onUpdate;
  final ExerciseItem? originalItem;
  final bool isUpdating;

  const ExerciseItemScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  })  : isUpdating = (originalItem != null),
        super(key: key);

  @override
  State<ExerciseItemScreen> createState() => _ExerciseItemScreenState();
}

class _ExerciseItemScreenState extends State<ExerciseItemScreen> {
  final _exerciseController = TextEditingController();
  String _exercise = '';
  DateTime _inputDate = DateTime.now();

  @override
  void initState() {
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _exerciseController.text = originalItem.exercise;
      _exercise = originalItem.exercise;
      final date = originalItem.date;
      _inputDate = date;
    }
    _exerciseController.addListener(() {
      setState(() {
        _exercise = _exerciseController.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {},
          )
        ],
        elevation: 0.0,
        title: Text(
          'Input Exercise',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildexerciseField(),
          ],
        ),
      ),
    );
  }

  Widget buildexerciseField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Exercice',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        TextField(
          controller: _exerciseController,
          cursorColor: Colors.blue,
          decoration: const InputDecoration(
            hintText: 'Ex) Jogging',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
