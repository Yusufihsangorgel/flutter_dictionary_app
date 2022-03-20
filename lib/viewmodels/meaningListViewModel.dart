import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/services/dictionaryService.dart';
import 'package:flutter_dictionary_app/viewmodels/meaningViewModel.dart';

enum Status { initial, loading, notfound, success }

class MeaningListViewModel extends ChangeNotifier {
  MeaningViewModel meaningViewModel = MeaningViewModel('', []);
  Status status = Status.initial;
  notifyListeners();
  Future<void> getMeanings(String word) async {
    status = Status.loading;
    notifyListeners();
    List<String> meanings = await DictionaryService().searchWord(word);
    notifyListeners();
    meaningViewModel = MeaningViewModel(word, meanings);
    notifyListeners();
    status = meanings.isNotEmpty ? Status.success : Status.notfound;
    notifyListeners();
  }
}
