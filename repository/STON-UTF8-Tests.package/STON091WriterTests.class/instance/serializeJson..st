private
serializeJson: anObject
  | x y |
  ^ y := (x := super serializeJson: anObject) encodeAsUTF8intoString