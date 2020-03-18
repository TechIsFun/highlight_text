library flutter_text_highlight;

import 'package:flutter/services.dart';

export 'src/HighlightedWord.dart';
export 'src/TextHighlight.dart';
export 'src/HighlightMap.dart';

class HighlightText {
  static const MethodChannel _channel =
      const MethodChannel('flutter_text_highlight');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
