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
  bool resultCalculated = false;

  bool isOperator(String key) => "+/x-".contains(key);

  void onButtonPressed(String key) {
    if(key == 'mode') {
      debugPrint("Mode changed");
    }

    if(key == "AC") {
      input = '';
      resultCalculated = false;
      output = '';
    }

    if(key == "DEL" && input.isNotEmpty) {
      resultCalculated = false;
      input = input.substring(0, input.length- 1);
      hideInput = false;
    }

    if(key == "SUBMIT") {
      resultCalculated = true;
      try{
        String exp = input.replaceAll('x', '*');
        Parser p = Parser();
        Expression expression = p.parse(exp);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(
            EvaluationType.REAL, cm);
          output = finalValue.toString();
          if(output.endsWith('.0')) {
            output = output.substring(0, output.length - 2);
          }
          if(output.length > 12) {
            output = output.substring(0, 10);
          }
          input = output;
          hideInput = true;
      } on Exception catch (e) {
        debugPrint(e.toString());
          output = 'ERROR!';
      }
    }

    if(isOperator(key)) {
      hideInput = false;
      resultCalculated = false;
      if(input.isNotEmpty && isOperator(input[input.length -1 ])) {
        input = input.substring(0, input.length - 1);
        input = input + key;
      } else {
        if(input.isNotEmpty || key == '-' || key == '+') {
          input = input + key;
        }
      }
      if(input == '/' || input == 'x') {
        input = '';
      }
    }

    if(key == '.') {
      hideInput = false;
      int lastOp = input.lastIndexOf(RegExp(r'[+/x-]'));
      int pos = input.lastIndexOf('.');
      if(pos == -1 || pos < lastOp) {
        input = input + key;
      }
    }

    if("0123456789".contains(key)) {
      hideInput = false;
      if(resultCalculated) {
        resultCalculated = false;
        input = '';
      }
      input = input + key;
    }
    setState(() {});
  }

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
                          onPressed: () => onButtonPressed("mode"),
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () => onButtonPressed('7'),
                          text: '7',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () => onButtonPressed('4'),
                          text: '4',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () => onButtonPressed('1'),
                          text: '1',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () => onButtonPressed("AC"),
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
                          onPressed: () => onButtonPressed("DEL"),
                          icon: const GradientWidget(
                            Text(
                              'DEL',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          // backgroundActive: true,
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () => onButtonPressed('8'),
                          text: '8',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () => onButtonPressed('5'),
                          text: '5',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () => onButtonPressed('2'),
                          text: '2',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () => onButtonPressed('0'),
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
                          onPressed: () => onButtonPressed('/'),
                          text: '÷',
                          backgroundActive: true,
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () => onButtonPressed('9'),
                          text: '9',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () => onButtonPressed('6'),
                          text: '6',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () => onButtonPressed('3'),
                          text: '3',
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () => onButtonPressed('.'),
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
                          onPressed: () => onButtonPressed('x'),
                          text: 'x',
                          backgroundActive: true,
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () => onButtonPressed('-'),
                          text: '−',
                          backgroundActive: true,
                        ).vertPadding(val: 20).asExpanded(),
                        CustomButton(
                          onPressed: () => onButtonPressed('+'),
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
                            onPressed: () => onButtonPressed("SUBMIT"),
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
