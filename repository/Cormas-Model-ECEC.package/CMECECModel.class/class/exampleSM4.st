examples - with SimManager
exampleSM4
	"This example compares the performance of using SimManager or not using it"

	| nbRepetitions chronoRecords finalTime |
	nbRepetitions := 10.
	finalTime := 20.
	"exampleSM1"
	chronoRecords := OrderedCollection new.
	1 to: nbRepetitions do: [ :idRepetition | 
		| chrono |
		chrono := Time
			millisecondsToRun: [ | aModel |
				aModel := self initialize new initSimulation.
				finalTime timesRepeat: [ aModel runStep ] ].
		chronoRecords add: chrono
		"	self displayRunDuration: chrono simName: 'exampleSM1 - repetition' , idRepetition asString " ].
	Transcript
		cr;
		show: 'exampleSM1 (no SimManager) - average time over ' , nbRepetitions asString , ' repetitions: ' , (chronoRecords sum / nbRepetitions) rounded asString , ' ms'.
	"exampleSM2"
	chronoRecords := OrderedCollection new.
	1 to: nbRepetitions do: [ :idRepetition | 
		| chrono |
		chrono := Time
			millisecondsToRun: [ | aModel |
				aModel := self initialize new initSimulation.
				aModel simManager
					finalTime: finalTime;
					runSimulation ].
		chronoRecords add: chrono
		"	self displayRunDuration: chrono simName: 'exampleSM2 - repetition' , idRepetition asString " ].
	Transcript
		cr;
		show:
			'exampleSM2 (SimManager used for run) - average time over ' , nbRepetitions asString , ' repetitions: ' , (chronoRecords sum / nbRepetitions) rounded asString
				, ' ms'.
	"exampleSM3"
	chronoRecords := OrderedCollection new.
	1 to: nbRepetitions do: [ :idRepetition | 
		| chrono |
		chrono := Time
			millisecondsToRun: [ | aModel |
				aModel := self initialize new.
				aModel simManager
					initializeSimulation;
					finalTime: finalTime;
					runSimulation ].
		chronoRecords add: chrono
		"	self displayRunDuration: chrono simName: 'exampleSM3 - repetition' , idRepetition asString " ].
	Transcript
		cr;
		show:
			'exampleSM3 (SimManager used for init and run) - average time over ' , nbRepetitions asString , ' repetitions: '
				, (chronoRecords sum / nbRepetitions) rounded asString , ' ms'.
	Transcript open