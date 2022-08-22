import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Algorithm extends StatefulWidget {
  const Algorithm({Key? key}) : super(key: key);

  @override
  State<Algorithm> createState() => _AlgorithmState();
}

class _AlgorithmState extends State<Algorithm> {
  final List<bool> _isSelection = [false, false, false];
  final ScrollController s_controller = ScrollController();
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.invertedStylus,
        PointerDeviceKind.trackpad
        // etc.
      };
  final List<String> _vFac = [];
  final _controller = TextEditingController();
  var _result = '';
  late bool _isVisi = false;
  int? _indexSelection;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Doan thuat toan :+)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsets.all(16.0)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text(_vFac.toString().replaceAll('[', '').replaceAll(']', '')),
          ),
          Padding(padding: EdgeInsets.all(5.0)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Nhap so ma ban ko thich',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
              controller: _controller,
              textInputAction: TextInputAction.go,
              onSubmitted: (value) {
                _Fac();
                _isVisi = true;
                TextInputAction.go;
                _vFac.clear();
                _Fac();
              },
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          Visibility(
            visible: _isVisi,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ToggleButtons(
                isSelected: _isSelection,
                onPressed: _updateSelection,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text('Tim kiem'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text('Fabonaccy'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text('Giai thua'),
                  )
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          _indexSelection == 1
              ? Text(
                  _result,
                  style: TextStyle(color: Colors.green, fontSize: 20),
                )
              : Text(
                  _result,
                  style: TextStyle(color: Colors.red, fontSize: 20),
                )
        ],
      ),
    ));
  }

  void _updateSelection(int indexSelection) {
    setState(() {
      for (var i = 0; i < _isSelection.length; i++) {
        _isSelection[i] = indexSelection == i;
        _indexSelection = _isSelection.indexWhere((element) => element);
        _checkSelection();
      }
    });
  }

  void _checkSelection() {
    _indexSelection == 1 ? _result = 'Correct' : _result = 'Wrong';
  }

  void _Fac() {
    var _getValue = int.parse(_controller.text);
    List<int> arr = [_getValue];
    for (int temp, i = 0, y = 1;
        y <= _getValue;
        temp = i, i = y, y = i + temp) {
      for (var z = 0; z < arr.length; z++) {
        arr[z] = y;
        setState(() {
          _vFac.add(arr[z].toString());
        });
      }
    }
  }
}
