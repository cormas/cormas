"
CMSpaceAnimationRecorder new.

"
Class {
	#name : #CMR2SpaceAnimationRecorder,
	#superclass : #CMR2SpaceView,
	#instVars : [
		'writer',
		'animLog'
	],
	#category : #'Cormas-UI-Roassal2'
}

{ #category : #accessing }
CMR2SpaceAnimationRecorder >> animFileReference: aNewTimeStep [
	" Answer a <FileReference> with the receiver's log file name for aNewTimeStep "

	^ self animationsPath / (self animLogFilename: aNewTimeStep)
]

{ #category : #accessing }
CMR2SpaceAnimationRecorder >> animLog [

	^ animLog 
		ifNil: [ animLog := self defaultAnimLogFilename ]
]

{ #category : #accessing }
CMR2SpaceAnimationRecorder >> animLogFilename: aNewTimeStep [
	" Answer a <String> representing the log file name for aNewTimeStep "

	^ String streamContents: [ : stream |
		stream 
			<< self animLog;
			<< '_';
			<< (self formatTimeStep: aNewTimeStep);
			<< '.log' ]
]

{ #category : #accessing }
CMR2SpaceAnimationRecorder >> animationsPath [
	" Answer a <FileReference> to store the receiver's logs "

	^ CMResourceLocator new animationsPath
]

{ #category : #accessing }
CMR2SpaceAnimationRecorder >> cleanSpace: aNewTimeStep [

	aNewTimeStep = 0
		ifTrue: [ 
			self clearView.
			self addViewForCells: model theESE ]
		ifFalse: [ 
			self removeObsoleteSituatedEntities ]
]

{ #category : #accessing }
CMR2SpaceAnimationRecorder >> defaultAnimLogFilename [
	" Answer a <String> representing a timestamped file name "

	^ String streamContents: [ : stream |
			stream
				<< 'cormas_sim_run_';
				<< DateAndTime now asFileNameCompatibleString ]
]

{ #category : #defaults }
CMR2SpaceAnimationRecorder >> defaultWriter [

	^ GIFReadWriter on: self outputFilename asFileReference binaryWriteStream.
]

{ #category : #accessing }
CMR2SpaceAnimationRecorder >> formatTimeStep: aNewTimeStep [
	" 1 -> 000001 "

	^ GRStringPrinter new 
		character: $0;
		length: 6 - aNewTimeStep numberOfDigits;
		padLeft;
		print: aNewTimeStep asString
]

{ #category : #accessing }
CMR2SpaceAnimationRecorder >> startAnimLogSituatedEntities: aNewTimeStep [
	" Private - Log the initial positions "

	aNewTimeStep = 1 ifTrue: [ 
		(self animFileReference: 0) writeStreamDo: [ : fileStream |
			self situatedEntitiesViews do: [ :e | e logCormasImageTo: fileStream ] ] ]
]

{ #category : #accessing }
CMR2SpaceAnimationRecorder >> timeChanged: aNewTimeStep [

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
CMR2SpaceAnimationRecorder >> writer [
	^ writer
		ifNil: [ writer := self defaultWriter ]
]

{ #category : #accessing }
CMR2SpaceAnimationRecorder >> writer: anObject [
	writer := anObject
]
