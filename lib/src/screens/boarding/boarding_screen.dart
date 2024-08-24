import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../shared/routes.dart';

class BoardingScreen extends ConsumerStatefulWidget {
  const BoardingScreen({super.key});

  @override
  ConsumerState<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends ConsumerState<BoardingScreen> {
  final _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    ref.listen(tokenProvider, (_, token) {
      if (token.requireValue != null) {
        context.go("/");
        return;
      }
    });
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          currentIndex != 2
              ? Expanded(
                  child: Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () => context.go("/intro"),
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
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: PageView(
                controller: _pageController,
                onPageChanged: (v) {
                  setState(() {
                    currentIndex = v;
                  });
                },
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(
                        "assets/img/Home.png",
                        scale: 0.8,
                      ),
                      Container(
                        color: Colors.white,
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const LinearProgressIndicator(
                                value: 0.3,
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              const Text(
                                "مرحبا بك في الدلتا لتكنولوجيا المصاعد و التجارة",
                                style: TextStyle(fontSize: 24),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                "تطبيقنا يوفر أفضل خدمات صيانة و تركيب المصاعد بأعلى معايير الجودة والأمان و بكفاءة دائمة.",
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.grayColor),
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
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInOutExpo);
                                      },
                                      child: const Text("التالي"))),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(
                        "assets/img/repair.png",
                        scale: 0.8,
                      ),
                      Container(
                        color: Colors.white,
                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                              const LinearProgressIndicator(
                                value: 0.6,
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              const Text(
                                "استمتع بميزات رائعة مثل الصيانة الممتازة وطلب مصعدك بسهولة",
                                style: TextStyle(fontSize: 24),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                "يمكنك الان طلب مصعد بتشكيلات و اشكال مختلفه و الحصور ايضا علي الصيانه بشكل سريع و فوري ",
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.grayColor),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ConstrainedBox(
                                        constraints: const BoxConstraints(
                                            minWidth: double.infinity,
                                            minHeight: 54),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              _pageController.nextPage(
                                                  duration: const Duration(
                                                      milliseconds: 300),
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
                                            minWidth: double.infinity,
                                            minHeight: 54),
                                        child: OutlinedButton(
                                            onPressed: () {
                                              _pageController.previousPage(
                                                  duration: const Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.easeInOutExpo);
                                            },
                                            child: const Text("السابق"))),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(
                        "assets/img/order.png",
                        scale: 0.8,
                      ),
                      Container(
                        color: Colors.white,
                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                              LinearProgressIndicator(
                                value: 1,
                                valueColor: AlwaysStoppedAnimation(
                                    AppColors.buttonColor),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              const Text(
                                "تابع خطوات تركيب مصعدك بسلاسة ودقة يوميًا معنا",
                                style: TextStyle(fontSize: 24),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                "استمتع بتركيب مصعدك بسلاسة مع دلتا لتكنولوجيا المصاعد والتجارة، نقدم لك خطوات يومية دقيقة لضمان التركيب المثالي",
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.grayColor),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              ConstrainedBox(
                                  constraints: const BoxConstraints(
                                      minWidth: double.infinity, minHeight: 54),
                                  child: ElevatedButton(
                                      onPressed: () => context.go("/intro"),
                                      child: const Text("ابدا الان"))),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ),
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
