Class {
	#name : #CMGridViewMorphicAdapter,
	#superclass : #AbstractMorphicAdapter,
	#instVars : [
		'view',
		'canvas',
		'spaceViewClass'
	],
	#category : #'Cormas-UI-PoV'
}

{ #category : #private }
CMGridViewMorphicAdapter >> adapt: aComposableModel [
	super adapt: aComposableModel.
	view := widget.
	canvas := view setUpCanvas.
	widget := canvas buildMorph.
	widget
		setProperty: #model toValue: self;
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	widget extent: canvas extent.
	widget canvas: canvas.
	 self widgetDo: [ :w | w startStepping ]
]

{ #category : #private }
CMGridViewMorphicAdapter >> buildWidget [

	view := self spaceViewClass new. self flag: #toBeRevewed. "why in this case (when using the cormasUI), it uses CMSpaceView class as a view, while when launching simulations through model examples, it uses CMSimulationGrid class which is a subclass of CMSpaceView ? "
	view initializeOn: self model owner projectManager cormasModel.
	view subscribeOn: self model owner projectManager cormasModel.
	^ view
]

{ #category : #accessing }
CMGridViewMorphicAdapter >> canvas [
	^ canvas
]

{ #category : #accessing }
CMGridViewMorphicAdapter >> canvas: anObject [
	canvas := anObject
]

{ #category : #private }
CMGridViewMorphicAdapter >> defaultSpaceViewClass [

	^ CMApplicationPreferences settingSpaceViewer
]

{ #category : #private }
CMGridViewMorphicAdapter >> spaceViewClass [

	^ spaceViewClass
		ifNil: [ spaceViewClass := self defaultSpaceViewClass ]
]

{ #category : #accessing }
CMGridViewMorphicAdapter >> spaceViewClass: anObject [
	spaceViewClass := anObject
]

{ #category : #accessing }
CMGridViewMorphicAdapter >> view [
	^ view
]

{ #category : #accessing }
CMGridViewMorphicAdapter >> view: anObject [
	view := anObject
]
