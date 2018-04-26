menu - actions
setTrackLength
	"set the maximum size of the figures' tracks"
	
	| value aClass |
	value := Dialog
		choose: 'Choose the size of the agents tracks'
		fromList:
			#('1' '2' '3' '4' '5' '6' '7' '8' '9' '10' '11' '12' '13' '14' '15' '16' '17' '18' '19' '20')
		values: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)
		buttons: #('infinite')
		values: #(0)
		lines: 8
		cancel: [#noChoice].
	value = #noChoice ifTrue: [^self].
	TrackFigure maxSize: value.
	self trackedFigureTypes
		do:
			[:symbol | 
			aClass := symbol class.
			(self drawing entityFiguresAt: aClass)
				do:
					[:fig | 
					(fig dependents select: [:tf | tf isKindOf: TrackFigure])
						do:
							[:track | 
							track testAndRemoveOrigine.
							track invalidate]]]