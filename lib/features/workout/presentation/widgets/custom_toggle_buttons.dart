import 'package:flutter/material.dart';
import 'package:sima/core/barrel.dart';

class CustomToggleButtons extends StatelessWidget {
  const CustomToggleButtons({
    super.key,
    required this.selectedType,
    required this.types,
  });

  final ValueNotifier<List<bool>> selectedType;
  final List<String> types;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(types.length, (index) {
          final isSelected = selectedType.value[index];
          return GestureDetector(
            onTap: () {
              selectedType.value = List.generate(
                selectedType.value.length,
                (buttonIndex) => buttonIndex == index,
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: BoxDecoration(
                color: isSelected ? context.theme.colorScheme.secondary : context.theme.colorScheme.background,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isSelected ? Colors.transparent : context.theme.colorScheme.secondary,
                ),
              ),
              child: Text(
                types[index],
                style: TextStyle(
                  color: isSelected ? context.theme.colorScheme.background : context.theme.colorScheme.secondary,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
