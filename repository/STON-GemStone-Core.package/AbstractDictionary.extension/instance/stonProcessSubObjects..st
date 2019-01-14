*ston-gemstone-core
stonProcessSubObjects: block

	| unprocessedKeys |

	unprocessedKeys := self keys.
	unprocessedKeys do: [ :unprocessedKey |
		| unprocessedValue processedKey processedValue |
		unprocessedValue := self at: unprocessedKey.
		processedKey := block value: unprocessedKey.
		processedValue := block value: unprocessedValue.
		(processedKey == unprocessedKey) ifFalse: [ self removeKey: unprocessedKey ].
		self at: processedKey put: processedValue ].