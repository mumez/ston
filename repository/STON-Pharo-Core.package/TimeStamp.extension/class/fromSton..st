*ston-pharo-core
fromSton: stonReader
	"We use a representation from DateAndTime"
	
	^ (super fromSton: stonReader) asTimeStamp