import 'package:flutter/material.dart';
import 'package:todobooks/color.dart';

class LoadingTextButton extends StatefulWidget {
  final Future Function()? onPressed;
  final bool? enable;
  final Widget child;
  final double? childHeight;
  final EdgeInsetsGeometry? childPadding;
  final BoxDecoration? childDecoration;

  const LoadingTextButton({
    Key? key,
    this.onPressed,
    this.enable,
    required this.child,
    this.childHeight,
    this.childPadding,
    this.childDecoration,
  }) : super(key: key);

  @override
  _LoadingTextButtonState createState() => _LoadingTextButtonState();
}

class _LoadingTextButtonState extends State<LoadingTextButton> {
  bool _isLoading = false;

  Future<void> _loadFuture() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await widget.onPressed!();
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  bool get _noEnable => !(widget.enable ?? true);
  Color get _backgroundColor =>
      _noEnable ? ColorMap().gray : ColorMap().primary;

  void Function()? _onPressed() {
    if (widget.onPressed == null) {
      return null;
    } else if (_noEnable) {
      return null;
    } else if (_isLoading) {
      return null;
    } else {
      return _loadFuture;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _onPressed(),
      style: TextButton.styleFrom(
        backgroundColor: _isLoading ? ColorMap().primary.withOpacity(0.3) : _backgroundColor,
      ),
      child: Container(
        padding: widget.childPadding,
        decoration: widget.childDecoration,
        height: 42,
        width: 92,
        child: Center(
          child: _isLoading
              ? SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(
                    color: ColorMap().primary,
                    strokeWidth: 1,
                  ),
                )
              : widget.child,
        ),
      ),
    );
  }
}
