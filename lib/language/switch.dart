void main() {
  String status = 'open';

  print(translateStatus(status));
}

String translateStatus(String status) {
  switch (status) {
    case 'close':
      return "Close";

    case 'waiting-for-review':
      return "Wainting for review";

    default:
      return 'open';
  }
}
