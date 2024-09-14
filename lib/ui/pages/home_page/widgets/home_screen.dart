import 'package:app/domain/blocs/check_items_bloc/check_items_bloc.dart';
import 'package:app/domain/blocs/database_save_bloc/data_base_save_bloc.dart';
import 'package:app/domain/blocs/self_rating/slider_self_rating_bloc.dart';
import 'package:app/domain/blocs/slider_bloc/slider_bloc_bloc.dart';
import 'package:app/domain/blocs/ui_interaction_bloc/ui_interaction_bloc.dart';
import 'package:app/ui/controllers/app_controllers.dart';
import 'package:app/ui/controllers/textform_focus.dart';
import 'package:app/ui/pages/home_page/widgets/custom_slider_widget.dart';
import 'package:app/ui/pages/home_page/widgets/textform_widget.dart';
import 'package:app/ui/pages/home_page/widgets/title_widget.dart';
import 'package:app/ui/resources/app_images.dart';
import 'package:app/ui/resources/card_list_titles.dart';
import 'package:app/ui/resources/list_items.dart';
import 'package:app/ui/style/app_colors.dart';
import 'package:app/ui/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UiInteractionBloc, UiInteractionState>(
      builder: (context, newState) {
        final appImages = AppImages();
        final appControllers = AppControllers();
        final focusNode = TextformFocus();
        List<String> images = appImages.getAllImages();
        double stressValue = 0;
        double selfRating = 0;
        int itemsIndex = 0;
        if (newState is UiInteractionChangeState) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: TitleWidget(
                    text: 'Что чувствуешь?',
                  ),
                ),
                SizedBox(
                  height: 180,
                  child: ListView.separated(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      // final isSelected = newState.selectedIndexes.contains(i);
                      return GestureDetector(
                        onTap: () {
                          // final newSelectedIndexes =
                          //     Set<int>.from(newState.selectedIndexes);
                          // if (isSelected) {
                          //   newSelectedIndexes.remove(i);
                          // } else {
                          //   newSelectedIndexes.add(i);
                          // }
                          // context.read<UiInteractionBloc>().add(
                          //     UiInteractionChangeEvent(
                          //         isEnabled: true,
                          //         selectedIndexes: newSelectedIndexes));
                          final currentState =
                              context.read<UiInteractionBloc>().state;
                          final selectedIndexes = List<int>.from(
                              (currentState as UiInteractionChangeState)
                                  .selectedIndexes);

                          if (selectedIndexes.contains(i)) {
                            selectedIndexes.remove(i);
                          } else {
                            selectedIndexes.add(i);
                          }

                          context.read<UiInteractionBloc>().add(
                              UiInteractionChangeEvent(
                                  isEnabled: true,
                                  selectedIndexes: selectedIndexes));
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 23,
                            bottom: 30,
                            left: 8,
                            right: 8,
                          ),
                          width: 90,
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(76),
                            border: Border.all(
                              color: newState.selectedIndexes.contains(i)
                                  ? AppColors.orange
                                  : Colors.transparent,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadowColor,
                                blurRadius: 10.8,
                                spreadRadius: 0,
                                offset: const Offset(2, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                images[i],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                CardListTitles.titles[i],
                                style: AppStyle.textStyle.copyWith(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: images.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                  ),
                ),
                newState.isEnabled
                    ? BlocBuilder<CheckItemsBloc, CheckItemsState>(
                        builder: (context, itemState) {
                          if (itemState is CheckItemsLoadedState) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        for (int i = 0;
                                            i < ListItems.items.length;
                                            i++) ...[
                                          InkWell(
                                            onTap: () {
                                              itemsIndex = i;

                                              context
                                                  .read<CheckItemsBloc>()
                                                  .add(CheckItemsLoadedEvent(
                                                      selectedIndex: i));
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 3),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color:
                                                    itemState.selectedIndex == i
                                                        ? AppColors.orange
                                                        : AppColors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.shadowColor
                                                        .withOpacity(0.11),
                                                    blurRadius: 10,
                                                    offset: const Offset(2, 4),
                                                  ),
                                                ],
                                              ),
                                              child: Text(
                                                ListItems.items[i],
                                                style:
                                                    AppStyle.textStyle.copyWith(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      itemState.selectedIndex ==
                                                              i
                                                          ? AppColors.white
                                                          : AppColors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  )
                                ],
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      )
                    : const SizedBox.shrink(),

                // const SizedBox(height: 36),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: TitleWidget(
                    text: 'Уровень стресса',
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<SliderStressBloc, SliderBlocState>(
                  builder: (context, state) {
                    if (state is SliderBlocStressState) {
                      return CustomSliderWidget(
                        textLeft: 'Низкий',
                        textRight: 'Высокий',
                        stateValue: state.value,
                        newState: newState,
                        onChanged: (val) {
                          stressValue = val;
                          context
                              .read<SliderStressBloc>()
                              .add(SliderStressEvent(value: val));
                        },
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: TitleWidget(
                    text: 'Самооценка',
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<SliderSelfRatingBloc, SliderSelfRatingState>(
                  builder: (context, state) {
                    if (state is SliderSelfRaitingLoadState) {
                      return CustomSliderWidget(
                        textLeft: 'Неуверенность',
                        textRight: 'Уверенность',
                        stateValue: state.value,
                        newState: newState,
                        onChanged: (val) {
                          selfRating = val;

                          context
                              .read<SliderSelfRatingBloc>()
                              .add(SliderSelfRatingLoadEvent(value: val));
                        },
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: TitleWidget(
                    text: 'Заметки',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormWidget(
                  appControllers: appControllers,
                  newState: newState,
                  focusNode: focusNode.focusNode,
                ),
                const SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: newState.isEnabled
                        ? () {
                            // context.read<DataBaseSaveBloc>().add(
                            //       DataBaseSavedEvent(
                            //         image: images[newState.selectedIndex],
                            //         cardText: CardListTitles
                            //             .titles[newState.selectedIndex],
                            //         itemsText: ListItems.items[itemsIndex],
                            //         notes: appControllers.noteController.text,
                            //         selfRatingValue: selfRating,
                            //         stressValue: stressValue,
                            //       ),
                            //     );
                            final currentState =
                                context.read<UiInteractionBloc>().state;
                            final selectedIndexes =
                                (currentState as UiInteractionChangeState)
                                    .selectedIndexes;

                            final selectedImages = [
                              for (var index in selectedIndexes) images[index]
                            ];
                            final selectedTitles = [
                              for (var index in selectedIndexes)
                                CardListTitles.titles[index]
                            ];

                            // for (var i = 0; i < selectedIndexes.length; i++) {
                              context.read<DataBaseSaveBloc>().add(
                                    DataBaseSavedEvent(
                                      image: selectedImages,
                                      cardText: selectedTitles.join(', '),
                                      itemsText: ListItems.items[itemsIndex],
                                      notes: appControllers.noteController.text,
                                      selfRatingValue: selfRating,
                                      stressValue: stressValue,
                                    ),
                                  );
                            // }
                            focusNode.focusNode.unfocus();
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return BottomSheet(
                                      onClosing: () {},
                                      builder: (context) {
                                        return Text('Данные успешно добавлены');
                                      });
                                });
                          }
                        : null,
                    child: Text(
                      'Сохранить',
                      style: AppStyle.textStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
