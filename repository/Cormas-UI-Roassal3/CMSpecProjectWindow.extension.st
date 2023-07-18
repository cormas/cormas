Extension { #name : #CMSpecProjectWindow }

{ #category : #'*Cormas-UI-Roassal3' }
CMSpecProjectWindow >> openUMLViewer [

	| package builder |

	builder := RSUMLClassBuilder new.
	package := RPackage organizer packageOfClassNamed: self cormasModelClass asString.
	builder classes: package classes.
	builder build.
	builder canvas open
]
