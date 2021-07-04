Class {
	#name : #CMSimGridWidgetModel,
	#superclass : #AbstractWidgetPresenter,
	#category : #'Cormas-UI-Space-Spec1'
}

{ #category : #specs }
CMSimGridWidgetModel class >> defaultSpec [
	<spec>
	^ #(CMGridViewMorphicAdapter adapt: #(model))
]
