import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/services/dictionaryService.dart';
import 'package:flutter_dictionary_app/viewmodels/meaningViewModel.dart';

enum Status { initial, loading, notfound, succes }

class MeaningListViewModel extends ChangeNotifier {
  MeaningViewModel meaningViewModel = MeaningViewModel('', []);
  Status status = Status.initial;
  Future<void> getMeanings(String word) async {
    notifyListeners();
    status = Status.loading;
    List<String> meanings = await DictionaryService().searchWord(word);
    meaningViewModel = MeaningViewModel(word, meanings);
    status = meanings.isNotEmpty ? Status.succes : Status.notfound;
    notifyListeners();
  }
}
