class HistoryItem {
  HistoryItem({required this.operation, required this.result});

  final String operation;
  final String result;

  Map get toMap => {
        'operation': operation,
        'result': result,
      };

  static HistoryItem fromMap(Map historyItemAsMap) => HistoryItem(
      operation: historyItemAsMap['operation'],
      result: historyItemAsMap['result']);

  @override
  String toString() {
    return 'HistoryItem(operation: $operation , result: $result)';
  }
}
