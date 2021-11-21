import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    Key? key,
    required this.child,
    this.width,
    this.items = const [],
  }) : super(key: key);

  final double? width;
  final Widget child;
  final List<Widget> items;

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final FocusNode _focusNode = FocusNode();
  late OverlayEntry _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
        final overlay = Overlay.of(context);
        if (overlay != null) {
          overlay.insert(_overlayEntry);
        }
      } else {
        _overlayEntry.remove();
      }
    });
    super.initState();
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: widget.width ?? size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height),
          child: Material(
            elevation: 4.0,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: <Widget>[...widget.items],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: () => _focusNode.hasFocus
            ? _focusNode.unfocus()
            : _focusNode.requestFocus(),
        child: Focus(
          child: widget.child,
          focusNode: _focusNode,
        ),
      ),
    );
  }
}
