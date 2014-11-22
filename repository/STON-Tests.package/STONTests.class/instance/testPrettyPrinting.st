tests
testPrettyPrinting
  [ 
  | object |
  object := STONTestUser dummy.
  self assert: (STON fromString: (STON toStringPretty: object)) = object.
  object := STONTestDomainObject dummy.
  self assert: (STON fromString: (STON toStringPretty: object)) = object ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'testPrettyPrinting: ' , ex description.
      ex pass ]