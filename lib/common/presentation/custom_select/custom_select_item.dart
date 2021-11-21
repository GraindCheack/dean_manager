class CustomSelectItem<T> {
  CustomSelectItem({
    required this.name,
    required this.object,
    this.selected = false,
  });

  bool selected;
  final String name;
  final T object;
}
