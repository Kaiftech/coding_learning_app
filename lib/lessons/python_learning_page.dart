import 'package:flutter/material.dart';

class PythonLearningPage extends StatefulWidget {
  final String tutorialText;
  final String nextButtonText;
  final String nextPageRoute;

  const PythonLearningPage({
    Key? key,
    required this.tutorialText,
    required this.nextButtonText,
    required this.nextPageRoute,
  }) : super(key: key);

  @override
  PythonLearningPageState createState() => PythonLearningPageState();
}

class PythonLearningPageState extends State<PythonLearningPage> {
  bool isHelloWorldDropped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Python'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Python Lesson:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.tutorialText,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            InteractiveElement(
              onDropComplete: () {
                setState(() {
                  isHelloWorldDropped = true;
                });
                // Navigate to the next PythonLearningPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PythonLearningPage(
                      tutorialText: 'Next Python Lesson...',
                      nextButtonText: 'Continue to Next Lesson',
                      nextPageRoute: '/next_python_learning_page',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next PythonLearningPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PythonLearningPage(
                      tutorialText: 'Next Python Lesson...',
                      nextButtonText: 'Continue to Next Lesson',
                      nextPageRoute:
                          '/next_python_learning_page', // Define the route for the next page
                    ),
                  ),
                );
              },
              child: Text(widget.nextButtonText),
            ),
          ],
        ),
      ),
    );
  }
}

class InteractiveElement extends StatefulWidget {
  final VoidCallback onDropComplete;

  const InteractiveElement({Key? key, required this.onDropComplete})
      : super(key: key);

  @override
  InteractiveElementState createState() => InteractiveElementState();
}

class InteractiveElementState extends State<InteractiveElement> {
  bool isHelloWorldDropped = false;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: 'Hello World!',
      feedback: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Hello World!',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      onDragEnd: (details) {
        setState(() {
          isHelloWorldDropped = true;
        });
        widget.onDropComplete();
      },
      child: isHelloWorldDropped
          ? Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Hello World!',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          : Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Drag "Hello World!" here',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
    );
  }
}
