import 'package:app/domain/database/hive_box.dart';
import 'package:app/domain/database/notes_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_base_save_event.dart';
part 'data_base_save_state.dart';

class DataBaseSaveBloc extends Bloc<DataBaseSaveEvent, DataBaseSaveState> {
  DataBaseSaveBloc() : super(DataBaseSaveInitial()) {
    on<DataBaseSavedEvent>((event, emit) async {
     await HiveBox.notes.add(
        NotesData(
          image: event.image,
          cardText: event.cardText,
          itemsText: event.itemsText,
          notes: event.notes,
          selfRatingValue: event.selfRatingValue,
          stressValue: event.stressValue,
        ),
      );

      emit(DataBaseSavedState());
    });
  }
}
