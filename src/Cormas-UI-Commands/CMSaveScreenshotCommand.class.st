Class {
	#name : 'CMSaveScreenshotCommand',
	#superclass : 'CMSpacePresenterCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'action' }
CMSaveScreenshotCommand >> action [

	| file base64 |
	file := 'screenshot.png' asFileReference.

	"Temporarily save the canvas to PNG file only to read it, convert the image to Base 64 and delete the file"
	owner saveToPngFile: file.
	
	base64 := (file binaryReadStreamDo: #contents) base64Encoded.
	file delete.
	
	self generateScreenshotMethodWith: base64
]

{ #category : 'as yet unclassified' }
CMSaveScreenshotCommand >> generateScreenshotMethodWith: aBase64String [

	| modelClass method |
	modelClass := owner cormasModel class.
	
	method := modelClass compiler compile: ('screenshotContents
	"Screenshot of model''s spatial grid provided as a string in Base 64 encoding"
	^ ''', aBase64String, '''').
	
	method protocol: 'screenshot'.

	modelClass class
		addSelector: #screenshotContents
		withMethod: method.
]

{ #category : 'accessing' }
CMSaveScreenshotCommand >> icon [

	^ self iconNamed: #smallScreenshot 
]

{ #category : 'accessing' }
CMSaveScreenshotCommand >> name [

	^ 'Screenshot'
]
