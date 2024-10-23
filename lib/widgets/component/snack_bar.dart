import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/main.dart';

enum MessageType {
  success,
  warning,
  error,
}

class MessageToast {
  static showToast(BuildContext context, String message,
      {MessageType type = MessageType.success,
      int? duration,
      bool blockInteraction = true,
      AlignmentGeometry alignment = Alignment.center}) {
    FToast fToast = FToast();
    fToast.init(context);

    Future.delayed(Duration.zero, () async {
      fToast.showToast(
        positionedToastBuilder: (context, child) {
          return Stack(
            children: [
              if (blockInteraction)
                const ModalBarrier(
                  dismissible: false,
                ),
              Container(
                child: child,
              ),
            ],
          );
        },
        child: SafeArea(
          child: CustomMessage(
            message: message,
            alignment: alignment,
            type: type,
            onClose: () {
              fToast.removeCustomToast();
            },
          ),
        ),
        gravity: ToastGravity.TOP,
        toastDuration: Duration(milliseconds: duration ?? 1500),
      );
    });
  }
}

class CustomMessage extends StatefulWidget {
  final String? message;
  final MessageType? type;
  final bool? center;
  final VoidCallback? onClose;
  final AlignmentGeometry alignment;
  const CustomMessage(
      {super.key,
      this.message,
      this.type,
      this.center,
      this.onClose,
      this.alignment = Alignment.center});

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
    return Align(
      alignment: widget.alignment,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.85),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.announcement,
              size: 30.sp,
              color: AppColors.white,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              widget.message ?? '',
              style: AppTypography.largeWhite,
            ),
          ],
        ),
      ),
    );
  }
}
