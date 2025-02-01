class PasswordState {
  final String? errorText;
  final bool isVisible;

  const PasswordState({this.errorText, this.isVisible = false});

  PasswordState copyWith({String? errorText, bool? isVisible}) {
    return PasswordState(
      errorText: errorText ?? this.errorText,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}
