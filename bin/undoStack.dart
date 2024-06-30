class UndoStack {
  final List<Function> _stack = [];

  void action(Function action) {
    _stack.add(action);
  }

  void undo() {
    if (_stack.isNotEmpty) {
      _stack.removeLast();
    }
  }
}