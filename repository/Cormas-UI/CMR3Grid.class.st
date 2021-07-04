Class {
	#name : #CMR3Grid,
	#superclass : #SpPresenter,
	#instVars : [
		'diagram',
		'label',
		'text',
		'button'
	],
	#category : #'Cormas-UI-Space-Spec2'
}

{ #category : #specs }
CMR3Grid class >> defaultSpec [

	<spec: #default>
	^ SpPanedLayout newHorizontal
		  positionOfSlider: 35 percent;
		  add: (SpBoxLayout newVertical
				   add: #label
				   withConstraints: [ :c | c height: self toolbarHeight ];
				   add: #text;
				   add: #button
				   withConstraints: [ :c | c height: self toolbarHeight ]);
		  add: #diagram;
		  yourself
]

{ #category : #specs }
CMR3Grid class >> open [
	<script>
	self new openWithSpec
]

{ #category : #initialization }
CMR3Grid >> configure: canvas [
	canvas @ RSCanvasController.
	canvas color: self theme backgroundColor.
]

{ #category : #initialization }
CMR3Grid >> connectPresenters [

	label
		label: 'Enter code below. Both view and canvas are accessible'.

	text
		text: self initialCode;
		autoAccept: true.

	button
		label: 'Draw this!';
		action: [ diagram refresh ].

	"This is the code for the Roassal view.
	The block takes both a view and a canvas."
	diagram script: [ :canvas |
		self configure: canvas.
		self textAsBlockClosure value: canvas ]

]

{ #category : #initialization }
CMR3Grid >> initialCode [
	^
'"[:canvas | ]"
box := RSBox new
	size: 100;
	draggable;
	yourself.
canvas add: box.
'
]

{ #category : #initialization }
CMR3Grid >> initializePresenters [
	label := self newLabel.
	text := self newCode.
	button := self newButton.
	diagram := self instantiate: SpRoassalPresenter
]

{ #category : #initialization }
CMR3Grid >> initializeWindow: w [
	w 
		title: 'Roassal3 Spec';
		initialExtent: 800@500.
]

{ #category : #dependencies }
CMR3Grid >> release [
	self class instVarNames do: [ :n | self instVarNamed: n put: nil ]
]

{ #category : #running }
CMR3Grid >> run [
	<script: 'self new openWithSpec'>
]

{ #category : #accessing }
CMR3Grid >> textAsBlockClosure [
	"This could be made more clever with regard to compilation and runtime errors. But for this simple example it should suffice."

	^ self class compiler
		source: '[:canvas | ' , text text asString , ']';
		logged: false;
		evaluate
]
