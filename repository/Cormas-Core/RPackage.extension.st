Extension { #name : #RPackage }

{ #category : #'*Cormas-Core' }
RPackage >> fileOutOn: aStream [
	
	self classTags do: [ :each | 
		SystemOrganization 
			fileOutCategory: each categoryName 
			on: aStream ].	
	
	classExtensionSelectors keysAndValuesDo: [ :className :selectors | 
		selectors do: [ :selector | | extendedClass |
			extendedClass := Smalltalk globals classNamed: className.
			extendedClass fileOutMethod: selector on: aStream ] ].
	
	metaclassExtensionSelectors keysAndValuesDo: [ :className :selectors | 
		selectors do: [ :selector | | extendedClass |
			extendedClass := (Smalltalk globals classNamed: className).
			extendedClass classSide fileOutMethod: selector on: aStream ] ].
	
	^ CodeExporter writeSourceCodeFrom: aStream baseName: self name isSt: true.
]

{ #category : #'*Cormas-Core' }
RPackage >> fileOutOn: aStream named: outFilename [
	
	self classTags do: [ :each | 
		SystemOrganization 
			fileOutCategory: each categoryName 
			on: aStream ].	
	
	classExtensionSelectors keysAndValuesDo: [ :className :selectors | 
		selectors do: [ :selector | | extendedClass |
			extendedClass := Smalltalk globals classNamed: className.
			extendedClass fileOutMethod: selector on: aStream ] ].
	
	metaclassExtensionSelectors keysAndValuesDo: [ :className :selectors | 
		selectors do: [ :selector | | extendedClass |
			extendedClass := (Smalltalk globals classNamed: className).
			extendedClass classSide fileOutMethod: selector on: aStream ] ].
	
	^ CodeExporter writeSourceCodeFrom: aStream baseName: outFilename isSt: true.
]
