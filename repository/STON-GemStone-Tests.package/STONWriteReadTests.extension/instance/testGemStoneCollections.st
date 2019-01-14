*ston-gemstone-tests
testGemStoneCollections

	| collections |

	collections := STON listClass withAll: {
		KeyValueDictionary new
			at: 1 put: 'a';
			at: 2 put: 'b';
			yourself.
		RcIdentityBag new
			add: #foo;
			add: #bar withOccurrences: 2;
			add: #qux withOccurrences: 3 }.
	self serializeAndMaterialize: collections.