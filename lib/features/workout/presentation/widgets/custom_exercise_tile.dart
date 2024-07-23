import 'package:flutter/material.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

class CustomExerciseTile extends StatefulWidget {
  const CustomExerciseTile({
    super.key,
    required this.exercise,
    required this.onExpand,
    this.isExpanded = false,
    this.width = double.infinity,
    this.verticalMargin = 8,
    this.horizontalMargin = 10,
  });

  final ExerciseEntity exercise;
  final bool isExpanded;
  final double width;
  final double verticalMargin;
  final double horizontalMargin;
  final Function() onExpand;

  @override
  State<CustomExerciseTile> createState() => _CustomExerciseTileState();
}

class _CustomExerciseTileState extends State<CustomExerciseTile> {
  late bool _contentVisible;

  @override
  void initState() {
    super.initState();
    _contentVisible = widget.isExpanded;
  }

  void _toggleContentVisibility() {
    setState(() {
      Future.delayed(const Duration(milliseconds: 300), () {
        _contentVisible = !_contentVisible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.verticalMargin, horizontal: widget.horizontalMargin),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: widget.isExpanded ? 200 : 60,
        width: widget.isExpanded ? widget.width : widget.width * 0.8,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    widget.exercise.name,
                    style: context.textTheme.titleMedium?.copyWith(fontSize: 23),
                  ),
                  const Spacer(),
                  if (_contentVisible) _AnimatedExpandedWidgets(widget: widget),
                  AnimatedRotation(
                    turns: widget.isExpanded ? -0.25 : 0.25,
                    duration: const Duration(milliseconds: 300),
                    child: IconButton(
                      iconSize: 27,
                      icon: const Icon(Icons.arrow_back_ios_new_outlined),
                      onPressed: () {
                        widget.isExpanded ? _toggleContentVisibility() : _contentVisible = true;
                        widget.onExpand();
                      },
                    ),
                  ),
                ],
              ),
              if (_contentVisible) ...[
                const SizedBox(height: 5),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedExpandedWidgets extends StatelessWidget {
  const _AnimatedExpandedWidgets({
    required this.widget,
  });

  final CustomExerciseTile widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 48,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: widget.isExpanded ? 60 : 160,
            child: IconButton(
              icon: const Icon(Icons.play_circle_fill),
              iconSize: 27,
              onPressed: () {},
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: widget.isExpanded ? 0 : 160,
            child: IconButton(
              iconSize: 27,
              icon: const Icon(Icons.check_box_outline_blank),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
