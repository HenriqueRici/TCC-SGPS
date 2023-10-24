class Option<T> {
  final String label;
  final T? value;

  Option(this.label, this.value);
  Option.empty(this.label) : value = null;
}
