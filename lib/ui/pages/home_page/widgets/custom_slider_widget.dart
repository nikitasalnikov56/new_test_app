import 'package:app/domain/blocs/ui_interaction_bloc/ui_interaction_bloc.dart';
import 'package:app/ui/style/app_colors.dart';
import 'package:app/ui/style/app_style.dart';
import 'package:flutter/material.dart';

class CustomSliderWidget extends StatelessWidget {
  const CustomSliderWidget({
    super.key,
    required this.textLeft,
    required this.textRight,
    required this.onChanged,
    required this.stateValue,
    required this.newState,
  });
  final String textLeft;
  final String textRight;
  final double stateValue;
  final Function(double) onChanged;
  final UiInteractionChangeState newState;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return Container(
                  width: 2,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.sliderGrey,
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 6,
                // activeTrackColor: Colors.orange, // Цвет активного трека
                // inactiveTrackColor:
                //     Colors.grey.shade300, // Цвет неактивного трека
                // thumbColor: Colors.orange, // Цвет бегунка
                // overlayColor: Colors.orange
                //     .withOpacity(0.2), // Цвет окружности вокруг бегунка
                // thumbShape: const RoundSliderThumbShape(
                //     enabledThumbRadius: 10), // Размер бегунка
                // trackHeight: 6.0, // Высота трека
                // tickMarkShape:
                //     const RoundSliderTickMarkShape(tickMarkRadius: 5), // Метки
                // activeTickMarkColor: Colors.white, // Цвет активных меток
                // inactiveTickMarkColor:
                //     Colors.grey.shade400, // Цвет неактивных меток
                // valueIndicatorColor: Colors.orange, // Цвет всплывающей метки
              ),
              child: Slider(
                value: stateValue,
                onChanged: newState.isEnabled
                    ? (newValue) {
                        onChanged(newValue);
                      }
                    : null,
                min: 0.0,
                max: 100.0,
                activeColor: AppColors.orange,
                inactiveColor: AppColors.sliderGrey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textLeft,
                  style: AppStyle.textStyle.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.sliderTextGrey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    textRight,
                    style: AppStyle.textStyle.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: AppColors.sliderTextGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
