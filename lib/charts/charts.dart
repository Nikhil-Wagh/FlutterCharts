import 'package:fl_chart/fl_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Charts {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  LineChart lineChart() {
    return LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              textStyle: TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
              getTitles: (value) {
                switch (value.toInt()) {
                  case 2: return 'MAR';
                  case 5: return 'JUN';
                  case 8: return 'SEP';
                }
                return '';
              },
              margin: 8,
            ),
            leftTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              textStyle: TextStyle(color: Color(0xff67727d), fontWeight: FontWeight.bold, fontSize: 15),
              getTitles: (value) {
                switch (value.toInt()) {
                  case 1: return '10k';
                  case 3: return '30k';
                  case 5: return '50k';
                }
                return '';
              },
              margin: 12,
            ),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          minY: 0,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(1, 3),
                FlSpot(2.6, 2),
                FlSpot(4.9, 5),
                FlSpot(6.8, 3.1),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                FlSpot(11, 4),
              ],
              isCurved: true,
              colors: gradientColors,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: true,
              ),
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors.map((color) => color.withOpacity(0.5)).toList(),
              ),
              preventCurveOverShooting: true,
            ),
          ],
        ),
      swapAnimationDuration: const Duration(milliseconds: 500),
    );
  }


  pieChart() {
    List<charts.Series> seriesList = _pieData();
    bool animate = true;

    return new charts.PieChart(
        seriesList,
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(
          arcWidth: 60,
          arcRendererDecorators: [
            new charts.ArcLabelDecorator(
              outsideLabelStyleSpec: new charts.TextStyleSpec(
                fontSize: 12,
                color: charts.MaterialPalette.white,
              )
            )
          ]
        ),
    );
  }

  static List<charts.Series<LinearSales, int>> _pieData() {
    final data = [
      new LinearSales(0, 15),
      new LinearSales(1, 75),
      new LinearSales(2, 25),
      new LinearSales(3, 5),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
      )
    ];
  }



  BarChart barChart() {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
//        maxY: 20,
        barTouchData: BarTouchData(
          enabled: false,
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.transparent,
            tooltipPadding: const EdgeInsets.all(0),
            tooltipBottomMargin: 4,
            getTooltipItem: (
              BarChartGroupData group,
              int groupIndex,
              BarChartRodData rod,
              int rodIndex,
            ) {
              return BarTooltipItem(
                rod.y.round().toString(),
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            textStyle: TextStyle(
                color: const Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
            margin: 20,
            getTitles: (double value) {
              switch (value.toInt()) {
                case 0:
                  return 'J';
                case 1:
                  return 'F';
                case 2:
                  return 'M';
                case 3:
                  return 'A';
                case 4:
                  return 'M';
                case 5:
                  return 'J';
                case 6:
                  return 'J';
                case 7:
                  return 'A';
                case 8:
                  return 'S';
                case 9:
                  return 'O';
                case 10:
                  return 'N';
                case 11:
                  return 'D';
                default:
                  return '';
              }
            },
          ),
          leftTitles: SideTitles(showTitles: false),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [BarChartRodData(y: 8, color: Colors.lightBlueAccent, width: 20, borderRadius: BorderRadius.circular(4)),],
            showingTooltipIndicators: [0],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [BarChartRodData(y: 10, color: Colors.lightBlueAccent, width: 20, borderRadius: BorderRadius.circular(4))],
            showingTooltipIndicators: [0]
          ),
          BarChartGroupData(
            x: 2,
            barRods: [BarChartRodData(y: 14, color: Colors.lightBlueAccent, width: 20, borderRadius: BorderRadius.circular(4))],
            showingTooltipIndicators: [0]
          ),
          BarChartGroupData(
            x: 3,
            barRods: [BarChartRodData(y: 15, color: Colors.lightBlueAccent, width: 20, borderRadius: BorderRadius.circular(4))],
            showingTooltipIndicators: [0]
          ),
          BarChartGroupData(
            x: 4,
            barRods: [BarChartRodData(y: 13, color: Colors.lightBlueAccent, width: 20, borderRadius: BorderRadius.circular(4))],
            showingTooltipIndicators: [0]
          ),
          BarChartGroupData(
            x: 5,
            barRods: [BarChartRodData(y: 10, color: Colors.lightBlueAccent, width: 20, borderRadius: BorderRadius.circular(4))],
            showingTooltipIndicators: [0]
          ),
          BarChartGroupData(
              x: 6,
              barRods: [BarChartRodData(y: 14, color: Colors.lightBlueAccent, width: 20, borderRadius: BorderRadius.circular(4))],
              showingTooltipIndicators: [0]
          ),
          BarChartGroupData(
              x: 7,
              barRods: [BarChartRodData(y: 6, color: Colors.lightBlueAccent, width: 20, borderRadius: BorderRadius.circular(4))],
              showingTooltipIndicators: [0]
          ),
          BarChartGroupData(
              x: 8,
              barRods: [BarChartRodData(y: 10, color: Colors.lightBlueAccent, width: 20, borderRadius: BorderRadius.circular(4))],
              showingTooltipIndicators: [0]
          ),
          BarChartGroupData(
              x: 9,
              barRods: [BarChartRodData(y: 11, color: Colors.lightBlueAccent, width: 20, borderRadius: BorderRadius.circular(4))],
              showingTooltipIndicators: [0]
          ),
          BarChartGroupData(
              x: 10,
              barRods: [BarChartRodData(y: 5, color: Colors.lightBlueAccent, width: 20, borderRadius: BorderRadius.circular(4))],
              showingTooltipIndicators: [0]
          ),
          BarChartGroupData(
              x: 11,
              barRods: [BarChartRodData(y: 4, color: Colors.lightBlueAccent, width: 20, borderRadius: BorderRadius.circular(4))],
              showingTooltipIndicators: [0]
          ),
        ],
      )
    );
  }
}
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
