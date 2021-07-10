Extension { #name : #CMProjectManager }

{ #category : #'*Cormas-UI' }
CMProjectManager >> defaultCormasOpener [
	" Answer a <Class> responsible for managing to open CORMAS projects or models "

	^ CMProjectOpener
]

{ #category : #'*Cormas-UI' }
CMProjectManager >> doPostNewActions [
	" Basic post new actions. Redefine in subclasses if necessary "

	super doPostNewActions.
	(CMSpecModelComments for: self) openWithSpec.

]

{ #category : #'*Cormas-UI' }
CMProjectManager >> openModel: aModel [
	" Open aModel for the receiver "

	^ (CMModelOpener newFrom: self) 
		openModel: aModel;
		yourself
]
