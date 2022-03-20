import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/viewmodels/meaningViewModel.dart';
import 'package:flutter_dictionary_app/widgets/signLanguage.dart';

class MeanList extends StatelessWidget {
  final MeaningViewModel meaningViewModel;
  final SignLanguage signLanguage;
  const MeanList(
      {Key? key, required this.meaningViewModel, required this.signLanguage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          meaningViewModel.word,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListView.builder(
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: meaningViewModel.meanings.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 50,
                    child: Text(
                      '${index + 1}. ${meaningViewModel.meanings[index]}',
                      style: const TextStyle(fontSize: 20),
                    )),
              );
            }),
        signLanguage
      ],
    );
  }
}
