menu-display options
setTrackLength
	"set the maximum size of the figures' tracks"
	
	(self 
		requestFrom: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)
		message: self translator tAgentTracksSize
		title: 'CORMAS')
			ifNil: [ ^ self ]
			ifNotNil: [ : selectedItem |
				self trackLengthValue: selectedItem.
				self applyTrackLengthValue: selectedItem ]