import 'package:flutter/material.dart';

class CustomFormButton extends StatelessWidget {
  final String label;
  final bool isEnabled;
  final VoidCallback onPressed;

  const CustomFormButton(
      {Key? key,
        required this.label,
        required this.isEnabled,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(140, 86, 73, 1),
      ),
      onPressed: !isEnabled ? null : onPressed,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
            child: Text(label),
          ),
          if (!isEnabled)
            const Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
