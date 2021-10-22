Class {
	#name : #CMSpSimControlPresenter,
	#superclass : #CMSpPresenter,
	#instVars : [
		'runUntilLabel',
		'runUntilTime',
		'runDurationSpecList',
		'sampleResultsLabel',
		'sampleResultsEvery',
		'sampleResultsSpecList',
		'durationTime',
		'durationSpecSelector',
		'samplingTime',
		'samplingSpecSelector',
		'outputToLabel',
		'outputToList'
	],
	#category : #'Cormas-UI-Spec2-Simulation-Controls'
}

{ #category : #specs }
CMSpSimControlPresenter class >> defaultSpec [

	^ SpGridLayout new
		add: #runUntilLabel at: 1 @ 1;
		add: #runUntilTime at: 2 @ 1;
		add: #runDurationSpecList at: 3 @ 1;
		
		add: #sampleResultsLabel at: 1 @ 2;
		add: #sampleResultsEvery at: 2 @ 2;
		add: #sampleResultsSpecList at: 3 @ 2;

		add: #outputToLabel at: 1 @ 3;
		add: #outputToList at: 2 @ 3;
 
		yourself
		

]

{ #category : #examples }
CMSpSimControlPresenter class >> example [
	<example>
	
	^ self new openWithSpec
]

{ #category : #defaults }
CMSpSimControlPresenter >> defaultDuration [

	^ 10
]

{ #category : #defaults }
CMSpSimControlPresenter >> durationOptions [

	^ { 
		#milliseconds .
		#seconds .
		#minutes .
		#hour .
		#hours .
		#days
		}
]

{ #category : #accessing }
CMSpSimControlPresenter >> durationSpecSelector [

	^ durationSpecSelector
]

{ #category : #accessing }
CMSpSimControlPresenter >> durationSpecSelector: anObject [

	durationSpecSelector := anObject
]

{ #category : #accessing }
CMSpSimControlPresenter >> durationTime [

	^ durationTime
]

{ #category : #accessing }
CMSpSimControlPresenter >> durationTime: anObject [

	durationTime := anObject
]

{ #category : #initialization }
CMSpSimControlPresenter >> initializeDurationTime [

	runUntilLabel := self newLabel label: 'Run until'.
	runUntilTime := self newNumberInput
		autoAccept: true;
		placeholder: 'Run during';
		beInteger;
		whenNumberChangedDo: [ :newText | self durationTime: (self parseNumberAndGetValue: newText) ];
		yourself.
	runDurationSpecList := self newDropList
		items: self durationOptions;
		whenSelectedItemChangedDo: [ : newText | self durationSpecSelector: newText];
		yourself.
]

{ #category : #initialization }
CMSpSimControlPresenter >> initializeOuptutTo [

	outputToLabel := self newLabel label: 'Output to'.
	outputToList := self newDropList
		items: self outputOptions;
		whenSelectedItemChangedDo: [ : newText | self outputTo: newText];
		yourself.

]

{ #category : #initialization }
CMSpSimControlPresenter >> initializePresenters [ 

	self 
		initializeDurationTime;
		initializeSamplingTime;
		initializeOuptutTo.
]

{ #category : #initialization }
CMSpSimControlPresenter >> initializeSamplingTime [

	sampleResultsLabel := self newLabel label: 'Sampling every'.
	sampleResultsEvery := self newNumberInput
		autoAccept: true;
		placeholder: 'Sample time';
		beInteger;
		whenNumberChangedDo: [ :newText | self samplingTime: (self parseNumberAndGetValue: newText) ];
		yourself.
	sampleResultsSpecList := self newDropList
		items: self durationOptions;
		whenSelectedItemChangedDo: [ : newText | self samplingSpecSelector: newText];
		yourself.

]

{ #category : #initialization }
CMSpSimControlPresenter >> outputOptions [

	^ { 
		'Screen' .
		'File' 
		}
]

{ #category : #accessing }
CMSpSimControlPresenter >> outputToLabel [

	^ outputToLabel
]

{ #category : #accessing }
CMSpSimControlPresenter >> outputToLabel: anObject [

	outputToLabel := anObject
]

{ #category : #accessing }
CMSpSimControlPresenter >> outputToList [

	^ outputToList
]

{ #category : #accessing }
CMSpSimControlPresenter >> outputToList: anObject [

	outputToList := anObject
]

{ #category : #initialization }
CMSpSimControlPresenter >> parseNumberAndGetValue: anObject [

	^ anObject isNumber
		ifFalse: [ self defaultDuration ]
		ifTrue: [ anObject ]
]

{ #category : #accessing }
CMSpSimControlPresenter >> runDurationSpecList [

	^ runDurationSpecList
]

{ #category : #accessing }
CMSpSimControlPresenter >> runDurationSpecList: anObject [

	runDurationSpecList := anObject
]

{ #category : #accessing }
CMSpSimControlPresenter >> runUntilLabel [

	^ runUntilLabel
]

{ #category : #accessing }
CMSpSimControlPresenter >> runUntilLabel: anObject [

	runUntilLabel := anObject
]

{ #category : #accessing }
CMSpSimControlPresenter >> runUntilTime [

	^ runUntilTime
]

{ #category : #accessing }
CMSpSimControlPresenter >> runUntilTime: anObject [

	runUntilTime := anObject
]

{ #category : #accessing }
CMSpSimControlPresenter >> sampleResultsEvery [

	^ sampleResultsEvery
]

{ #category : #accessing }
CMSpSimControlPresenter >> sampleResultsEvery: anObject [

	sampleResultsEvery := anObject
]

{ #category : #accessing }
CMSpSimControlPresenter >> sampleResultsLabel [

	^ sampleResultsLabel
]

{ #category : #accessing }
CMSpSimControlPresenter >> sampleResultsLabel: anObject [

	sampleResultsLabel := anObject
]

{ #category : #accessing }
CMSpSimControlPresenter >> sampleResultsSpecList [

	^ sampleResultsSpecList
]

{ #category : #accessing }
CMSpSimControlPresenter >> sampleResultsSpecList: anObject [

	sampleResultsSpecList := anObject
]

{ #category : #accessing }
CMSpSimControlPresenter >> samplingSpecSelector [

	^ samplingSpecSelector
]

{ #category : #accessing }
CMSpSimControlPresenter >> samplingSpecSelector: anObject [

	samplingSpecSelector := anObject
]

{ #category : #accessing }
CMSpSimControlPresenter >> samplingTime [

	^ samplingTime
]

{ #category : #accessing }
CMSpSimControlPresenter >> samplingTime: anObject [

	samplingTime := anObject
]

{ #category : #accessing }
CMSpSimControlPresenter >> title [ 

	^ 'CORMAS - Simulation Controls'
]
