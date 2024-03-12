import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:goodbom/app/interactor/models/introduction_model.dart';
import 'package:goodbom/app/interactor/states/introduction_state.dart';
import 'package:goodbom/app/interactor/stores/introduction_store.dart';
import 'package:goodbom/app/shared/constants.dart';
import 'package:goodbom/app/shared/get_it.dart';
import 'package:goodbom/app/shared/theme/colors.dart';
import 'package:goodbom/app/ui/widgets/error_widget.dart';
import 'package:goodbom/app/ui/widgets/loading_widget.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  IntroductionStore store = dependency.get<IntroductionStore>();

  final int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      store.fetchIntroductions();
    });

    _pageController = PageController(
      initialPage: _currentPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: store,
        builder: (context, state, _) {
          if (state is InitialIntroductionState) {
            return const Center(
              child: LogoWidget(),
            );
          }

          if (state is LoadingIntroductionState) {
            return const Center(
              child: LoadingWidget(),
            );
          }

          if (state is ErrorIntroductionState) {
            debugPrint(state.exception.toString());

            return const Center(
              child: LogoWidget(),
            );
          }

          if (state is SuccessIntroductionState) {
            if (state.introductions.isEmpty) {
              return const Center(
                child: LogoWidget(),
              );
            }

            return PageView.builder(
              controller: _pageController,
              itemCount: state.introductions.length,
              itemBuilder: (context, index) {
                final List<IntroductionModel> introductions = state.introductions;
                final IntroductionModel introduction = introductions[index];

                final String collectionId = state.introductions[index].collectionId;
                final String recordId = state.introductions[index].recordId;

                const String endpoint = Constants.appEndpoint;
                final String background = introduction.background;
                final String backgroundEndpoint = '$endpoint/api/files/$collectionId/$recordId/$background';

                return Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: mediaQuery.width,
                        child: CachedNetworkImage(
                          imageUrl: backgroundEndpoint,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              color: GoodColors.secondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: Constants.appPadding * 2, top: Constants.appPadding),
                            child: Text(
                              introduction.title,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          SizedBox(
                            width: mediaQuery.width,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10 * 2),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      introductions.length,
                                      (indexDots) {
                                        return Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: CircleAvatar(
                                            maxRadius: 5,
                                            backgroundColor: index == indexDots
                                                ? GoodColors.primary
                                                : GoodColors.primary.withAlpha(
                                                    50,
                                                  ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: mediaQuery.width,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: store.buttonStyle.primary(),
                                    onPressed: () {
                                      final int newIndex = index + 1;

                                      if (introductions.length == newIndex) {
                                        print('Finalizou');
                                      } else {
                                        _pageController.animateToPage(
                                          _pageController.page!.toInt() + 1,
                                          duration: const Duration(milliseconds: 400),
                                          curve: Curves.easeIn,
                                        );
                                      }
                                    },
                                    child: Text(
                                      introduction.buttonText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
