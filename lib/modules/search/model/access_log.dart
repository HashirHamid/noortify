class AccessLog {
  final DateTime time;
  final String actionPerformed;
  final bool isSuccessful;

  AccessLog({
    required this.time,
    required this.actionPerformed,
    required this.isSuccessful,
  });
}
