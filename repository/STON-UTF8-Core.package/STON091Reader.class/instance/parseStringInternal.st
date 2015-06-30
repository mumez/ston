parsing-internal
parseStringInternal
  | result delimiter |
  delimiter := readStream next.
  (delimiter = $' or: [ delimiter = $" ])
    ifFalse: [ self error: ''' or " expected' ].
  self encounteredHexCharacter: false.
  result := self
    stringStreamContents: [ :stream | 
      [ readStream atEnd or: [ readStream peek = delimiter ] ]
        whileFalse: [ stream nextPut: self parseCharacter ] ].
  self expectChar: delimiter.
  self encounteredHexCharacter
    ifTrue: [ ^ result decodeFromUTF8 ].
  ^ result