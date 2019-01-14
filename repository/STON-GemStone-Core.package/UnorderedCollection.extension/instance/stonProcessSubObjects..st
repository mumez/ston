*ston-gemstone-core
stonProcessSubObjects: block

	| elements |

	elements := Array withAll: self.
	self removeAll: self. "Note: passing the receiver as the argument is treated as an optimized case for some implementations of #removeAll:."
	elements do: [ :element |
		self add: (block value: element) ].