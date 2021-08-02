Class {
	#name : #CMResourceCreator,
	#superclass : #CMResourceLocator,
	#category : #'Cormas-Core-Kernel'
}

{ #category : #'utilities - path - models' }
CMResourceCreator >> addOnsPath [
	" Answer a <FileReference> corresponding to the path of 'Add-ons' directory "
	
	^ super addOnsPath ensureCreateDirectory.


]

{ #category : #'utilities - path - models' }
CMResourceCreator >> animationsPath [
	" Answer a <FileReference> corresponding to the path of stored Animations directory. "

	^ super animationsPath ensureCreateDirectory.

]

{ #category : #'utilities - path - models' }
CMResourceCreator >> dumpPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'dump' directory.
	aModelClassName = <String>"
	
	^ (super dumpPath: aModelClassName) ensureCreateDirectory.

]

{ #category : #'utilities - path - models' }
CMResourceCreator >> imagesPath [
	" Answer a <FileReference> corresponding to the path of the current 'images' directory.
	aModelClassName = <String>"
	
	^ super imagesPath ensureCreateDirectory.

]

{ #category : #'utilities - path - models' }
CMResourceCreator >> mapsPath [
	" Answer a FileReference corresponding to the path of the current path directory.
	Argument: aModelClassName = <String>
	Example: 
		CMResourceLocator new mapsPath
	"
	^ super mapsPath ensureCreateDirectory.

]

{ #category : #'utilities - path - models' }
CMResourceCreator >> mapsPath: shortModelName [
	" Answer a <FileReference> corresponding to the path of the maps directory of the current model.
	Argument: shortModelName = <String>
	Example: 
		CMResourceLocator new mapsPath: #FireModel >>> '/Users/.../cormas/assets/models/FireModel'
	"
	
	^ (super mapsPath: shortModelName) ensureCreateDirectory.

]

{ #category : #'utilities - path - models' }
CMResourceCreator >> modelPath: shortModelName [
	" Answer a FileReference corresponding to the path of the current model directory.
	Argument: shortModelName = <String>
	Example: 
	CMResourceLocator new modelPath: #FireModel >>> 'File @ /Users/Bommel/Pharo/images/Pharo 8.0 - 64bit (stable)/pharo-local/iceberg/cormas/cormas/assets/models/FireModel'
	"
	
	^ (super modelPath: shortModelName) ensureCreateDirectory.

]

{ #category : #'utilities - path - models' }
CMResourceCreator >> modelsPath [
	" Answer a <FileReference> corresponding to the path of 'Models' directory 
	Ex: File @ /Users/.../iceberg/cormas/cormas/assets/models"
	
	^ super modelsPath ensureCreateDirectory.

]

{ #category : #'utilities - path - models' }
CMResourceCreator >> videoPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'video' directory.
	aModelClassName = <String>"
	
	^ (super videoPath: aModelClassName) ensureCreateDirectory.

]
