import 'package:flutter/material.dart';
import 'package:sgps/widgets/side_bar.dart';

import '../widgets/footer.dart';
import '../widgets/header.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Header(),
          Expanded(
            child: Row(
              children: [
                const SideBar(),
                Expanded(child: child),
              ],
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
