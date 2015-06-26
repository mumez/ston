private
serialize: anObject
  ^ String
    streamContents: [ :stream | 
      self writer
        on: stream;
        nextPut: anObject ]