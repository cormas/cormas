"
Helper class to find CORMAS assets. It provides methods to locate model directories and files.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CMResourceLocator,
	#superclass : #GitBridge,
	#classInstVars : [
		'useGitBridge'
	],
	#category : #'Cormas-Core-Kernel'
}

{ #category : #public }
CMResourceLocator class >> assetsFilesDirectoryName [
	" Answe a <String> with the name of the directoy where CORMAS resources are found "

	^ 'assets'
]

{ #category : #public }
CMResourceLocator class >> assetsPath [
	"Return the assets path of Cormas
	Ex: {localDirectory}/iceberg/cormas/cormas/assets"

	^ self useGitBridge
		ifTrue: [ self assetsPathForIceberg ]
		ifFalse: [ self assetsPathForCI ]

]

{ #category : #accessing }
CMResourceLocator class >> assetsPathForCI [
	" The model path from the resource already contains the assets directory "

	^ CMModelResource current modelPath
]

{ #category : #accessing }
CMResourceLocator class >> assetsPathForIceberg [

	^ ([ self root ]
		on: GBError
		do: [ :ex | FileLocator workingDirectory ]) / self assetsFilesDirectoryName
]

{ #category : #accessing }
CMResourceLocator class >> cormasHomeProjects [

	^ (FileLocator home / 'CORMAS') allChildrenMatching: CMApplicationProject applicationExtension.
]

{ #category : #accessing }
CMResourceLocator class >> demosPath [
	" Answer a <FileReference> with the receiver's path to the demos directory "

	^ CMApplicationProject baseDirectory / 'demos'
]

{ #category : #'class initialization' }
CMResourceLocator class >> initialize [
	SessionManager default registerSystemClassNamed: self name
]

{ #category : #accessing }
CMResourceLocator class >> preferencesPath [
	" Answer a <FileReference> with the receiver's path to the preferences directory "

	^ CMApplicationProject baseDirectory / 'preferences'
]

{ #category : #accessing }
CMResourceLocator class >> useGitBridge [
	" Read comment in #root method "

	^ useGitBridge
		ifNil: [ useGitBridge := true ]
]

{ #category : #accessing }
CMResourceLocator class >> useGitBridge: anObject [

	useGitBridge := anObject
]

{ #category : #accessing }
CMResourceLocator class >> userProjectsPath [
	" Answer a <FileReference> with the receiver's path to the user projects directory "

	^ CMApplicationProject baseDirectory / 'projects'
]

{ #category : #public }
CMResourceLocator class >> workingDirectory [
	" Answer a <String> with the default directory "
	
	^ FileSystem disk workingDirectory fullName
]

{ #category : #'utilities - path - global' }
CMResourceLocator >> addOnsPath [
	" Answer a <FileReference> corresponding to the path of 'Add-ons' directory "
	
	^ self cormasPath / 'Add-ons'.


]

{ #category : #'utilities - path - models' }
CMResourceLocator >> animationsPath: shortModelName [
	" Answer a <FileReference> corresponding to the path of stored Animations directory. "

	^ (self modelPath: shortModelName) asFileReference / 'animations'.
]

{ #category : #'utilities - csv' }
CMResourceLocator >> assetNamed: aFilename [
	" Answer a <FileReference> found at the assets location, where aFilename is a <String>
	example: CMResourceLocator new assetNamed: 'models'
	"
	
	^ self assetsPath / aFilename

]

{ #category : #'utilities - path - global' }
CMResourceLocator >> assetsFilesDirectoryName [
	" Answe a <String> with the name of the directoy where CORMAS resources are found "

	^ self class assetsFilesDirectoryName
]

{ #category : #'utilities - path - global' }
CMResourceLocator >> assetsPath [
	" Answer a <FileReference> specifying a directory where CORMAS assets are found.
	Ex: /Users/Bommel/Pharo/images/Pharo 8.0 - 64bit (stable)/pharo-local/iceberg/cormas/cormas/assets"

	^ self class assetsPath asFileReference
]

{ #category : #'utilities - path - global' }
CMResourceLocator >> cormasPath [
	" Answer a <FileReference> corresponding to the path of Cormas directory. "

	^ self workingDirectory asFileReference

]

{ #category : #'utilities - path - models' }
CMResourceLocator >> diagramsPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'dump' directory.
	aModelClassName = <String>"
	
	^ (self modelPath: aModelClassName) / 'diagrams'.

]

{ #category : #'utilities - path - models' }
CMResourceLocator >> docPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'doc' directory.
	aModelClassName = <String>"
	
	^ (self modelPath: aModelClassName) / 'doc'.

]

{ #category : #'utilities - path - models' }
CMResourceLocator >> dumpPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'dump' directory.
	aModelClassName = <String>"
	
	^ (self modelPath: aModelClassName) / 'dumps'.

]

{ #category : #'utilities - path - global' }
CMResourceLocator >> imagesPath [
	" Answer a <FileReference> corresponding to the path of the current 'images' directory.
	aModelClassName = <String>"
	
	^ self assetsPath / 'images'.

]

{ #category : #'utilities - path - models' }
CMResourceLocator >> imagesPath: shortModelName [
	" Answer a <FileReference> corresponding to the path of the images directory of shortModelName.
	Argument: shortModelName = <String>	"
	
	^ (self modelPath: shortModelName) asFileReference / 'images'.

]

{ #category : #'utilities - path - models' }
CMResourceLocator >> inputsPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'inputs' directory.
	aModelClassName = <String>"
	
	^ (self modelPath: aModelClassName) / 'inputs'.

]

{ #category : #'utilities - path - global' }
CMResourceLocator >> mapsPath [
	" Answer a FileReference corresponding to the path of the current path directory.
	Argument: aModelClassName = <String>
	Example: 
		CMResourceLocator new mapsPath
	"
	^ self modelsPath asFileReference / 'maps'.

]

{ #category : #'utilities - path - models' }
CMResourceLocator >> mapsPath: shortModelName [
	" Answer a <FileReference> corresponding to the path of the maps directory of the current model.
	Argument: shortModelName = <String>
	Example: 
		CMResourceLocator new mapsPath: #FireModel >>> '/Users/.../cormas/assets/models/FireModel'
	"
	
	^ (self modelPath: shortModelName) asFileReference / 'maps'.

]

{ #category : #'utilities - path - models' }
CMResourceLocator >> modelNames [
	" Answer a <Collection> of <String> with receiver's available models "

	^ (self modelsPath entries collect: #basename)
		select: [ :name | name notEmpty and: [ name first ~= $. ] ]
]

{ #category : #'utilities - path - models' }
CMResourceLocator >> modelPath: shortModelName [
	" Answer a FileReference corresponding to the path of the current model directory.
	Argument: shortModelName = <String>
	Example: 
	CMResourceLocator new modelPath: #FireModel >>> 'File @ /Users/Bommel/Pharo/images/Pharo 8.0 - 64bit (stable)/pharo-local/iceberg/cormas/cormas/assets/models/FireModel'
	"
	
	^ self modelsPath / shortModelName asString.

]

{ #category : #'utilities - path - models' }
CMResourceLocator >> modelsPath [
	" Answer a <FileReference> corresponding to the path of 'Models' directory 
	Ex: File @ /Users/.../iceberg/cormas/cormas/assets/models"
	
	^ self assetNamed: 'models'.

]

{ #category : #'utilities - path - models' }
CMResourceLocator >> oldVersionsPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'old_versions' directory.
	aModelClassName = <String>"
	
	^ (self modelPath: aModelClassName) / 'old_versions'.

]

{ #category : #'utilities - path - models' }
CMResourceLocator >> outputsPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'outputs' directory.
	aModelClassName = <String>"
	
	^ (self modelPath: aModelClassName) / 'outputs'.

]

{ #category : #'utilities - csv' }
CMResourceLocator >> readCsv: filename [
	"
	HOW IT WORK ?  
	readMatrix: '/home/user/Documents/Quantif_atelier_general1.csv' sep: $,.
	
	Returns a collection of collections, each one containing the values of the each line (separator = $;).
The file name must be complete.
fileName = <String or Filename>
Ex: Cormas readCsv: 'D:\vw7.6\cormas\Models\Ecec\data\test.csv' "
	self deprecated: 'It use readMatrix with is not a matrix expected. 
	Its better to use readCSVFile'.
	^self
		readMatrix: filename
		sep: DataSaver_Asci separator
]

{ #category : #'utilities - csv' }
CMResourceLocator >> readCsvFile: file myModel: modelName [
	" Answer a collection of collections, each one containing the values of the csv file (separator is ';').
The file name is just a string containing the name of the file (with or without extension) that is stored in the /data directory of a model.
	Ex: 	CMResourceLocator new readCsvFile: 'palaya1973' myModel: 'Thunupa'    		
			or 
			CMResourceLocator new readCsvFile: 'palaya1973.cvs' myModel: 'Thunupa'           
	"
	
	| fileName |
	file asPath extension
		ifEmpty: [ fileName := file , '.csv' ]
		ifNotEmpty: [ fileName := file ].	
	^ self
		readMatrix: ((self inputsPath: modelName) / fileName) fullName
		sep: DataSaver_Asci separator
]

{ #category : #private }
CMResourceLocator >> readCsvLine: aLine [ 
	" Answer a <Collection> with elements from aLine converted into its matching Smalltalk 'type'. nil objects are added as nil "

	^ aLine collect: [ : elem | 
			elem
				ifNotNil: [ Cormas stringAsObjectType: elem ]
				ifNil: [ nil ] ].
]

{ #category : #'utilities - csv' }
CMResourceLocator >> readMatrix: fileName sep: aSepChar [
	"
	HOW IT WORK ?  
	readMatrix: '/home/user/Documents/Quantif_atelier_general1.csv' sep: $,.
	
	WHAT IS EXPECTED ?
	Returns a collection of collections (a Matrix), each one containing the values between the separator of the file.
	Example: file = 
		time;0;1;2;3;4;5;6;7;8;9;10;
		energy;50.0;48.1;47.5;46.5;46.2;44.2;44.4;44.9;45;46;	
	the Matrix = 
		OrderedCollection (	OrderedCollection ('time' 0 1 2 3 4 5 6 7 8 9 10) 
							OrderedCollection ('energy' 50.0 48.1 47.5 46.5 46.2 44.2 44.4 44.9 45 46)   )

The file name must be complete.
fileName = <String>
aSepChar = <Character> or <String>
Ex: Cormas readMatrix: 'D:\vw7.6\cormas\Models\Ecec\data\test.csv' sep: $;    or
Ex: Cormas readMatrix: 'D:\vw7.6\cormas\Models\Ecec\data\test.csv' sep: ';'   "

	|  arrayOfRows subCollection matrix nbColumns |

	arrayOfRows := (NeoCSVReader on: fileName asFileReference readStream)
		separator: aSepChar;
		upToEnd.
	nbColumns := (arrayOfRows at: 1) size.	
	matrix := OrderedCollection new.
	arrayOfRows do: [ :aLine | 
		subCollection := self readCsvLine: aLine.
		[ subCollection size < nbColumns ] " Check if all cells are occupied if not add nil"
			whileTrue: [ subCollection add: nil ].
		matrix add: subCollection ].
	^ matrix.
]

{ #category : #'utilities - path - models' }
CMResourceLocator >> videoPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'video' directory.
	aModelClassName = <String>"
	
	^ (self modelPath: aModelClassName) asFileReference / 'video'.

]

{ #category : #'utilities - path - global' }
CMResourceLocator >> workingDirectory [
	" Answer a <String> representing the current working directory "
	
	^ self class workingDirectory
]
