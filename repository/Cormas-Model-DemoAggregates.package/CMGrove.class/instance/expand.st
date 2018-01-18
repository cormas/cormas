control
expand
	"Each forest expands on external cells that are mostly surrounded by forest"
	
	| collec |
	collec := Cormas
		elementsFrom: self surround
		withMaxValue: #forestSurroundingRatio.
	collec size >= (self surround size / 10)
		ifTrue:
			[collec := Cormas
				selectRandomlyFrom: collec
				subCollectionSize: (self surround size / 10) rounded].
	collec do: [:c |  c tree: true]