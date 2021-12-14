Class {
	#name : #CMTrap,
	#superclass : #Object,
	#instVars : [
		'family',
		'location'
	],
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #'instance creation' }
CMTrap class >> forFamily: aCMBushmeatHuntingFamily location: aPoint [ 

	^ self new
		family: aCMBushmeatHuntingFamily;
		location: aPoint;
		yourself
]

{ #category : #accessing }
CMTrap >> addCatch [
	" The receiver catched a located entity, increment the seasonal catches "
	
	self seasonCatches: self seasonCatches + 1
]

{ #category : #printing }
CMTrap >> asString [

	^ String << [ : stream | 
		stream
			<< 'Trap of family: ';
			<< self family asString;
			cr;
			<< 'Location: ';
			<< self location asString;
			cr;
			<< 'Season catches: ';
			<< self seasonCatches asString;
			cr ]

]

{ #category : #accessing }
CMTrap >> color [

	^ self family familyColor
]

{ #category : #accessing }
CMTrap >> family [

	^ family
]

{ #category : #accessing }
CMTrap >> family: aCMBushmeatHuntingFamily [ 
	family := aCMBushmeatHuntingFamily
]

{ #category : #testing }
CMTrap >> hasLocation [
	" Answer <true> if the receiver is configured with a specific location "

	^ location notNil
]

{ #category : #accessing }
CMTrap >> increaseCatch [ 

	self totalCatches: self totalCatches + 1.
	self seasonCatches: self seasonCatches + 1.
]

{ #category : #initialization }
CMTrap >> initialize [

	super initialize.
	self hasLocation
		ifTrue: [ self seasonCatches: self seasonCatches + 1 ]
]

{ #category : #accessing }
CMTrap >> location [

	^ location
]

{ #category : #accessing }
CMTrap >> location: aPoint [ 
	location := aPoint
]

{ #category : #printing }
CMTrap >> printOn: aStream [

	aStream << self asString
]

{ #category : #accessing }
CMTrap >> removeTrap [
	" Configure the receiver to be removed from its current location "
	
	self totalCatches: self totalCatches + self seasonCatches.
	self seasonCatches: 0.
]

{ #category : #accessing }
CMTrap >> seasonCatches [

	^ seasonCatches
		ifNil: [ seasonCatches := 0 ]
]

{ #category : #accessing }
CMTrap >> seasonCatches: anObject [

	seasonCatches := anObject
]

{ #category : #accessing }
CMTrap >> totalCatches [

	^ totalCatches 
		ifNil: [ totalCatches := 0 ]
]

{ #category : #accessing }
CMTrap >> totalCatches: anObject [

	totalCatches := anObject
]
