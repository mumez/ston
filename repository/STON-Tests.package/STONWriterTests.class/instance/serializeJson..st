private
serializeJson: anObject
  ^ String
    streamContents: [ :stream | 
      self jsonWriter
        on: stream;
        nextPut: anObject ]