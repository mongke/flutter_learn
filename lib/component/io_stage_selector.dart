import 'package:flutter/material.dart';

class IoStageSelector extends StatefulWidget {
  final List<String> stages;

  const IoStageSelector({super.key, required this.stages});

  @override
  State<IoStageSelector> createState() => _IoStageSelectorState();
}

class _IoStageSelectorState extends State<IoStageSelector> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Wrap(
        spacing: 4,
        runSpacing: 4,
        children: List.generate(widget.stages.length, (index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Colors.purple : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: isSelected
                        ? Center(
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                        : null,
                  ),
                  SizedBox(width: 8),
                  Text(
                    widget.stages[index],
                    style: TextStyle(
                      color: isSelected ? Colors.purple : Colors.black,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
