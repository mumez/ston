*ston-utf8-core
put: object onStreamUtf8Encoded: stream
  | unencodedStream |
  unencodedStream := WriteStream on: String new.
  (self writer on: unencodedStream) nextPut: object.
  stream nextPutAll: unencodedStream contents encodeAsUTF8intoString