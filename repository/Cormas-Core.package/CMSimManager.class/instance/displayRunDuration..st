simulate
displayRunDuration: duration
	"display on th Transcript, the duration time of the simulation"
	
	| txt |
	txt := '
Simulation [' , self simName , ']¬†was run in ' , duration printString ,
			' milliseconds'.
	duration > 1000
		ifTrue:
			[| dur |
			txt := txt , ', ie. '.
			dur := Time fromSeconds: duration / 1000.
			txt := txt , dur hours printString , ' h: ' , dur minutes printString ,
					' m: ' , dur seconds asFloat printString , ' s.'].
	Transcript print: txt