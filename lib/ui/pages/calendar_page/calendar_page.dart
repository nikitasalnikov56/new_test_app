
import 'package:app/ui/routes/app_routes.dart';
import 'package:app/ui/style/app_colors.dart';
import 'package:app/ui/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  bool _isYearView = false;


  bool _isToday(DateTime day) {
    final today = DateTime.now();
    return day.year == today.year &&
        day.month == today.month &&
        day.day == today.day;
  }



  List<Widget> _buildMonthDays(int year, int month) {
    final firstDayOfMonth = DateTime(year, month, 1);
    final lastDayOfMonth = DateTime(year, month + 1, 0);
    List<Widget> dayWidgets = [];

    // Пустые виджеты для выравнивания первого дня недели
    int dayOffset = firstDayOfMonth.weekday % 7;
    for (int i = 0; i < dayOffset; i++) {
      dayWidgets.add(const SizedBox(
        width: 40,
        height: 40,
      ));
    }

    // Генерация виджетов для дней месяца
    for (int i = 1; i <= lastDayOfMonth.day; i++) {
      final day = DateTime(year, month, i);
      dayWidgets.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedDay = day;
            });
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _selectedDay == day
                  ? AppColors.orange.withOpacity(0.25)
                  : (_isToday(day) && _selectedDay != day)
                      ? AppColors.orange.withOpacity(0.25)
                      : null,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  '$i',
                  style: AppStyle.textStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.calendarColor,
                    fontSize: _isYearView ? 10 : 18,
                  ),
                ),
                if (_isToday(day) && _selectedDay != day)
                  Positioned(
                    bottom: _isYearView ? 2 : 6,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: AppColors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    }

    return dayWidgets;
  }

// Генерация заголовка дней недели
  Widget _buildWeekdayHeader() {
    final weekdays = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        children: weekdays
            .map((day) => Expanded(
                  child: Center(
                    child: Text(day.toUpperCase(),
                        style: AppStyle.textStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ))
            .toList(),
      ),
    );
  }

  String capitalize(String str) => str[0].toUpperCase() + str.substring(1);

  // Генерация одного месяца
  // Widget _buildMonth(int year, int month) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       GestureDetector(
  //         onTap: () {
  //           setState(() {
  //             _isYearView = false;
  //           });
  //         },
  //         child: Text(
  //           capitalize(
  //             DateFormat.MMMM('ru').format(DateTime(year, month)),
  //           ),
  //           style: AppStyle.textStyle
  //               .copyWith(fontSize: 24, color: AppColors.black),
  //         ),
  //       ),
  //       const SizedBox(height: 8),
  //       Wrap(
  //         spacing: 8,
  //         runSpacing: 8,
  //         children: _buildMonthDays(year, month),
  //       ),
  //     ],
  //   );
  // }
  Widget _buildMonth(int year, int month) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isYearView = false;
            });
          },
          child: Text(
            capitalize(
              DateFormat.MMMM('ru').format(DateTime(year, month)),
            ),
            style: AppStyle.textStyle
                .copyWith(fontSize: 24, color: AppColors.black),
          ),
        ),
        const SizedBox(height: 17),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _buildMonthDays(year, month),
        ),
      ],
    );
  }


  Widget _buildYearView(int year) {
    int startMonth = DateTime.now().month; 
    return Column(
      children: [
        for (int i = startMonth; i <= 12; i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isYearView = true;
                    });
                  },
                  child: Text(
                    year.toString(),
                    style: AppStyle.textStyle.copyWith(fontSize: 16),
                  ),
                ),
                _buildMonth(year, i),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildYearGridView() {
    int currentYear = DateTime.now().year;
    List<Widget> monthWidgets = [];

    for (int i = 1; i <= 12; i++) {
      monthWidgets.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _focusedDay = DateTime(currentYear, i, 1);
              _isYearView = false;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                Text(
                  capitalize(
                      DateFormat.MMMM('ru').format(DateTime(currentYear, i))),
                  style: AppStyle.textStyle
                      .copyWith(fontSize: 14, color: AppColors.black),
                ),
                const SizedBox(height: 9),

                SizedBox(
                  height:
                      150, 
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      crossAxisSpacing: 3.0,
                      mainAxisSpacing: 3.0,
                    ),
                    itemCount: _buildMonthDays(currentYear, i).length,
                    itemBuilder: (context, index) {
                      return _buildMonthDays(currentYear, i)[index];
                    },
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), 
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: monthWidgets.length,
      itemBuilder: (context, index) {
        return monthWidgets[index];
      },
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () {
            context.go(AppRoutes.home);
          },
          icon: Icon(
            Icons.close,
            color: AppColors.grey,
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              'Сегодня',
              style: AppStyle.textStyle.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            onPressed: () {
              setState(() {
                _focusedDay = DateTime.now();
                _selectedDay = DateTime.now();
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              !_isYearView ? _buildWeekdayHeader() : const SizedBox(),
              _isYearView
                  ? Text(
                      '${_focusedDay.year}',
                      style: AppStyle.textStyle.copyWith(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: AppColors.black,
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 8,
              ),
              !_isYearView
                  ? _buildYearView(_focusedDay.year)
                  : _buildYearGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
