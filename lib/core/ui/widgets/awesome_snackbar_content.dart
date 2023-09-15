import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class AwesomeSnackbarContentWidgets extends StatelessWidget {
  const AwesomeSnackbarContentWidgets({super.key});

  awesomeSnackbarHelp(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      content: AwesomeSnackbarContent(
        title: 'Help',
        message: 'Моиблка временно перестала действовать ',
        contentType: ContentType.help,
      ),
    ));
  }

  awesomeSnackbarSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.fixed,
      content: AwesomeSnackbarContent(
        title: 'Success',
        message: 'Моиблка временно перестала действовать ',
        contentType: ContentType.success,
        // inMaterialBanner: true,
        // color: Colors.purple,
      ),
    ));
  }

  awesomeSnackbarError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      content: AwesomeSnackbarContent(
        title: 'Error',
        message: 'Моиблка временно перестала действовать ',
        contentType: ContentType.failure,
      ),
    ));
  }

  awesomeSnackbarWarning(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      content: AwesomeSnackbarContent(
        title: 'Warrning',
        message: 'Моиблка временно перестала действовать ',
        contentType: ContentType.warning,
      ),
    ));
  }

  snackBarMaterila(BuildContext ctx) {
    ScaffoldMessenger.of(ctx).showMaterialBanner(
      MaterialBanner(
        elevation: 0,
        backgroundColor: Colors.transparent,
        forceActionsBelow: true,
        content: AwesomeSnackbarContent(
          title: 'Oh Hey!!',
          message:
              'This is an example error message that will be shown in the body of materialBanner!',
          contentType: ContentType.success,
          inMaterialBanner: true,
        ),
        actions: const [SizedBox.shrink()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FilledButton(
              onPressed: () {
                awesomeSnackbarSuccess(context);
                // var snackbar = SnackBar(
                //   elevation: 0,
                //   backgroundColor: Colors.transparent,
                //   behavior: SnackBarBehavior.floating,
                //   content: AwesomeSnackbarContent(
                //     title: 'Warrning',
                //     message: 'Моиблка временно перестала действовать ',
                //     contentType: ContentType.warning,
                //   ),
                // );
                // ScaffoldMessenger.of(context).showSnackBar(snackbar);
              },
              child: Text('press'),
            ),
          ),
          Center(
            child: FilledButton(
              onPressed: () {
                awesomeSnackbarWarning(context);
              },
              child: Text('error'),
            ),
          ),
        ],
      ),
    );
  }
}
