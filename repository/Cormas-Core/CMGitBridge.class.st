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
CMGitBridge class >> imagesPath [
	" Answer a <FileReference> with the receiver's path to the images directory "

	^ self assetsPath / 'images'
]
