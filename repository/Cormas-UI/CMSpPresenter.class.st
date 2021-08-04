"
Implements support for Spec2 presenters.

To use it just set an instance of this class as the owner of the target (Spec2) presenter.

"
Class {
	#name : #CMSpPresenter,
	#superclass : #SpPresenter,
	#category : #'Cormas-UI-Spec2'
}

{ #category : #accessing }
CMSpPresenter >> application [
	" Answer a Spec2 application object "

	^ CMSpApplication new
			useBackend: #Morphic with: CMSpMorphicConfiguration new;
			yourself
]
