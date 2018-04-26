accessing
handles
	
	| handles transitionHandle |
	handles := ((1 to: self points size - 1)
		collect: [:i | TrackHandle pointAtIndex: i of: self]) asOrderedCollection.
	transitionHandle := Handle connectionOn: self at: #center.
	handles add: transitionHandle.
	transitionHandle fillColor: ColorValue blue.
	transitionHandle lineColor: ColorValue blue.
	^handles