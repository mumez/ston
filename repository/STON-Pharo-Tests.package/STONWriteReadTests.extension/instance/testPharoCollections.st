*ston-pharo-tests
testPharoCollections
	| collections |
	collections := STON listClass
		withAll:
			{#[1 2 3].
			(#(1 2 3) asIntegerArray).
			(#(1 2 3) asFloatArray)}.
	self serializeAndMaterialize: collections