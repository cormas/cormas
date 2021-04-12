Class {
	#name : #CMSpReadOnlyFormBuilder,
	#superclass : #Object,
	#instVars : [
		'labelColor',
		'labelWidth',
		'rowHeight',
		'items',
		'spApplication'
	],
	#category : #'Cormas-UI-Project-Spec2'
}

{ #category : #'instance creation' }
CMSpReadOnlyFormBuilder class >> newBuiltFor: aDictionary application: aSpApplication [

	"If you want to keep order, just send an OrderedDictionary"

	^ self new
		items: aDictionary;
		spApplication: aSpApplication;
		newPresenter
]

{ #category : #defaults }
CMSpReadOnlyFormBuilder >> defaultLabelWidth [

	^ 100 * self currentWorld displayScaleFactor
]

{ #category : #defaults }
CMSpReadOnlyFormBuilder >> initialize [

	items := OrderedDictionary new.
	super initialize
]

{ #category : #accessing }
CMSpReadOnlyFormBuilder >> items [
	^ items
]

{ #category : #accessing }
CMSpReadOnlyFormBuilder >> items: aDictionary [

	items removeAll.
	items addAll: aDictionary.

]

{ #category : #accessing }
CMSpReadOnlyFormBuilder >> labelColor [

	^ labelColor ifNil: [ labelColor := Smalltalk ui theme textColor ]
]

{ #category : #accessing }
CMSpReadOnlyFormBuilder >> labelColor: anObject [
	labelColor := anObject
]

{ #category : #accessing }
CMSpReadOnlyFormBuilder >> labelWidth [

	^ labelWidth ifNil: [ self defaultLabelWidth ]
]

{ #category : #accessing }
CMSpReadOnlyFormBuilder >> labelWidth: anObject [
	labelWidth := anObject
]

{ #category : #'private factory' }
CMSpReadOnlyFormBuilder >> newLayout [

	| newLayout |
	newLayout := SpBoxLayout newVertical.
	self newRowLayout: items associations allButLast in: newLayout.
	self newTextLayout: items associations last in: newLayout.
	^ newLayout
]

{ #category : #'instance creation' }
CMSpReadOnlyFormBuilder >> newPresenter [

	^ (spApplication newPresenter: SpPresenter)
		  layout: self newLayout;
		  yourself
]

{ #category : #'private factory' }
CMSpReadOnlyFormBuilder >> newRowLayout: assocs [

	| newLayout |
	newLayout := SpBoxLayout newVertical.
	assocs withIndexDo: [ :anAssociation :index | 
		"Last item takes all remaining space"		
		index = items size 
			ifTrue: [ newLayout
							add: (self newRowPresenterForLabel: anAssociation key value: anAssociation value)
							withConstraints: [ :constraints |
								constraints padding: 1 ] ]
			ifFalse: [ newLayout
							add: (self newRowPresenterForLabel: anAssociation key value: anAssociation value)
							withConstraints: [ :constraints | 
								constraints padding: 1.
								constraints height: self rowHeight ]]].
	^ newLayout
]

{ #category : #'private factory' }
CMSpReadOnlyFormBuilder >> newRowLayout: assocs in: aSpLayout [

	assocs withIndexDo: [ :anAssociation :index | 
		"Last item takes all remaining space"		
		index = items size 
			ifTrue: [ aSpLayout
							add: (self newRowPresenterForLabel: anAssociation key value: anAssociation value)
							withConstraints: [ :constraints |
								constraints padding: 1 ] ]
			ifFalse: [ aSpLayout
							add: (self newRowPresenterForLabel: anAssociation key value: anAssociation value)
							withConstraints: [ :constraints | 
								constraints padding: 1.
								constraints height: self rowHeight ]]].

]

{ #category : #'private factory' }
CMSpReadOnlyFormBuilder >> newRowPresenterForLabel: aString value: anotherString [

	^ SpBoxLayout newHorizontal
		  add: ((spApplication newPresenter: SpLabelPresenter)
				   label: aString;
				   color: self labelColor;
				   yourself) width: self labelWidth;
		  add: ((spApplication newPresenter: SpTextInputFieldPresenter)
				   text: (anotherString ifNil: [ 'not set' ] ifNotNil: [ : txt | txt trimBoth ]);
					"addStyle: 'iceTipReadonly';"
					enabled: false;
				   yourself);
		  yourself
]

{ #category : #'private factory' }
CMSpReadOnlyFormBuilder >> newTextLayout: anAssociation in: aSpLayout [

	aSpLayout
		add: (self newTextPresenterForLabel: anAssociation key value: anAssociation value)
		withConstraints: [ :constraints | 
			constraints padding: 1.
			constraints height: self rowHeight ].

]

{ #category : #'private factory' }
CMSpReadOnlyFormBuilder >> newTextPresenterForLabel: aString value: anotherString [

	^ SpBoxLayout newHorizontal
		  add: ((spApplication newPresenter: SpLabelPresenter)
				   label: aString;
				   color: self labelColor;
				   yourself) width: self labelWidth;
		  add: ((spApplication newPresenter: SpTextPresenter)
				   text: (anotherString ifNil: [ 'not set' ] ifNotNil: [ : txt | txt trimBoth ]);
					enabled: false;
				   yourself)
				expand: true;
		  yourself
]

{ #category : #accessing }
CMSpReadOnlyFormBuilder >> rowHeight [
	^ rowHeight
]

{ #category : #accessing }
CMSpReadOnlyFormBuilder >> rowHeight: anObject [
	rowHeight := anObject
]

{ #category : #accessing }
CMSpReadOnlyFormBuilder >> spApplication [
	^ spApplication
]

{ #category : #accessing }
CMSpReadOnlyFormBuilder >> spApplication: anObject [
	spApplication := anObject
]
