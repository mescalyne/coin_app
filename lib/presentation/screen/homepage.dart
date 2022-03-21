import 'package:flutter/material.dart';
import 'package:untitled/presentation/resources/theme.dart';
import 'package:untitled/presentation/screen/widget/coin_chart.dart';
import 'package:untitled/presentation/screen/widget/coin_info.dart';
import 'package:untitled/presentation/screen/widget/input_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const containerHeight = 50.0;
  static const spaceHeight = 30.0;
  static const borderRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CoinTheme.lightGrey,
        elevation: 0,
        title: const Text(
          'Coins helper',
          style: TextStyle(color: Colors.black45),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(borderRadius),
        child: Column(
          children: [
            InputForm(),
            const SizedBox(
              height: spaceHeight,
            ),
            const CoinInfo(),
            const SizedBox(
              height: spaceHeight,
            ),
            const CoinChart(),
          ],
        ),
      ),
    );
  }
}
