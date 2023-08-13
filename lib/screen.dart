import 'package:calculator/colors.dart';
import 'package:calculator/custom_button.dart';
import 'package:calculator/extensions.dart';
import 'package:calculator/gradient_widget.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  String input = '';
  String output = '';
  bool hideInput = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 1.6;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: null,
      backgroundColor: Colours.backgroundWhite,
      body: Column(
        children: [
          SizedBox(
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  hideInput ? '' : input,
                  style: const TextStyle(
                      color: Colours.lightText,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ).padding(bottom: 20),
                Text(
                  output,
                  style: TextStyle(
                      fontSize: hideInput ? 52 : 36, fontWeight: FontWeight.w600),
                )
              ],
            ).padding(right: 25, bottom: 20),
          ).asExpanded(),
          Container(
            decoration: const BoxDecoration(
              color: Colours.lightGrey,
            ),
            child: SizedBox(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: height,
                    child: Column(
                      children: [
                        CustomButton(
                          icon: const GradientWidget(
                            Icon(
                              Icons.dark_mode_outlined,
                              size: 36,
                            ),
                          ),
                          onPressed: () {},
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              hideInput = false;
                              input = '${input}7';
                            });
                          },
                          text: '7',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              hideInput = false;
                              input = '${input}4';
                            });
                          },
                          text: '4',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              hideInput = false;
                              input = '${input}1';
                            });
                          },
                          text: '1',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              input = '';
                              output = '';
                            });
                          },
                          icon: const GradientWidget(
                            Text(
                              'AC',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ).vertPadding(val: 20).asExpanded(),
                      ],
                    ),
                  ).asExpanded(),
                  SizedBox(
                    height: height,
                    child: Column(
                      children: [
                        CustomButton(
                          onPressed: () {
                            hideInput = false;
                            if(input.isNotEmpty) {
                              setState(() {
                                input = input.substring(0, input.length- 1);
                              });
                            }
                          },
                          icon: const GradientWidget(
                            Text(
                              'DEL',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          // backgroundActive: true,
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () {
                            hideInput = false;
                            setState(() {
                              input = '${input}8';
                            });
                          },
                          text: '8',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () {
                            hideInput = false;
                            setState(() {
                              input = '${input}5';
                            });
                          },
                          text: '5',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              hideInput = false;
                              input = '${input}2';
                            });
                          },
                          text: '2',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              hideInput = false;
                              input = '${input}0';
                            });
                          },
                          text: '0',
                        ).vertPadding(val: 20).asExpanded(),
                      ],
                    ),
                  ).asExpanded(),
                  SizedBox(
                    height: height,
                    child: Column(
                      children: [
                        CustomButton(
                          onPressed: () {setState(() {
                            hideInput = false;
                            input = '$input/';
                          });},
                          text: '÷',
                          backgroundActive: true,
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              hideInput = false;
                              input = '${input}9';
                            });
                          },
                          text: '9',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              hideInput = false;
                              input = '${input}6';
                            });
                          },
                          text: '6',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              hideInput = false;
                              input = '${input}3';
                            });
                          },
                          text: '3',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              hideInput = false;
                              input = '$input.';
                            });
                          },
                          text: '.',
                        ).vertPadding(val: 20).asExpanded(),
                      ],
                    ),
                  ).asExpanded(),
                  SizedBox(
                    height: height,
                    child: Column(
                      children: [
                        CustomButton(
                          onPressed: () {setState(() {
                            hideInput = false;
                            input = '${input}x';
                          });},
                          text: 'X',
                          backgroundActive: true,
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () {setState(() {
                            hideInput = false;
                            input = '$input-';
                          });},
                          text: '−',
                          backgroundActive: true,
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              hideInput = false;
                              input = '$input+';
                            });
                          },
                          text: '+',
                          backgroundActive: true,
                        ).vertPadding(val: 20).asExpanded(),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colours.gradientPink,
                                    Colours.gradientOrange,
                                  ])),
                          child: CustomButton(
                            onPressed: () {
                              try{
                                String exp = input.replaceAll('x', '*');
                                Parser p = Parser();
                                Expression expression = p.parse(exp);
                                ContextModel cm = ContextModel();
                                var finalValue = expression.evaluate(
                                    EvaluationType.REAL, cm);
                                setState(() {
                                  output = finalValue.toString();
                                  if(output.endsWith('.0')) {
                                    output = output.substring(0, output.length - 2);
                                  }
                                  if(output.length > 12) {
                                    output = output.substring(0, 10);
                                  }
                                  input = output;
                                  hideInput = true;
                                });
                              } on Exception catch (e) {
                                debugPrint(e.toString());
                                setState(() {
                                  output = 'ERROR!';
                                });
                              }
                            },
                            icon: const Text(
                              '=',
                              style: TextStyle(
                                  color: Colours.backgroundWhite,
                                  fontSize: 60,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ).vertPadding(val: 20).asExpanded(flex: 2),
                      ],
                    ),
                  ).asExpanded(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
