parsing-internal
parseCharacterHex
  self
    error:
      'Unexpected character encountered. Utf8 encoded Strings do not use hex character encodings.'