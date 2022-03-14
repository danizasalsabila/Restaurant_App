import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget body;

  CustomAppBar({required this.body});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            body,
            Card(
              margin: const EdgeInsets.all(0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
