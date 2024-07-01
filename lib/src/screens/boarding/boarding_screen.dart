import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          currentIndex != 2
              ? Expanded(
                  child: Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () => context.go("/signin"),
                          child: Text(
                            "تخطي",
                            style: TextStyle(
                                color: AppColors.grayColor,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.grayColor),
                          ))),
                )
              : const SizedBox.shrink()
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: PageView(
                controller: _pageController,
                reverse: true,
                onPageChanged: (v) {
                  setState(() {
                    currentIndex = v;
                  });
                },
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Directionality(
                          textDirection: TextDirection.ltr,
                          child: LinearProgressIndicator(
                            value: 0.3,
                          )),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "هذه النص هو مثال لنص يمكن ان يستبدل في اي وقت",
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "هذه النص هو مثال لنص يمكن ان يستبدل في نفس المساحه او اكبر في اي وقت ",
                        style:
                            TextStyle(fontSize: 14, color: AppColors.grayColor),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      ConstrainedBox(
                          constraints: const BoxConstraints(
                              minWidth: double.infinity, minHeight: 54),
                          child: ElevatedButton(
                              onPressed: () {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOutExpo);
                              },
                              child: const Text("التالي"))),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Directionality(
                          textDirection: TextDirection.ltr,
                          child: LinearProgressIndicator(
                            value: 0.6,
                          )),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "هذه النص هو مثال لنص يمكن ان يستبدل في اي وقت",
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "هذه النص هو مثال لنص يمكن ان يستبدل في نفس المساحه او اكبر في اي وقت ",
                        style:
                            TextStyle(fontSize: 14, color: AppColors.grayColor),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minWidth: double.infinity, minHeight: 54),
                                child: ElevatedButton(
                                    onPressed: () {
                                      _pageController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeInOutExpo);
                                    },
                                    child: const Text("التالي"))),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minWidth: double.infinity, minHeight: 54),
                                child: OutlinedButton(
                                    onPressed: () {
                                      _pageController.previousPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeInOutExpo);
                                    },
                                    child: const Text("السابق"))),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Directionality(
                          textDirection: TextDirection.ltr,
                          child: LinearProgressIndicator(
                            value: 1,
                            valueColor:
                                AlwaysStoppedAnimation(AppColors.buttonColor),
                          )),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "هذه النص هو مثال لنص يمكن ان يستبدل في اي وقت",
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "هذه النص هو مثال لنص يمكن ان يستبدل في نفس المساحه او اكبر في اي وقت ",
                        style:
                            TextStyle(fontSize: 14, color: AppColors.grayColor),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      ConstrainedBox(
                          constraints: const BoxConstraints(
                              minWidth: double.infinity, minHeight: 54),
                          child: ElevatedButton(
                              onPressed: () => context.go("/signin"),
                              child: const Text("ابدا الان"))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
