import 'package:flutter/material.dart';


class IconDragHomePage extends StatefulWidget {
  @override
  _IconDragHomePageState createState() => _IconDragHomePageState();
}

class _IconDragHomePageState extends State<IconDragHomePage> {
  List<IconData> icons = [Icons.home, Icons.star, Icons.settings];
  List<IconData?> slots = [null, null, null];
  int? draggingIndex;

  /// Handles updating slot when icon is dragged over it.
  void handleDrag(int index, IconData data) {
    setState(() {
      slots[index] = data;
    });
  }

  /// Builds each slot for the draggable icons.
  Widget buildSlot(int index) {
    return DragTarget<IconData>(
      onAccept: (data) => handleDrag(index, data),
      builder: (context, candidateData, rejectedData) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          width: 100,
          height: 100,
          alignment: Alignment.center,
          child: slots[index] != null
              ? Icon(slots[index], size: 40)
              : const Icon(Icons.add, color: Colors.grey, size: 40),
        );
      },
    );
  }

  Widget buildDraggableIcon(int index) {
    return Draggable<IconData>(
      data: icons[index],
      feedback: Icon(icons[index], size: 40, color: Colors.blue),
      childWhenDragging: Opacity(
        opacity: 0.5,
        child: Icon(icons[index], size: 40),
      ),
      onDragStarted: () => setState(() {
        draggingIndex = index;
      }),
      onDragCompleted: () => setState(() {
        draggingIndex = null;
      }),
      child: Icon(icons[index], size: 40),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Icon Drag & Drop')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(icons.length, buildDraggableIcon),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(slots.length, buildSlot),
            ),
          ],
        ),
      ),
    );
  }
}
