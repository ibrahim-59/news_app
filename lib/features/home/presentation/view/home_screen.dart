import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/home/presentation/manager/cubit/general_news_cubit.dart';
import 'package:news/features/home/presentation/view/widgets/top_news_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 10), () {
      return Center(
        child: CircularProgressIndicator(),
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EG News',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      // bottomNavigationBar: const BottomNavBar(index: 1),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BlocBuilder<GeneralNewsCubit, GeneralNewsState>(
              builder: (context, state) {
                if (state is GeneralNewsSuccess) {
                  if (state.news.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return TopNewsListView(news: state.news);
                  }
                } else if (state is GeneralNewsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GeneralNewsFailure) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                }
                return const Center(
                  child: Text('SomeThing Went Wrong'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
