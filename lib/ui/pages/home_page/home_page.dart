import 'package:app/domain/blocs/start_bloc/start_app_bloc.dart';
import 'package:app/ui/pages/home_page/widgets/home_screen.dart';
import 'package:app/ui/pages/home_page/widgets/statistic_screen.dart';
import 'package:app/ui/resources/app_icons.dart';
import 'package:app/ui/routes/app_routes.dart';
import 'package:app/ui/style/app_colors.dart';
import 'package:app/ui/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartAppBloc, StartAppState>(
      builder: (context, state) {
        if (state is StartAppInitial) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Shimmer(
                gradient: LinearGradient(
                  colors: [AppColors.backgroundGrey, AppColors.grey],
                ),
                child: Text(
                  '',
                  style: AppStyle.textStyle,
                ),
              ),
              actions: [
                SvgPicture.asset(AppIcons.calendar),
              ],
            ),
          );
        }
        if (state is StartAppLoaded) {
          return ScaffoldHomeDataWidget(
            state: state,
          );
        }
        return const SizedBox();
      },
    );
  }
}

class ScaffoldHomeDataWidget extends StatefulWidget {
  const ScaffoldHomeDataWidget({
    super.key,
    required this.state,
  });
  final StartAppLoaded state;

  @override
  State<ScaffoldHomeDataWidget> createState() => _ScaffoldHomeDataWidgetState();
}

class _ScaffoldHomeDataWidgetState extends State<ScaffoldHomeDataWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Освобождение ресурсов контроллера
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${widget.state.time}',
          style: AppStyle.textStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                context.go(AppRoutes.calendar);
              },
              child: SvgPicture.asset(
                AppIcons.calendar,
                // color: Colors.red,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size(288, 68.0),
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: AppColors.backgroundGrey,
              borderRadius: BorderRadius.circular(47),
            ),
            child: TabBar(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(47.0),
              ),
              labelColor: AppColors.white,
              unselectedLabelColor: AppColors.grey,
              dividerColor: Colors.transparent,
              dividerHeight: 0,
              tabs: [
                Tab(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        AppIcons.note,
                        color: _tabController.index == 0
                            ? AppColors.white
                            : Colors.grey,
                      ),

                      const SizedBox(
                          width: 6), // Отступ между иконкой и текстом
                      const FittedBox(
                        child: Text(
                          "Дневник настроения",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppIcons.staticIcon,
                        color: _tabController.index == 1
                            ? AppColors.white
                            : AppColors.grey,
                      ),
                      const SizedBox(
                          width: 6), // Отступ между иконкой и текстом
                      const Text(
                        "Статистика",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          HomeScreen(),
          StatisticScreen(),
        ],
      ),
    );
  }
}
