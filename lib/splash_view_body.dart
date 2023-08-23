import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/services/news_service.dart';
import 'package:news/features/home/data/repos/home_repo_impl.dart';
import 'package:news/features/home/presentation/manager/cubit/general_news_cubit.dart';
import 'package:news/features/home/presentation/view/home_screen.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingText;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    slidingText = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
        .animate(animationController);

    navigateToHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Welcome'),
          const SizedBox(
            height: 4,
          ),
          AnimatedBuilder(
              animation: slidingText,
              builder: (context, _) {
                return SlideTransition(
                  position: slidingText,
                  child: const Text(
                    'Read Free Books',
                    textAlign: TextAlign.center,
                  ),
                );
              })
        ],
      ),
    );
  }

  void navigateToHomePage() {
    Future.delayed(const Duration(seconds: 2), () {
      // Get.to(() => const HomeView(),
      //     transition: Transition.fade, duration: kTransactionDuration);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) =>
                        GeneralNewsCubit(HomeRepoImpl(NewsService(Dio())))
                          ..fetchGeneralNews(),
                    child: const HomeScreen(),
                  )));
    });
  }
}
