util
formatItemAt: i from: povItems

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: (povItems at: i) asString;
			space;
			nextPut: $(;
			nextPutAll: selectedClass name asString;
			nextPut: $) ]