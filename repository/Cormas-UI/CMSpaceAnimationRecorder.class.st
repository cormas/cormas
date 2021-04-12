"
CMSpaceAnimationRecorder new.

"
Class {
	#name : #CMSpaceAnimationRecorder,
	#superclass : #CMSpaceView,
	#instVars : [
		'writer',
		'animLog'
	],
	#category : #'Cormas-UI-PoV'
}

{ #category : #accessing }
CMSpaceAnimationRecorder >> animFileReference: aNewTimeStep [
	" Answer a <FileReference> with the receiver's log file name for aNewTimeStep "

	^ self animationsPath / (self animLogFilename: aNewTimeStep)
]

{ #category : #accessing }
CMSpaceAnimationRecorder >> animLog [

	^ animLog 
		ifNil: [ animLog := self defaultAnimLogFilename ]
]

{ #category : #accessing }
CMSpaceAnimationRecorder >> animLogFilename: aNewTimeStep [
	" Answer a <String> representing the log file name for aNewTimeStep "

	^ String streamContents: [ : stream |
		stream 
			<< self animLog;
			<< '_';
			<< (self formatTimeStep: aNewTimeStep);
			<< '.log' ]
]

{ #category : #accessing }
CMSpaceAnimationRecorder >> animationsPath [
	" Answer a <FileReference> to store the receiver's logs "

	^ CMResourceLocator new animationsPath
]

{ #category : #accessing }
CMSpaceAnimationRecorder >> cleanSpace: aNewTimeStep [

	aNewTimeStep = 0
		ifTrue: [ 
			self clearView.
			self addViewForCells: model theESE ]
		ifFalse: [ 
			self removeObsoleteSituatedEntities ]
]

{ #category : #accessing }
CMSpaceAnimationRecorder >> defaultAnimLogFilename [
	" Answer a <String> representing a timestamped file name "

	^ String streamContents: [ : stream |
			stream
				<< 'cormas_sim_run_';
				<< DateAndTime now asFileNameCompatibleString ]
]

{ #category : #defaults }
CMSpaceAnimationRecorder >> defaultWriter [

	^ GIFReadWriter on: self outputFilename asFileReference binaryWriteStream.
]

{ #category : #accessing }
CMSpaceAnimationRecorder >> formatTimeStep: aNewTimeStep [
	" 1 -> 000001 "

	^ GRStringPrinter new 
		character: $0;
		length: 6 - aNewTimeStep numberOfDigits;
		padLeft;
		print: aNewTimeStep asString
]

{ #category : #accessing }
CMSpaceAnimationRecorder >> startAnimLogSituatedEntities: aNewTimeStep [
	" Private - Log the initial positions "

	aNewTimeStep = 1 ifTrue: [ 
		(self animFileReference: 0) writeStreamDo: [ : fileStream |
			self situatedEntitiesViews do: [ :e | e logCormasImageTo: fileStream ] ] ]
]

{ #category : #accessing }
CMSpaceAnimationRecorder >> timeChanged: aNewTimeStep [

	self halt.
	self cleanSpace: aNewTimeStep.
	self addNewSituatedEntities.
	self startAnimLogSituatedEntities: aNewTimeStep.

	(self animFileReference: aNewTimeStep) writeStreamDo: [ : fileStream |
		self situatedEntitiesViews do: [ :e | 
			e 
				relocateCormasEntity: cellSize;
				logCormasImageTo: fileStream ] ].
	self canvas signalUpdate
]

{ #category : #accessing }
CMSpaceAnimationRecorder >> writer [
	^ writer
		ifNil: [ writer := self defaultWriter ]
]

{ #category : #accessing }
CMSpaceAnimationRecorder >> writer: anObject [
	writer := anObject
]
