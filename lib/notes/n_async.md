
void startIsolate() async {
  ReceivePort receivePort = ReceivePort();
  Isolate isolate = await Isolate.spawn(backgroundTask, receivePort.sendPort);

  receivePort.listen((message) {
    print('Received message from isolate: $message');
  });

  // Send a message to the isolate
  isolate.sendPort.send('Hello from main isolate');
}

void backgroundTask(SendPort sendPort) {
  ReceivePort receivePort = ReceivePort();

  // Listen for messages from the main isolate
  receivePort.listen((message) {
    print('Received message from main isolate: $message');
  });

  // Send a message to the main isolate
  sendPort.send('Hello from background isolate');

  // Close the receive port when done
  receivePort.close();
}