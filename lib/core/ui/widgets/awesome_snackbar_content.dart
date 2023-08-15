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
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        backgroundColor: Colors.transparent,
        forceActionsBelow: true,
        content: AwesomeSnackbarContent(
          title: 'Oh Hey!!',
          message:
              'This is an example error message that will be shown in the body of materialBanner!',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.success,
          // to configure for material banner
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
                snackBarMaterila(context);
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
                awesomeSnackbarError(context);
              },
              child: Text('error'),
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

// class AweseomSnackBarExample extends StatelessWidget {
//   const AweseomSnackBarExample({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ElevatedButton(
//               child: const Text('Show Awesome SnackBar'),
//               onPressed: () {
//                 final snackBar = SnackBar(
//                   /// need to set following properties for best effect of awesome_snackbar_content
//                   elevation: 0,
//                   behavior: SnackBarBehavior.floating,
//                   backgroundColor: Colors.transparent,
//                   content: AwesomeSnackbarContent(
//                     title: 'On Snap!',
//                     message:
//                         'This is an example error message that will be shown in the body of snackbar!',

//                     /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
//                     contentType: ContentType.failure,
//                   ),
//                 );

//                 ScaffoldMessenger.of(context)
//                   ..hideCurrentSnackBar()
//                   ..showSnackBar(snackBar);
//               },
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               child: const Text('Show Awesome Material Banner'),
//               onPressed: () {
                // final materialBanner = MaterialBanner(
                //   /// need to set following properties for best effect of awesome_snackbar_content
                //   elevation: 0,
                //   backgroundColor: Colors.transparent,
                //   forceActionsBelow: true,
                //   content: AwesomeSnackbarContent(
                //     title: 'Oh Hey!!',
                //     message:
                //         'This is an example error message that will be shown in the body of materialBanner!',

                //     /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                //     contentType: ContentType.success,
                //     // to configure for material banner
                //     inMaterialBanner: true,
                //   ),
                //   actions: const [SizedBox.shrink()],
                // );

//                 ScaffoldMessenger.of(context)
//                   ..hideCurrentMaterialBanner()
//                   ..showMaterialBanner(materialBanner);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }