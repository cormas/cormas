Class {
	#name : #CMSpPresenter,
	#superclass : #SpPresenter,
	#category : #'Cormas-UI-Spec2'
}

{ #category : #accessing }
CMSpPresenter >> application [
	" Answer a Spec2 application object "

	^ CMSpApplication new
			useBackend: #Morphic with: self styleConfiguration;
			yourself
]

{ #category : #initialization }
CMSpPresenter >> initialize [

	super initialize.
	application := CMSpApplication new
]

{ #category : #accessing }
CMSpPresenter >> styleConfiguration [ 
	" Private - Use a generic default style configuration for Morphic backend "

	^ SpMorphicConfiguration new
]

{ #category : #accessing }
CMSpPresenter >> translator [
	" Answer the project <PFTranslator> "

	^ self projectManager translator
]

{ #category : #accessing }
CMSpPresenter >> translator: aPFTranslator [
	" Answer the project <PFTranslator> "

	^ self projectManager translator: aPFTranslator
]
