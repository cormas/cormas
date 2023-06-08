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
	#name : #CMGitBridge,
	#superclass : #GitBridge,
	#category : #'Cormas-Core-Kernel'
}

{ #category : #public }
CMGitBridge class >> assetsFilesDirectoryName [
	" Answe a <String> with the name of the directoy where CORMAS resources are found "

	^ 'assets'
]

{ #category : #public }
CMGitBridge class >> assetsPath [
	"Return the assets path of Cormas
	Ex: {localDirectory}/iceberg/cormas/cormas/assets"

	^ ([ self root ]
		on: GBError
		do: [ :ex | FileLocator workingDirectory ]) / self assetsFilesDirectoryName

]

{ #category : #accessing }
CMGitBridge class >> cormasHomeProjects [

	^ (FileLocator home / 'CORMAS') allChildrenMatching: CMApplicationProject applicationExtension.
]

{ #category : #accessing }
CMGitBridge class >> cormasUserProjects [
	" Answer a <Collection> of <FileReference> each one representing a user defined project in the CORMAS directory for projects "

	^ self userProjectsPath allChildrenMatching: '*' , CMApplicationProject applicationExtension.
]

{ #category : #accessing }
CMGitBridge class >> demosPath [
	" Answer a <FileReference> with the receiver's path to the demos directory.
	For ex: aFileReference on: /Users/<username>/CORMAS/demos "

	^ CMApplicationProject baseDirectory / 'demos'
]

{ #category : #accessing }
CMGitBridge class >> imagesPath [
	" Answer a <FileReference> with the receiver's path to the images directory "

	^ self assetsPath / 'images'
]

{ #category : #'class initialization' }
CMGitBridge class >> initialize [
	SessionManager default registerSystemClassNamed: self name
]

{ #category : #accessing }
CMGitBridge class >> preferencesPath [
	" Answer a <FileReference> with the receiver's path to the preferences directory "

	^ CMApplicationProject baseDirectory / 'preferences'
]

{ #category : #accessing }
CMGitBridge class >> resourceDirectoryNames [
	" Answer a <Collection> of <String> representing each a subdirectory of a CORMAS project "
	| locator |
	
	locator := self new.
	^ self resourceSelectors collect: [ : selector | (locator perform: selector with: String empty) basename ]
]

{ #category : #accessing }
CMGitBridge class >> resourceSelectors [

	^ (self organization listAtCategoryNamed: 'utilities - path - models') 
		select: [ : selector | selector isKeyword and: [ selector ~= #modelPath: ] ]
]

{ #category : #accessing }
CMGitBridge class >> userProjectsPath [
	" Answer a <FileReference> with the receiver's path to the user projects directory "

	^ CMApplicationProject baseDirectory / 'projects'
]

{ #category : #public }
CMGitBridge class >> workingDirectory [
	" Answer a <String> with the default directory "
	
	^ FileSystem disk workingDirectory fullName
]

{ #category : #'utilities - path - global' }
CMGitBridge >> addOnsPath [
	" Answer a <FileReference> corresponding to the path of 'Add-ons' directory "
	
	^ self cormasPath / 'Add-ons'.


]

{ #category : #'utilities - path - models' }
CMGitBridge >> animationsPath: shortModelName [
	" Answer a <FileReference> corresponding to the path of stored Animations directory. "

	^ (self modelPath: shortModelName) asFileReference / 'animations'.
]

{ #category : #'utilities - csv' }
CMGitBridge >> assetNamed: aFilename [
	" Answer a <FileReference> found at the assets location, where aFilename is a <String>
	example: CMResourceLocator new assetNamed: 'models'
	"
	
	^ self assetsPath / aFilename

]

{ #category : #'utilities - path - global' }
CMGitBridge >> assetsFilesDirectoryName [
	" Answe a <String> with the name of the directoy where CORMAS resources are found "

	^ self class assetsFilesDirectoryName
]

{ #category : #'utilities - path - global' }
CMGitBridge >> assetsPath [
	" Answer a <FileReference> specifying a directory where CORMAS assets are found.
	Ex: /Users/Bommel/Pharo/images/Pharo 8.0 - 64bit (stable)/pharo-local/iceberg/cormas/cormas/assets"

	^ self class assetsPath asFileReference
]

{ #category : #'utilities - path - global' }
CMGitBridge >> cormasPath [
	" Answer a <FileReference> corresponding to the path of Cormas directory. "

	^ self workingDirectory asFileReference

]

{ #category : #'utilities - path - models' }
CMGitBridge >> diagramsPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'dump' directory.
	aModelClassName = <String>"
	
	^ (self modelPath: aModelClassName) / 'diagrams'.

]

{ #category : #'utilities - path - models' }
CMGitBridge >> docPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'doc' directory.
	aModelClassName = <String>"
	
	^ (self modelPath: aModelClassName) / 'doc'.

]

{ #category : #'utilities - path - models' }
CMGitBridge >> dumpPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'dump' directory.
	aModelClassName = <String>"
	
	^ (self modelPath: aModelClassName) / 'dumps'.

]

{ #category : #'utilities - path - global' }
CMGitBridge >> imagesPath [
	" Answer a <FileReference> corresponding to the path of the current 'images' directory.
	aModelClassName = <String>"
	
	^ self assetsPath / 'images'.

]

{ #category : #'utilities - path - models' }
CMGitBridge >> imagesPath: shortModelName [
	" Answer a <FileReference> corresponding to the path of the images directory of shortModelName.
	Argument: shortModelName = <String>	"
	
	^ (self modelPath: shortModelName) asFileReference / 'images'.

]

{ #category : #'utilities - path - models' }
CMGitBridge >> inputsPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'inputs' directory.
	aModelClassName = <String>"
	
	^ (self modelPath: aModelClassName) / 'inputs'.

]

{ #category : #'utilities - path - global' }
CMGitBridge >> mapsPath [
	" Answer a FileReference corresponding to the path of the current path directory.
	Argument: aModelClassName = <String>
	Example: 
		CMResourceLocator new mapsPath
	"
	^ self modelsPath asFileReference / 'maps'.

]

{ #category : #'utilities - path - models' }
CMGitBridge >> mapsPath: shortModelName [
	" Answer a <FileReference> corresponding to the path of the maps directory of the current model.
	Argument: shortModelName = <String>
	Example: 
		CMResourceLocator new mapsPath: #FireModel >>> '/Users/.../cormas/assets/models/FireModel'
	"
	
	^ (self modelPath: shortModelName) asFileReference / 'maps'.

]

{ #category : #'utilities - path - models' }
CMGitBridge >> modelNames [
	" Answer a <Collection> of <String> with receiver's available models "

	^ (self modelsPath entries collect: #basename)
		select: [ :name | name notEmpty and: [ name first ~= $. ] ]
]

{ #category : #'utilities - path - models' }
CMGitBridge >> modelPath: shortModelName [
	" Answer a FileReference corresponding to the path of the current model directory.
	Argument: shortModelName = <String>
	Example: 
	CMResourceLocator new modelPath: #FireModel >>> 'File @ /Users/Bommel/Pharo/images/Pharo 8.0 - 64bit (stable)/pharo-local/iceberg/cormas/cormas/assets/models/FireModel'
	"
	
	^ self modelsPath / shortModelName asString.

]

{ #category : #'utilities - path - models' }
CMGitBridge >> modelsPath [
	" Answer a <FileReference> corresponding to the path of 'Models' directory 
	Ex: File @ /Users/.../iceberg/cormas/cormas/assets/models"
	
	^ self assetNamed: 'models'.

]

{ #category : #'utilities - path - models' }
CMGitBridge >> oldVersionsPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'old_versions' directory.
	aModelClassName = <String>"
	
	^ (self modelPath: aModelClassName) / 'old_versions'.

]

{ #category : #'utilities - path - models' }
CMGitBridge >> outputsPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'outputs' directory.
	aModelClassName = <String>"
	
	^ (self modelPath: aModelClassName) / 'outputs'.

]

{ #category : #'utilities - csv' }
CMGitBridge >> readCsv: filename [
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
		sep: Cormas separator
]

{ #category : #'utilities - csv' }
CMGitBridge >> readCsvFile: file myModel: modelName [
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
		sep: Cormas separator
]

{ #category : #private }
CMGitBridge >> readCsvLine: aLine [ 
	" Answer a <Collection> with elements from aLine converted into its matching Smalltalk 'type'. nil objects are added as nil "

	^ aLine collect: [ : elem | 
			elem
				ifNotNil: [ Cormas stringAsObjectType: elem ]
				ifNil: [ nil ] ].
]

{ #category : #'utilities - csv' }
CMGitBridge >> readMatrix: fileName sep: aSepChar [
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
CMGitBridge >> videoPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'video' directory.
	aModelClassName = <String>"
	
	^ (self modelPath: aModelClassName) asFileReference / 'video'.

]

{ #category : #'utilities - path - global' }
CMGitBridge >> workingDirectory [
	" Answer a <String> representing the current working directory "
	
	^ self class workingDirectory
]
