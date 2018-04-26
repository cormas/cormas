version
updateName
	"	update the Cormas name with new date"
	
	self class
		compile:
			'cormasName\	^ ''' withCRs , 'cormasMVC'
				, Time dateAndTimeNow first year printString , ''''
		classified: 'version'
		notifying: nil.
	^self