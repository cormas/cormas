"
I am a mock model whose folder is given by the test that uses me, usually in a memory file system, so that tests can draw images without a workspace or files on disk.
"
Class {
	#name : 'CMBlImageTestModel',
	#superclass : 'CMMockModel',
	#classInstVars : [
		'testFolder'
	],
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'accessing' }
CMBlImageTestModel class >> folder [

	^ testFolder
]

{ #category : 'accessing' }
CMBlImageTestModel class >> folder: aDirectory [

	testFolder := aDirectory
]
