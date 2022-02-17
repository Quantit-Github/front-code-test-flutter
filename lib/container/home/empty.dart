import 'package:flutter/material.dart';
import 'package:todobooks/color.dart';

class EmptyMain extends StatefulWidget {
  final Future<void> Function() retry;
  final ScrollController scroll;
  const EmptyMain({
    Key? key,
    required this.retry,
    required this.scroll,
  }) : super(key: key);

  @override
  _EmptyMainState createState() => _EmptyMainState();
}

class _EmptyMainState extends State<EmptyMain> {
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  retryAction() async {
    _isLoading.value = true;
    await widget.retry();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.scroll,
      slivers: [
        SliverFillRemaining(
          child: Center(
            child: ValueListenableBuilder<bool>(
              valueListenable: _isLoading,
              builder: (_, loading, __) {
                if (loading) {
                  return SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(
                      color: ColorMap().primary,
                      strokeWidth: 2,
                    ),
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Request Fail",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: ColorMap().black,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: retryAction,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 25,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorMap().primary,
                          ),
                          child: const Text(
                            "Try Again",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
