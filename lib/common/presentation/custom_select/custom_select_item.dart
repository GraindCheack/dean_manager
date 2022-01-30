class CustomSelectItem<T> {
  CustomSelectItem({
    required this.name,
    required this.object,
    this.selected = false,
  });

  bool selected;
  final String name;
  final T object;

  CustomSelectItem<T> copyWith({bool? selected}) {
    return CustomSelectItem<T>(
      name: name,
      object: object,
      selected: selected ?? false,
    );
  }
}
