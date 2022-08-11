import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/calculations.dart';
import '../providers/history.dart';
import '../core/index.dart';

import '../widgets/answer_text.dart';
import '../widgets/buttons_grid.dart';
import '../widgets/custom_animated_switcher.dart';
import '../widgets/custom_icon.dart';
import '../widgets/custom_switch.dart';
import '../widgets/gradient_divider.dart';
import '../widgets/input_feild.dart';
import '../widgets/last_answer.dart';
import '../widgets/responsive.dart';
import '../widgets/switch_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<Calculations>(context, listen: false);
    final history = Provider.of<History>(context);

    final lGrid = Provider.of<Calculations>(context).lGrid;

    final colorScheme = Theme.of(context).colorScheme;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    if (isLandscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);
    }

    void _onExpand() {
      if (isLandscape) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitDown,
          DeviceOrientation.portraitUp,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape)
              Expanded(
                flex: 7,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CustomSwitch(),
                          SwitchText(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Expanded(flex: 5, child: InputFeild()),
                          Expanded(
                              flex: isLandscape ? 4 : 2,
                              child: const AnswerText()),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            else ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  CustomSwitch(),
                  SwitchText(),
                ],
              ),
              const Expanded(flex: 4, child: InputFeild()),
              const Expanded(flex: 2, child: AnswerText()),
            ],
            if (!isLandscape) const SizedBox(height: 5),
            const GradientDivider(),
            Expanded(
              flex: isLandscape ? 14 : 12,
              child: Container(
                color: colorScheme.gridBg,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  children: [
                    Container(
                      height: 33,
                      margin: EdgeInsets.symmetric(
                          horizontal: 3, vertical: isLandscape ? 0 : 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomIcon(
                            AppIcon.history,
                            onPressed: history.toggleShowHistory,
                            isSelected: history.isShowHistory,
                          ),
                          const SizedBox(width: 10),
                          CustomIcon(
                            AppIcon.expand,
                            onPressed: _onExpand,
                            isSelected: isLandscape,
                          ),
                          const Spacer(),
                          Consumer<Calculations>(
                            builder: (context, calc, child) {
                              return LastAnswer(calc.result,
                                  onPressed: calc.addAns);
                            },
                          ),
                          const SizedBox(width: 15),
                          CustomIcon(AppIcon.delete, onPressed: calc.delete),
                        ],
                      ),
                    ),
                    if (!isLandscape) const SizedBox(height: 5),
                    Expanded(
                      child: Responsive(
                        portrait: Row(
                          children: const [
                            Expanded(
                              flex: 3,
                              child: CustomAnimatedSwitcher(
                                grid: ButtonsGrid(grid: AppConstant.grid),
                              ),
                            ),
                            Expanded(
                              child: ButtonsGrid(grid: AppConstant.opGrid),
                            ),
                          ],
                        ),
                        landscape: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: CustomAnimatedSwitcher(
                                grid: ButtonsGrid(grid: lGrid),
                              ),
                            ),
                            const Expanded(
                              flex: 3,
                              child: ButtonsGrid(grid: AppConstant.grid),
                            ),
                            const Expanded(
                              child: ButtonsGrid(grid: AppConstant.opGrid),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: isLandscape ? 2 : 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
