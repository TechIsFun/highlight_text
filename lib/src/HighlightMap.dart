import 'dart:collection';

import '../flutter_text_highlight.dart';

class HighlightMap {
  LinkedHashMap<String, HighlightedWord> _hashMap = LinkedHashMap(
    equals: (a, b) => a.toLowerCase() == b.toLowerCase(),
    hashCode: (a) => a.toLowerCase().hashCode,
  );

  HighlightMap(Map<String, HighlightedWord> myMap) {
    myMap.forEach((k, v) {
      _hashMap[k] = v;
    });
  }

  get getMap => _hashMap;
}
