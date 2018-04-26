accessing
activeInit
	^ activeInit ifNil: [ activeInit := self class defaultInit ]