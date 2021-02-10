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
	#category : #'Cormas-Core-Interface'
}

{ #category : #public }
CMResourceLocator class >> assetsPath [
	^ ([ self root ]
		on: GBError
		do: [ :ex | FileLocator workingDirectory ]) / 'assets'
]

{ #category : #'class initialization' }
CMResourceLocator class >> initialize [
	SessionManager default registerSystemClassNamed: self name
]

{ #category : #public }
CMResourceLocator class >> workingDirectory [
	" Answer a <String> with the default directory "
	
	^ FileSystem disk workingDirectory fullName
]

{ #category : #'utilities - path' }
CMResourceLocator >> addOnsPath [
	" Answer a <FileReference> corresponding to the path of 'Add-ons' directory "
	
	^ (self cormasPath / 'Add-ons') ensureCreateDirectory.


]

{ #category : #'utilities - csv' }
CMResourceLocator >> assetNamed: aFilename [
	" Answer a <FileReference> found at the assets location "
	
	^ self assetsPath / aFilename

]

{ #category : #'utilities - path' }
CMResourceLocator >> assetsFilesDirectoryName [
	" Answe a <String> with the name of the directoy where CORMAS resources are found "

	^ 'assets'
]

{ #category : #'utilities - path' }
CMResourceLocator >> assetsPath [
	" Answer a <FileReference> specifying a directory where CORRMAS assets are found "

	^ self class assetsPath asFileReference
]

{ #category : #'utilities - path' }
CMResourceLocator >> cormasPath [
	" Answer a <FileReference> corresponding to the path of Cormas directory. "

	^ self workingDirectory asFileReference

]

{ #category : #'utilities - path - models' }
CMResourceLocator >> dataPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'data' directory.
	aModelClassName = <String>"
	
	^ ((self modelPath: aModelClassName) / 'data') ensureCreateDirectory.

]

{ #category : #'utilities - path - models' }
CMResourceLocator >> dumpPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'dump' directory.
	aModelClassName = <String>"
	
	^ ((self modelPath: aModelClassName) / 'dump') ensureCreateDirectory.

]

{ #category : #'utilities - path' }
CMResourceLocator >> imagesPath [
	" Answer a <FileReference> corresponding to the path of the current 'images' directory.
	aModelClassName = <String>"
	
	^ (self assetsPath / 'images') ensureCreateDirectory.

]

{ #category : #'utilities - path - models' }
CMResourceLocator >> mapsPath [
	" Answer a FileReference corresponding to the path of the current path directory.
	Argument: aModelClassName = <String>
	Example: 
		CMResourceLocator new mapsPath
	"
	^ (self modelsPath asFileReference / 'maps') ensureCreateDirectory.

]

{ #category : #'utilities - path - models' }
CMResourceLocator >> mapsPath: aModelClassName [
	" Answer a FileReference corresponding to the path of the current path directory.
	Argument: aModelClassName = <String>
	Example: 
		CMResourceLocator new mapsPath: #FireModel
	"
	
	^ ((self modelPath: aModelClassName) asFileReference / 'maps') ensureCreateDirectory.

]

{ #category : #'utilities - path - models' }
CMResourceLocator >> modelNames [
	" Answer a <Collection> of <String> with receiver's available models "

	^ (self modelsPath entries collect: #basename)
		select: [ :name | name notEmpty and: [ name first ~= $. ] ]
]

{ #category : #'utilities - path - models' }
CMResourceLocator >> modelPath: aModelClassName [
	" Answer a FileReference corresponding to the path of the current model directory.
	Argument: aModelClassName = <String>
	Example: 
	CMResourceLocator new modelPath: #FireModel
	"
	
	^ (self modelsPath / aModelClassName asString) ensureCreateDirectory.

]

{ #category : #'utilities - path - models' }
CMResourceLocator >> modelsPath [
	" Answer a <FileReference> corresponding to the path of 'Models' directory "
	
	^ (self assetNamed: 'models') ensureCreateDirectory.

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
		readMatrix: ((self dataPath: modelName) / fileName) fullName
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
	
	^ ((self modelPath: aModelClassName) asFileReference / 'video') ensureCreateDirectory.

]

{ #category : #'utilities - path' }
CMResourceLocator >> workingDirectory [
	" Answer a <String> representing the current working directory "
	
	^ self class workingDirectory
]

{ #category : #'utilities - path - models' }
CMResourceLocator >> xmlPath: aModelClassName [
	" Answer a <FileReference> corresponding to the path of the current model 'xml' directory.
	aModelClassName = <String>"
	
	^ ((self modelPath: aModelClassName) asFileReference / 'xml') ensureCreateDirectory.

]
