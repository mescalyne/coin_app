import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/presentation/resources/theme.dart';
import 'package:untitled/presentation/screen/bloc/bloc.dart';
import 'package:untitled/presentation/screen/bloc/event.dart';

class InputForm extends StatelessWidget {
  InputForm({Key? key}) : super(key: key);
  final _coinController = TextEditingController();

  static const paddings = EdgeInsets.only(top: 12, bottom: 12, left: 20);
  static const containerHeight = 50.0;
  static const borderRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 12,
          child: Container(
            padding: paddings,
            height: containerHeight,
            decoration: BoxDecoration(
              color: CoinTheme.lightBrown,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: TextField(
              controller: _coinController,
              cursorColor: CoinTheme.lightBrown,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 6,
          child: InkWell(
            onTap: () => BlocProvider.of<HomeBloc>(context)
                .add(SetCoinEvent(coin: _coinController.text)),
            child: Container(
              alignment: Alignment.center,
              height: containerHeight,
              decoration: BoxDecoration(
                color: CoinTheme.middleBrown,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: const Text(
                'Subscribe',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
