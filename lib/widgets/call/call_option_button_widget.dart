import 'package:answer24/utilities/utilities.dart';
import 'package:flutter/material.dart';

class CallOptionButtonWidget extends StatelessWidget {
  const CallOptionButtonWidget({
    required this.icon,
    required this.onTap,
    required this.isSelected,
    super.key,
  });
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: Utilities.solidGreyColor,
      child: Icon(
        icon,
        size: 32,
        color: isSelected ? Colors.white : Colors.grey,
      ),
    );
  }
}
