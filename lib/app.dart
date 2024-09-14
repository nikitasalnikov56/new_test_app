import 'package:app/domain/blocs/check_items_bloc/check_items_bloc.dart';
import 'package:app/domain/blocs/database_save_bloc/data_base_save_bloc.dart';
import 'package:app/domain/blocs/self_rating/slider_self_rating_bloc.dart';
import 'package:app/domain/blocs/start_bloc/start_app_bloc.dart';
import 'package:app/domain/blocs/slider_bloc/slider_bloc_bloc.dart';
import 'package:app/domain/blocs/ui_interaction_bloc/ui_interaction_bloc.dart';
import 'package:app/ui/routes/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

AppNavigator navigator = AppNavigator();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StartAppBloc()..add(StartAppLoadedEvent()),
        ),
        BlocProvider(
          create: (_) => SliderStressBloc()
            ..add(
              const SliderStressEvent(value: 50),
            ),
        ),
        BlocProvider(
          create: (_) => SliderSelfRatingBloc()
            ..add(
              const SliderSelfRatingLoadEvent(value: 50),
            ),
        ),
        BlocProvider(
          create: (_) => UiInteractionBloc()
            ..add(
              const UiInteractionChangeEvent(
                isEnabled: false,
                selectedIndexes: [],
              ),
            ),
        ),
        BlocProvider(
          create: (_) => CheckItemsBloc()
            ..add(
              const CheckItemsLoadedEvent(selectedIndex: -1),
            ),
        ),
        BlocProvider(create: (_) => DataBaseSaveBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: navigator.router,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ru'),
        ],
      ),
    );
  }
}
