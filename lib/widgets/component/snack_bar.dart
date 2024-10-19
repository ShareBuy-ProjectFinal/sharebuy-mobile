import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_buy/application/theme/app_colors.dart';

enum MessageType {
  success,
  warning,
  error,
}

class MessageToast {
  static showToast(BuildContext context, String message,
      {MessageType type = MessageType.success, int? duration}) {
    FToast fToast = FToast();
    fToast.init(context);

    Future.delayed(Duration.zero, () async {
      fToast.showToast(
        positionedToastBuilder: (context, child) {
          return Positioned(
            // bottom: kBottomNavigationBarHeight + 20,
            width: MediaQuery.of(context).size.width,
            child: child,
          );
        },
        child: SafeArea(
          child: CustomMessage(
            message: message,
            type: type,
            onClose: () {
              fToast.removeCustomToast();
            },
          ),
        ),
        gravity: ToastGravity.TOP,
        toastDuration: Duration(seconds: duration ?? 2),
      );
    });
  }
}

class CustomMessage extends StatefulWidget {
  final String? message;
  final MessageType? type;
  final bool? center;
  final VoidCallback? onClose;
  const CustomMessage(
      {super.key, this.message, this.type, this.center, this.onClose});

  @override
  State<CustomMessage> createState() => _CustomMessage();
}

class _CustomMessage extends State<CustomMessage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.9),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  )
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.message!,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color:
                                              widget.type == MessageType.error
                                                  ? Colors.black
                                                  : AppColors.buttonBlue,
                                          fontSize: 16),
                                      maxLines: 2,
                                      textAlign: widget.center != null &&
                                              widget.center!
                                          ? TextAlign.center
                                          : TextAlign.left,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                ],
                              ),
                            ),
                          ],
                        )
                      ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
