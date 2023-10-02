import 'package:abstracts/feature/testings_api/state/rick_and_morty/rick_and_morty_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestAPi extends StatelessWidget {
  const TestAPi({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RickAndMortyBloc>(context).add(GetRickAndMortyEvent());
    return Scaffold(
      appBar: buildAppBar(context),
      body: BlocBuilder<RickAndMortyBloc, RickAndMortyState>(
        builder: (context, state) {
          if (state is RickAndMortySuccess) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.model.results!.length,
              itemBuilder: (BuildContext contex, int index) {
                return CardWidget(
                  title: state.model.results![index].name ?? '',
                  imageURL: state.model.results![index].image ??
                      'https://play-lh.googleusercontent.com/qbeCduZblOk80GaY164lw47gIRjXq9QIzSmgFwqQj1PyhNhTWxYR0OqPzm8BumnmJQ',
                );
              },
            );
          }
          return Center(child: const CircularProgressIndicator());
        },
      ),
      // GridView.builder(
      //   shrinkWrap: true,
      //   itemCount: 10,
      //   gridDelegate:
      //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      //   itemBuilder: (BuildContext context, int index) {
      //     return CardWidget(
      //       title: 'ss',
      //       imageURL:
      //           'https://play-lh.googleusercontent.com/qbeCduZblOk80GaY164lw47gIRjXq9QIzSmgFwqQj1PyhNhTWxYR0OqPzm8BumnmJQ',
      //     );
      //   },
      // ),
      // Expanded(
      //   child: BlocBuilder<RickAndMortyBloc, RickAndMortyState>(
      //     builder: (context, state) {
      //       if (state is RickAndMortySuccess) {
      //         return GridView.builder(
      // shrinkWrap: true,
      // itemCount: 6,
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2),
      //           itemBuilder: (BuildContext context, int index) {
      //             return CardWidget(
      //               title: state.model.results![index].name ?? '404',
      //               imageURL: state.model.results![index].image ??
      //                   'https://play-lh.googleusercontent.com/qbeCduZblOk80GaY164lw47gIRjXq9QIzSmgFwqQj1PyhNhTWxYR0OqPzm8BumnmJQ',
      //             );
      //           },
      //         );
      //       }
      //       return GridView.builder(
      //         shrinkWrap: true,
      //         itemCount: 6,
      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2),
      //         itemBuilder: (BuildContext context, int index) {
      //           return CardWidget(
      //             title: 'ss',
      //             imageURL:
      //                 'https://play-lh.googleusercontent.com/qbeCduZblOk80GaY164lw47gIRjXq9QIzSmgFwqQj1PyhNhTWxYR0OqPzm8BumnmJQ',
      //           );
      //         },
      //       );
      //     },
      //   ),
      // )
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 1,
      title: Text('TextAPi'),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.title,
    required this.imageURL,
  });
  final String title;
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    // String urlS =
    // 'https://play-lh.googleusercontent.com/qbeCduZblOk80GaY164lw47gIRjXq9QIzSmgFwqQj1PyhNhTWxYR0OqPzm8BumnmJQ';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(color: Colors.purpleAccent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.black),
            ),
            Image.network(
              imageURL,
              // width: 150,
              // height: 50,
            )
          ],
        ),
      ),
    );
  }
}
