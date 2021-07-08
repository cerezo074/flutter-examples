class ResultModel {
  static const String DefaultText = "No message yet, try later :(";
  static const String SwitchMessage = "Press button to switch text";

  List<String> _messages;
  int _selectedIndex;

  ResultModel(List<String> messages, int selectedMessage)
      : _messages = messages,
        _selectedIndex = selectedMessage;

  String get message {
    if (_messages.length <= 0) {
      return DefaultText;
    }

    return _messages[_selectedIndex % _messages.length];
  }

  void updateMessage() {
    if (_messages.length <= 0) {
      return;
    }

    _selectedIndex++;
  }
}
