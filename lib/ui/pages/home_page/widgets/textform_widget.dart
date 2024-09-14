import 'package:app/domain/blocs/ui_interaction_bloc/ui_interaction_bloc.dart';
import 'package:app/ui/controllers/app_controllers.dart';
import 'package:app/ui/style/app_colors.dart';
import 'package:app/ui/style/app_style.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    required this.appControllers,
    required this.focusNode,
    required this.newState,
  });

  final AppControllers appControllers;
  final FocusNode? focusNode;
final UiInteractionChangeState newState;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: 90,
        child: TextField(
          focusNode: focusNode,
          enabled: newState.isEnabled,
          controller: appControllers.noteController,
          decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            hintText: 'Введите заметку',
            hintStyle: AppStyle.textStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.all(10),
          ),
          cursorColor: AppColors.black,
          style: AppStyle.textStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          expands: true,
          maxLines: null,
          minLines: null,
          textAlign: TextAlign.left,
          textAlignVertical: TextAlignVertical.top,
        ),
      ),
    );
  }
}
