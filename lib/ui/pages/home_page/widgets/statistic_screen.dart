import 'package:app/domain/database/hive_box.dart';
import 'package:app/domain/database/notes_data.dart';
import 'package:app/ui/style/app_colors.dart';
import 'package:app/ui/style/app_style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveBox.notes.listenable(),
      builder: (context, Box<NotesData> notes, _) {
        final allNotes = notes.values.toList();
        return ListView.separated(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          itemBuilder: (context, i) {
            final data = allNotes[i];
            return Stack(
              children: [
                Card.filled(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Center(
                        //   child: SizedBox(
                        //       height: 50,
                        //       width: 100,
                        //       child: ListView.builder(
                        //         scrollDirection: Axis.horizontal,
                        //         itemBuilder: (context, k) {
                        //           return Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.center,
                        //             children: [
                        //               Image.asset('${allNotes[i].image?[k]}'),
                        //             ],
                        //           );
                        //         },
                        //         itemCount: allNotes[i].image?.length ?? 0,
                        //       )),
                        // ),
                        Center(
                          child: SizedBox(
                            height: 50,
                            child: SingleChildScrollView(
                              scrollDirection:
                                  Axis.horizontal, 
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: List.generate(
                                  allNotes[i].image?.length ?? 0,
                                  (k) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal:
                                            4.0), // Отступ между картинками
                                    child:
                                        Image.asset('${allNotes[i].image?[k]}'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text('${data.cardText}'),
                        const SizedBox(height: 5),
                        Text('${data.itemsText}'),
                        const SizedBox(height: 5),
                        Text('${data.notes}'),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 180,
                          width: 250,
                          child: BarChart(
                            BarChartData(
                              barGroups: [
                                BarChartGroupData(
                                  x: data.stressValue?.toInt() ??
                                      0, // Позиция на оси X
                                  barRods: [
                                    BarChartRodData(
                                      toY: data.stressValue ??
                                          0, // Высота столбца
                                      color: AppColors.black,
                                      width: 16,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ],
                                ),
                                BarChartGroupData(
                                  x: data.selfRatingValue?.toInt() ?? 0,
                                  barRods: [
                                    BarChartRodData(
                                      toY: data.selfRatingValue ?? 0,
                                      color: AppColors.orange,
                                      width: 16,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ],
                                ),
                              ], // Данные для столбцов
                              titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget:
                                        (double value, TitleMeta meta) {
                                      const style = TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      );

                                      if (value == data.stressValue) {
                                        return const Text('',
                                            textAlign: TextAlign.center,
                                            style: style);
                                      } else if (value ==
                                          data.selfRatingValue) {
                                        return const Text('',
                                            textAlign: TextAlign.center,
                                            style: style);
                                      }
                                      return const SizedBox();
                                    },
                                  ),
                                ),
                                leftTitles: const AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                    interval:
                                        10, // Интервал между значениями на оси Y
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              gridData: const FlGridData(show: true),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45, right: 80),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Стресс',
                                style: AppStyle.textStyle.copyWith(
                                    fontSize: 12, color: AppColors.black),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Text(
                                'Самооценка',
                                style: AppStyle.textStyle.copyWith(
                                    fontSize: 12, color: AppColors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 15,
                  child: IconButton(
                    onPressed: () async {
                      await HiveBox.notes.deleteAt(i);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemCount: allNotes.length,
        );
      },
    );
  }
}
