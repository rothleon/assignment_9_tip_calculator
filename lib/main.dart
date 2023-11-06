import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CIS 3334 Tip Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double _billamount = 0;
  double _tipamount = 0;
  double _tipmultiplier = 0.15;
  double _tipgreatservicemultiplier = 0.20;
  String _tipastext = "";
  bool _isGreatService = false;

  final billAmountField = TextEditingController();

  void _calculatetip() {
    setState(() {
        _billamount = double.parse(billAmountField.text);

        if(_isGreatService){
          _tipamount =  _billamount * _tipgreatservicemultiplier;
        }
        else{
          _tipamount =  _billamount * _tipmultiplier;
        }

        _tipastext = ( "\$" + _tipamount.toStringAsFixed(2) );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text('Tip Calculator', style: Theme.of(context).textTheme.headlineLarge,),

            SizedBox(height: 20),

            Text('Bill Amount', style: Theme.of(context).textTheme.headlineSmall,),

            TextField(controller: billAmountField,keyboardType: TextInputType.number,textAlign: TextAlign.right,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Switch(
                  value: _isGreatService,
                  onChanged: (value) {
                    setState(() {
                      _isGreatService = value;
                    });
                  },
                ),
                Text('Great Service'),
              ],
            ),


            ElevatedButton(
              onPressed: () {
                _calculatetip();
              },
              child: Text("Calculate Tip"),
            ),

            SizedBox(height: 70),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total Tip:',style: Theme.of(context).textTheme.displaySmall, ),
                Text(_tipastext, style: Theme.of(context).textTheme.displaySmall, ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
