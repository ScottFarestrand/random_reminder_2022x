import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _show(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
                onPressed: () {}, child: Text('Option #1')),
            CupertinoActionSheetAction(
                onPressed: () {}, child: Text('Option #2')),
            CupertinoActionSheetAction(
                onPressed: () {}, child: Text('Option #3')),
            CupertinoActionSheetAction(
                onPressed: () {}, child: Text('Option #4')),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => _close(ctx),
            child: Text('Close'),
          ),
        ));
  }

  void _close(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
          child: CupertinoButton(
            child: Text('Open Action Sheet'),
            onPressed: () => _show(context),
          ),
        ));
  }
}