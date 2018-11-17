Class {
	#name : #CMGridViewMorphicAdapter,
	#superclass : #AbstractMorphicAdapter,
	#instVars : [
		'view',
		'canvas'
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
	view := CMSimulationGridSpec new.
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

{ #category : #accessing }
CMGridViewMorphicAdapter >> view [
	^ view
]

{ #category : #accessing }
CMGridViewMorphicAdapter >> view: anObject [
	view := anObject
]
