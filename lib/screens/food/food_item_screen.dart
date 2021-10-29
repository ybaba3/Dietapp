import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../models/models.dart';

//foodの入力値の作成、更新などのアクション設定します
class FoodItemScreen extends StatefulWidget {
  final Function(FoodItem) onCreate;
  final Function(FoodItem) onUpdate;
  final FoodItem? originalItem;
  final bool isUpdating;

  const FoodItemScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  })  : isUpdating = (originalItem != null),
        super(key: key);

  @override
  State<FoodItemScreen> createState() => _FoodItemScreenState();
}

class _FoodItemScreenState extends State<FoodItemScreen> {
  final _foodController = TextEditingController();
  String _food = '';
  Mealtype _mealtype = Mealtype.Breakfast;
  DateTime _inputDate = DateTime.now();
  int _currentValue = 0;

  @override
  void initState() {
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _foodController.text = originalItem.food;
      _food = originalItem.food;
      _mealtype = originalItem.mealtype;
      _currentValue = originalItem.quantity;
      final date = originalItem.date;
      _inputDate = date;
    }
    _foodController.addListener(() {
      setState(() {
        _food = _foodController.text;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _foodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              //TODO 24
            },
          )
        ],
        elevation: 0.0,
        title: Text(
          'InputFood',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildfoodField(),
            buildMealtypeField(),
            buildDateField(context),
            // TODO 16: Add time picker
            // TODO 18: Add slider
            // TODO: 19: Add Grocery Tile
          ],
        ),
      ),
    );
  }

  Widget buildfoodField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Food Name',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        TextField(
          controller: _foodController,
          cursorColor: Colors.blue,
          decoration: const InputDecoration(
            hintText: 'Ex) Banana',
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

  Widget buildMealtypeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mealtype',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        Wrap(
          spacing: 10.0,
          children: [
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _mealtype == Mealtype.Breakfast,
              label: const Text(
                'Breakfast',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) {
                setState(() => _mealtype = Mealtype.Breakfast);
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _mealtype == Mealtype.Lunch,
              label: const Text(
                'Lunch',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) {
                setState(() => _mealtype = Mealtype.Lunch);
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _mealtype == Mealtype.Dinner,
              label: const Text(
                'Dinner',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) {
                setState(() => _mealtype = Mealtype.Dinner);
              },
            ),
          ],
        )
      ],
    );
  }

  Widget buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                final currnetDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currnetDate,
                  firstDate: currnetDate,
                  lastDate: DateTime(currnetDate.year + 5),
                );
                setState(() {
                  if (selectedDate != null) {
                    _inputDate = selectedDate;
                  }
                });
              },
            ),
          ],
        ),
        Text(DateFormat('yyyy-MM-dd').format(_inputDate)),
      ],
    );
  }

  // TODO: Add buildTimeField()

  // TODO: Add buildColorPicker()

  // TODO: Add buildQuantityField()

}
