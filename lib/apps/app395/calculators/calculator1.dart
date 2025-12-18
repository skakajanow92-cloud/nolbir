import 'package:flutter/material.dart';

class Calculator1 extends StatefulWidget {
  const Calculator1({super.key});

  @override
  State<Calculator1> createState() => _Calculator1State();
}

class _Calculator1State extends State<Calculator1> {
  TextEditingController icUzynlyk = TextEditingController(),
      polkaSan = TextEditingController(),
      galynlyk = TextEditingController(text: '1.8');

  List<String> polkalar = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            controller: icUzynlyk,
            decoration: InputDecoration(
              hintText: 'Meselem 174sm',
              labelText: 'Icinin Uzynlygy',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            controller: polkaSan,
            decoration: InputDecoration(
              hintText: 'Meselem 4 sany',
              labelText: 'Polkalaryn Sany',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            controller: galynlyk,
            decoration: InputDecoration(
              hintText: 'Meselem 1.8sm',
              labelText: 'Bir Polkan Galynlygy',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          const Text('Asakdan Yokaryk Su olceglerde Polka Pimlenni kakyber!'),
          Text('$polkalar', style: Theme.of(context).textTheme.headlineMedium),
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
    polkalar.clear();
    double? dIcUzynlyk = double.tryParse(icUzynlyk.text);
    double? dPolkaSan = double.tryParse(polkaSan.text);
    double? dGalynlyk = double.tryParse(galynlyk.text);
    if (dIcUzynlyk != null && dPolkaSan != null && dGalynlyk != null) {
      double dolyGalynlyk = dGalynlyk * dPolkaSan;
      double arassaUzynlyk = dIcUzynlyk - dolyGalynlyk;
      double birAra = arassaUzynlyk / (dPolkaSan + 1);
      for (var i = 0; i < dPolkaSan; i++) {
        polkalar.add(
          (birAra + (i * dGalynlyk) + (i * birAra)).toStringAsFixed(1),
        );
      }
    }
  }

}
