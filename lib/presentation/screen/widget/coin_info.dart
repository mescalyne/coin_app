import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/data/models/coin.dart';
import 'package:untitled/presentation/resources/datetime.dart';
import 'package:untitled/presentation/resources/theme.dart';
import 'package:untitled/presentation/screen/bloc/bloc.dart';

class CoinInfo extends StatelessWidget {
  const CoinInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: BlocProvider.of<HomeBloc>(context).coinStream,
        builder: (context, AsyncSnapshot<CoinDto> snapshot) {
          String? clockString;
          if (snapshot.hasData && snapshot.data!.time != null) {
            clockString = StringExtension.getOnlyTime(snapshot.data!.time!);
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoData(
                title: 'Coin',
                data: (snapshot.data?.assetIdBase ?? '..') +
                    '/' +
                    (snapshot.data?.assetIdQuote ?? '..'),
              ),
              InfoData(
                title: 'Rate',
                data: snapshot.data?.rate?.toStringAsFixed(0),
              ),
              InfoData(
                title: 'Date',
                data: clockString,
              ),
            ],
          );
        });
  }
}

class InfoData extends StatelessWidget {
  final String title;
  final String? data;

  const InfoData({
    required this.title,
    required this.data,
    Key? key,
  }) : super(key: key);

  static const minWidth = 100.0;
  static const borderRadius = 20.0;
  static const paddings = EdgeInsets.only(top: 15, bottom: 15);
  static const spaceHeight = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: minWidth),
      padding: paddings,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: CoinTheme.lightGrey,
      ),
      child: Column(
        children: [
          Text(title),
          const SizedBox(
            height: spaceHeight,
          ),
          Text(data ?? '...')
        ],
      ),
    );
  }
}
