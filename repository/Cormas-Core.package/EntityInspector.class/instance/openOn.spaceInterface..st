initialize-release
openOn: anObject spaceInterface: aSI
	
	| win minS maxS |
	history := nil.
	anObject = object
		ifTrue: [self update]
		ifFalse: [object := anObject].
	self linkedSI: aSI.
	self resetFields.
	win := (self allButOpenInterface: #windowSpec) window.
	self option value: 'Options..'.
	self showInstance: #no.
	minS := win minimumSize.
	maxS := win maximumSize.
	self updateValues.
	win minimumSize: minS.
	win maximumSize: maxS.
	win
		openWithExtent:
			win minimumSize x
				@
					(win minimumSize y + (((self attribute_List list size min: 20) - 1.8) * 20))