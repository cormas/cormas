set
activityChanged
	"set the selectedActivity and the purpose"
	
	self listActivity selection ifNil: [^nil].
	self selectedActivity value: self listActivity selection.
	self changed: #name.
	self purpose
		value:
			(CormasOld
				commentOfMethod: self listActivity selection
				class: self targetClass)