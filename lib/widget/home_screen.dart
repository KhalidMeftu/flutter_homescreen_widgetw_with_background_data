import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widgtes_demo/const/utils.dart';
import 'package:flutter_widgtes_demo/controller/get_all_news_bloc.dart';
import 'package:flutter_widgtes_demo/domain/entity/get_all_news.dart';
import 'package:flutter_widgtes_demo/service_locator/service_locator.dart';
import 'package:home_widget/home_widget.dart';
import 'articles.dart';
const String appGroupId = '<YOUR APP GROUP>';
const String iOSWidgetName = 'NewsWidgets';
const String androidWidgetName = 'NewsWidget';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

void updateHeadline(NewsData newHeadline) {
  // Save the headline data to the widget
  HomeWidget.saveWidgetData<String>('headline_title', newHeadline.newsTitle);
  HomeWidget.saveWidgetData<String>(
      'headline_description', newHeadline.newsDetails);
  HomeWidget.updateWidget(
    iOSName: iOSWidgetName,
    androidName: androidWidgetName,
  );
}

class _MyHomePageState extends State<MyHomePage> {
  // New: Add initState
  @override
  void initState() {
    super.initState();
    HomeWidget.setAppGroupId(appGroupId);
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Sample news App'),
            centerTitle: false,
            titleTextStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        body: BlocBuilder<GetAllNewsBloc, GetAllNewsState>(
          builder: (context, state) {
            /// states

            if(state is GettingNews)
            {
              return SizedBox(

                child: loadingSpinner,
              );
            }
            if(state is NewsLoadedSuccessfully)
            {
              /// update widget with intial data
              updateHeadline(state.newsModel.data[0]);
              return ListView.separated(
                separatorBuilder: (context, idx) {
                  return const Divider();
                },
                itemCount: state.newsModel.data.length,
                itemBuilder: (context, idx) {
                  final news= state.newsModel.data;
                  return ListTile(
                    title: Text(news[idx].newsTitle),
                    subtitle: Text(news[idx].newsDetails),
                    onTap: () {

                     Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ArticleScreen(article: news[idx]);
                    },
                  ),
                );
                    },
                  );
                },
              );
            }
            if(state is LoadingError)
            {
              return Center(
                child: Text(state.errorMessage,
                    style:const TextStyle(color: Colors.black,fontSize: 14) ),
              );
            }

            return Container();

          },
        ));
  }

  void getNewsData(BuildContext buildContext) {
    BlocProvider.of<GetAllNewsBloc>(sLocator()).add(GetAllNews());

  }
}


