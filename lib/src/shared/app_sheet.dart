import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


Future<dynamic> appBottomSheet(BuildContext context,
    {required String header,
    required String endHeader,
    bool isWarning = false,
    bool isDanger = false,
    required TextSpan coloredText,
    required List<Widget> actionButtons,
    required String subHeader}) {
  return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => Wrap(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        header,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 24,
                      ),
                      if (isWarning)
                        SvgPicture.asset('assets/img/icons/warning.svg'),
                      if (isDanger)
                        SvgPicture.asset('assets/img/icons/danger.svg'),
                      if (isWarning == false && isDanger == false)
                        SvgPicture.asset('assets/img/icons/success.svg'),
                      const SizedBox(
                        height: 24,
                      ),
                      Text.rich(
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                          TextSpan(children: [
                            TextSpan(
                              text: subHeader,
                            ),
                            const WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: SizedBox(width: 4)),
                            coloredText,
                          ])),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        endHeader,
                        textAlign: TextAlign.center,
                      ),
                      // const Spacer(),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: actionButtons),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ));
}
