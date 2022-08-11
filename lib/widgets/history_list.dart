import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/history.dart';
import 'clear_history_button.dart';
import 'empty_history.dart';
import 'history_card.dart';
import '../core/index.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final scrollConroller = ScrollController();

    return FutureBuilder(
      future: Provider.of<History>(context, listen: false).fetchAndSetHistory(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const EmptyHistory();
        } else {
          return Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(
                    bottom: isLandscape ? 2 : 15,
                    top: isLandscape ? 3 : 0,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.topButtonBg,
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(width: 3, color: colorScheme.historyBorder),
                  ),
                  child: Consumer<History>(
                    builder: (context, historyProvider, _) {
                      if (historyProvider.history.isEmpty) {
                        return const EmptyHistory();
                      } else {
                        return Scrollbar(
                          controller: scrollConroller,
                          child: ListView.builder(
                            controller: scrollConroller,
                            shrinkWrap: true,
                            itemCount: historyProvider.history.length,
                            itemBuilder: (BuildContext context, int index) {
                              return HistoryCard(
                                operation:
                                    historyProvider.history[index].operation,
                                result: historyProvider.history[index].result,
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              const ClearHistoryButton(),
            ],
          );
        }
      },
    );
  }
}
