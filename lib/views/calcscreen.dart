import 'package:flutter/material.dart';

class Calcscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalcscreenState();
  }
}

class _CalcscreenState extends State<Calcscreen> {
  TextEditingController txn1 = TextEditingController();
  TextEditingController txn2 = TextEditingController();
  TextEditingController txnr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            controller: txn1,
            decoration: InputDecoration(labelText: "N1"),
          ),
          TextField(
            controller: txn2,
            decoration: InputDecoration(labelText: "N2"),
          ),
          SizedBox(height: 20),
          Row(
            children:  [ 
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    double n1 = double.parse(txn1.text);
                    double n2 = double.parse(txn2.text);
                    txnr.text = '${n1 + n2}';
                    setState(() {});
                  },
                  child: Text("+"),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    double n1 = double.parse(txn1.text);
                    double n2 = double.parse(txn2.text);
                    txnr.text = '${n1 - n2}';
                    setState(() {});
                  },
                  child: Text("-"),
                ),
              ),Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    double n1 = double.parse(txn1.text);
                    double n2 = double.parse(txn2.text);
                    txnr.text = '${n1 * n2}';
                    setState(() {});
                  },
                  child: Text("*"),
                ),
              ),Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    double n1 = double.parse(txn1.text);
                    double n2 = double.parse(txn2.text);
                    txnr.text = '${n1 / n2}';
                    setState(() {});
                  },
                  child: Text("/"),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          TextField(
            controller: txnr,
            enabled: false,
            decoration: InputDecoration(labelText: "Resultado"),
          ),
        ],
      ),
    );
  }
}
