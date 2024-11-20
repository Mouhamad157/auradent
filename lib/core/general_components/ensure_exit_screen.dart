import 'package:flutter/material.dart';
import 'app_exit_dialog.dart';

class EnsureExitApp extends StatelessWidget {
  const EnsureExitApp({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppExitDialog.ensureExit,
      child: child,
    );
  }
}
