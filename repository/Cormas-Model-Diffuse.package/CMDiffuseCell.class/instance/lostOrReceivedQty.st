accessing
lostOrReceivedQty
	"Getter accessor with default value = 0 "

	lostOrReceivedQty isNil
		ifTrue: [ lostOrReceivedQty := 0 ].
	^ lostOrReceivedQty