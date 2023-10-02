import 'package:abstracts/core/ui/_ui.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              S.of(context).text_error_connect,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 100,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
