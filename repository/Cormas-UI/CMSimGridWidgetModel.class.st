Class {
	#name : #CMSimGridWidgetModel,
	#superclass : #AbstractWidgetModel,
	#category : #'Cormas-UI-PoV'
}

{ #category : #specs }
CMSimGridWidgetModel class >> defaultSpec [
	<spec>
	^ #(CMGridViewMorphicAdapter adapt: #(model))
]
