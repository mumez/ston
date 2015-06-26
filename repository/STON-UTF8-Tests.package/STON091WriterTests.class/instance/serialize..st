private
serialize: anObject
  ^ (super serialize: anObject) encodeAsUTF8intoString