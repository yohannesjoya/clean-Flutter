import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_clean/src/on_boarding/Presentation/Bloc/on_boarding_bloc.dart';

import '../../../../core/common/widgets/dot_indicator.dart';
import '../Widgets/on_boarding_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  double activeTab = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnBoardingBloc, OnBoardingState>(
        builder: (context, state) {

          if(state is OnBoardingPageState){
            activeTab =  state.pageIndex;
          }
          return Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft, end: Alignment.topRight,
                    colors: [ Color(0xFF292734), Color(0xFF000000)],
                    stops: [-0.0944, 1.0],
                    transform: GradientRotation(170 * (3.1415926535 / 180)),)),
                child: SafeArea(
                    child: Column(
                    children: [
                      Expanded(
                        flex: 85,
                        child: PageView(
                          onPageChanged: (index){
                            double newPage = index.toDouble();
                            BlocProvider.of<OnBoardingBloc>(context).add(OnBoardingPageChangeEvent(pageIndex: newPage));
                            // print(index);
                          },
                          children: const [
                              OnBoardingWidget(index: 0, title: "Welcome", description: "this is welcome",imagePath: "assets/sphere.png",),
                              OnBoardingWidget(index: 1, title: "Find the items You've \n been looking for", description: "Here you'll see rich varieties of goods, carefully classified for seamless browsing experience",imagePath: "assets/manmask.png",),
                              OnBoardingWidget(index: 2, title: "Find the items You've \n been looking for", description: "Here you'll see rich varieties of goods, carefully classified for seamless browsing experience",imagePath: "assets/sphere.png",)
                            ],
                          ),
                      ),
                      Expanded(
                        flex: 15,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [...List.generate(3, (index) => DotIndicator(isActive: (index.toDouble() == activeTab),),),],),
                          )
                      )
                    ],
                  )
                ),
              );
           },
        ),
      );

  }
}









