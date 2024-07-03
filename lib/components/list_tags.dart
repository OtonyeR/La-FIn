import 'package:flutter/material.dart';

class categoryTab extends StatelessWidget {
  final String iconUrl;
  final String name;
  final VoidCallback catTap;
  final bool isSelected;

  const categoryTab({
    required this.iconUrl,
    required this.name,
    super.key,
    required this.catTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: catTap,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: Color.fromRGBO(245, 245, 245, 1.0),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    width: 1.0,
                    color: isSelected == true
                        ? Color.fromRGBO(36, 36, 36, 1.0)
                        : Colors.transparent),
              ),
              child: Image.asset(iconUrl),
            ),
            SizedBox(
              height: 4,
            ),
            Text(name)
          ],
        ),
      ),
    );
  }
}
