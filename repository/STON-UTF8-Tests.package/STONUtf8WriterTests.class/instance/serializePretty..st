private
serializePretty: anObject
  ^ (super serializePretty: anObject) encodeAsUTF8intoString