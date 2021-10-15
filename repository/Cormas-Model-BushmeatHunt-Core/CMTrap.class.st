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

	aStream
		<< 'Trap: ';
		<< self family asString;
		space;
		<< self location asString

]
