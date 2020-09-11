Class {
	#name : #CMSimGridWidgetModel,
	#superclass : #AbstractWidgetPresenter,
	#category : #'Cormas-UI-PoV'
}

{ #category : #specs }
CMSimGridWidgetModel class >> defaultSpec [
	<spec>
	^ #(CMGridViewMorphicAdapter adapt: #(model))
]
