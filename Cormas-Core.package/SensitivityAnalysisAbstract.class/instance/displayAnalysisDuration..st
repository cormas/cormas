simulation
displayAnalysisDuration: duration
	"display on th Transcript, the duration time of the complete analysis"
	
	| txt |
	txt := '
The current analysis was run in ' , duration printString , ' milliseconds'.
	duration > 1000
		ifTrue:
			[| dur |
			txt := txt , ', ie. '.
			dur := Time fromSeconds: duration / 1000.
			txt := txt , dur hours printString , ' h: ' , dur minutes printString ,
					' m: ' , dur seconds asFloat printString , ' s.'].
	Transcript print: txt