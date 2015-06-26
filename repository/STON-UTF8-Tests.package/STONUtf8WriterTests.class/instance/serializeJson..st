private
serializeJson: anObject
  ^ (super serializeJson: anObject) encodeAsUTF8intoString