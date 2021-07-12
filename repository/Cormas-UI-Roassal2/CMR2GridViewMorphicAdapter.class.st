Class {
	#name : #CMR2GridViewMorphicAdapter,
	#superclass : #AbstractMorphicAdapter,
	#instVars : [
		'view',
		'canvas',
		'spaceViewClass'
	],
	#category : #'Cormas-UI-Roassal2'
}

{ #category : #private }
CMR2GridViewMorphicAdapter >> adapt: aComposableModel [
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
CMR2GridViewMorphicAdapter >> buildWidget [

	view := self spaceViewClass new. self flag: #toBeRevewed. "why in this case (when using the cormasUI), it uses CMSpaceView class as a view, while when launching simulations through model examples, it uses CMSimulationGrid class which is a subclass of CMSpaceView ? "
	view initializeOn: self model owner projectManager cormasModel.
	view subscribeOn: self model owner projectManager cormasModel.
	^ view
]

{ #category : #accessing }
CMR2GridViewMorphicAdapter >> canvas [
	^ canvas
]

{ #category : #accessing }
CMR2GridViewMorphicAdapter >> canvas: anObject [
	canvas := anObject
]

{ #category : #private }
CMR2GridViewMorphicAdapter >> defaultSpaceViewClass [

	^ CMApplicationPreferences settingSpaceViewer
]

{ #category : #private }
CMR2GridViewMorphicAdapter >> spaceViewClass [

	^ spaceViewClass
		ifNil: [ spaceViewClass := self defaultSpaceViewClass ]
]

{ #category : #accessing }
CMR2GridViewMorphicAdapter >> spaceViewClass: anObject [
	spaceViewClass := anObject
]

{ #category : #accessing }
CMR2GridViewMorphicAdapter >> view [
	^ view
]

{ #category : #accessing }
CMR2GridViewMorphicAdapter >> view: anObject [
	view := anObject
]
