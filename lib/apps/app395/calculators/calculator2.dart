import 'package:flutter/material.dart';

class Calculator2 extends StatefulWidget {
  const Calculator2({super.key});

  @override
  State<Calculator2> createState() => _Calculator2State();
}

class _Calculator2State extends State<Calculator2> {
  TextEditingController gapakUzynlygy = TextEditingController(),
      gulpUzynlygy = TextEditingController();

  List<String> gulpYer = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            controller: gapakUzynlygy,
            decoration: InputDecoration(
              hintText: 'Meselem 50sm',
              labelText: 'Gapagyn Uzynlygy',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            controller: gulpUzynlygy,
            decoration: InputDecoration(
              hintText: 'Meselem 14sm',
              labelText: 'Gulpyn Uzynlygy',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          const Text('Cep ya Sag tarapdan basla tapawudy yok'),
          Text('$gulpYer', style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              setState(() {
                calculate();
              });
            },
            child: Text('HASAPLA'),
          ),
        ],
      ),
    );
  }

  void calculate() {
    gulpYer.clear();
    double? gapak = double.tryParse(gapakUzynlygy.text);
    double? gulp = double.tryParse(gulpUzynlygy.text);
    if (gapak != null && gulp != null) {
      double yarymGulp = gulp / 2;
      gulpYer.add((gapak/2-yarymGulp).toStringAsFixed(1));
      gulpYer.add((gapak/2+yarymGulp).toStringAsFixed(1));
    }
  }
}
