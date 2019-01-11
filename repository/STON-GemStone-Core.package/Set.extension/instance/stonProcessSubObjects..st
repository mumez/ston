*STON-GemStone-Core
stonProcessSubObjects: block

	| elements |

	elements := Array withAll: self.
	self removeAll: self. "Note: Set>>removeAll: treats passing the Set itself as a special, optimized case."
	elements do: [ :element |
		self add: (block value: element) ].