import 'package:flutter/material.dart';

class CustomProgressDialog extends StatefulWidget {
  final Function? ontap;
  const CustomProgressDialog({Key? key, this.ontap}) : super(key: key);

  @override
  _ProgressDialogState createState() => _ProgressDialogState();
}

class _ProgressDialogState extends State<CustomProgressDialog> {
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: Colors.amber,
    );
  }
}
