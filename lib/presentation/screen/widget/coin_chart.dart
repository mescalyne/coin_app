import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:untitled/data/models/coin.dart';
import 'package:untitled/presentation/resources/datetime.dart';
import 'package:untitled/presentation/resources/theme.dart';
import 'package:untitled/presentation/screen/bloc/bloc.dart';
import 'package:untitled/presentation/screen/bloc/state.dart';

class CoinChart extends StatelessWidget {
  const CoinChart({Key? key}) : super(key: key);

  static const paddings = EdgeInsets.only(top: 20, left: 5, right: 5);
  static const borderRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state.coinHistory != null && state.coinHistory!.isNotEmpty) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: CoinTheme.lightGrey,
          ),
          padding: paddings,
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: 'Coin history'),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<CoinPointDto, String>>[
                LineSeries<CoinPointDto, String>(
                  dataSource: state.coinHistory!,
                  xValueMapper: (CoinPointDto sales, _) =>
                      StringExtension.getOnlyDate(sales.timeClose!),
                  yValueMapper: (CoinPointDto sales, _) => sales.rateClose,
                  name: 'Price',
                )
              ]),
        );
      } else {
        return Container();
      }
    });
  }
}
