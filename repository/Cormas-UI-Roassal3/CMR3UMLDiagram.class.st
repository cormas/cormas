Class {
	#name : #CMR3UMLDiagram,
	#superclass : #CMSpRoassalPresenter,
	#instVars : [
		'umlBuilder'
	],
	#category : #'Cormas-UI-Roassal3-UML'
}

{ #category : #initialization }
CMR3UMLDiagram >> cormasModel [
	" Answer the receiver's <CMAbstractModel> "

	^ cormasModel
]

{ #category : #initialization }
CMR3UMLDiagram >> initialize [
	" Private - Set the receiver's Spec application "

	| builder codeStream tmpLocation |

	super initialize.
	tmpLocation := FileLocator temp asFileReference.
	builder := RSUMLClassBuilder new.
	CMProjectFile new 
		readFrom: self cormasModel fileReference;
		extractAllTo: tmpLocation informing: nil overwrite: true.
	codeStream := RingChunkImporter fromStream: (tmpLocation / 'model.st') readStream.
	builder classes: codeStream classes.

	builder modelDescriptor methodsLimit: 5.
	builder renderer edgeBuilder cornerRadii: 20.
	builder build.
	self canvas: builder canvas
]

{ #category : #initialization }
CMR3UMLDiagram >> setModelBeforeInitialization: aDomainObject [
	" Private - See superimplementor's comment "
	
	cormasModel := aDomainObject.
]
