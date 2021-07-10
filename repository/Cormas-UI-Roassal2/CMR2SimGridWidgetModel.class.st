Class {
	#name : #CMR2SimGridWidgetModel,
	#superclass : #AbstractWidgetPresenter,
	#category : #'Cormas-UI-Roassal2'
}

{ #category : #specs }
CMR2SimGridWidgetModel class >> defaultSpec [
	<spec>
	^ #(#CMR2GridViewMorphicAdapter adapt: #(model))
]
