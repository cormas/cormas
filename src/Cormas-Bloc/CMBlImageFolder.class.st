"
I am the folder of a model's image files, as its views see it: I find the file of an image by its name, read it once, and keep the backgrounds drawn from it.

## Responsibility:

- Find the PNG or JPEG file whose name, without its extension, is the name of an image, and raise an error naming the image and the folder when no file, or more than one, has that name.
- Keep every file I read as a Cairo surface, so that a file is read and converted only the first time an image uses it.
- Give every element that shows the same image over the same color at the same size the same background, drawn once.

## Collaborators:

- Cell and agent elements ask me for the backgrounds of looks that have an image.
- `CMBlImageBackground` draws an image, with the surfaces I give it.
- `AeCairoImageSurface` reads PNG files; `ImageReadWriter` reads JPEG files.

## Public API and Key Messages

- `CMBlImageFolder ofModel: aModelClass`: the folder that every view of the model shares; `forgetModel:` drops it when a new view opens
- `CMBlImageFolder on: aDirectory`
- `backgroundOf:color:extent:scale:`
- `surfaceNamed: aString`

```
(CMBlImageFolder ofModel: CMMyModel)
	backgroundOf: (CMImage named: 'tall-grass')
	color: Color transparent
	extent: 32 @ 32
	scale: 1
```

## Internal Representation

- `folder`: a `FileReference` to a directory, which may not exist.
- `surfaces`: a `Dictionary` from names to the `AeCairoImageSurface`s read so far.
- `backgrounds`: a `Dictionary` from arrays of an image, a color, an extent and a scale to their `CMBlImageBackground`s.
- `folders`, on my class side: a `Dictionary` from model classes to their folders.

### Implementation Points

- I never read a file again. A new view of a model makes a new folder, so a modeller who edits an image sees the change in a newly opened view.
- Cairo reads a PNG file of 2000 by 2000 pixels in about 15 ms, where `ImageReadWriter` takes about 1 s, and converting a form of that size to a surface takes about 250 ms. So PNG files never become forms.
"
Class {
	#name : 'CMBlImageFolder',
	#superclass : 'Object',
	#instVars : [
		'folder',
		'surfaces',
		'backgrounds'
	],
	#classInstVars : [
		'folders'
	],
	#category : 'Cormas-Bloc',
	#package : 'Cormas-Bloc'
}

{ #category : 'accessing' }
CMBlImageFolder class >> forgetModel: aModelClass [
	"Read the images of aModelClass again the next time they are drawn, so that a new view shows the files as they are now"

	folders removeKey: aModelClass ifAbsent: [ ]
]

{ #category : 'class initialization' }
CMBlImageFolder class >> initialize [

	folders := Dictionary new
]

{ #category : 'accessing' }
CMBlImageFolder class >> ofModel: aModelClass [
	"Return the folder of the images of aModelClass that every view of it shares, until a new view opens"

	^ folders
		  at: aModelClass
		  ifAbsentPut: [ self on: aModelClass folder / 'images' ]
]

{ #category : 'instance creation' }
CMBlImageFolder class >> on: aDirectory [

	^ self new setFolder: aDirectory
]

{ #category : 'accessing' }
CMBlImageFolder >> backgroundOf: anImage color: aColor extent: aPoint scale: aNumber [
	"Return the background that shows anImage over aColor on an element of logical extent aPoint, with aNumber pixels per point. Every element that shows the same thing at the same size gets the same background, which is what makes images as fast as colors"

	^ backgrounds
		  at: {
				  anImage.
				  aColor.
				  aPoint.
				  aNumber }
		  ifAbsentPut: [
				  CMBlImageBackground
					  image: anImage
					  color: aColor
					  extent: aPoint
					  scale: aNumber
					  folder: self ]
]

{ #category : 'private' }
CMBlImageFolder >> fileNamed: aString [

	| files |
	files := self imageFiles select: [ :each |
		         each basenameWithoutExtension = aString ].
	files ifEmpty: [
			self error:
				'No image file is named ''' , aString , ''' in ' , folder fullName
				, '. Add ' , aString , '.png (or .jpg, .jpeg) to that folder' ].
	files size > 1 ifTrue: [
			self error:
				'Several image files are named ''' , aString , ''' in '
				, folder fullName , ': '
				, (', ' join: (files collect: [ :each | each basename ]))
				, '. Keep only one' ].
	^ files first
]

{ #category : 'private' }
CMBlImageFolder >> imageFiles [
	"A model that has no images yet may have no folder for them"

	folder exists ifFalse: [ ^ #(  ) ].
	^ folder files select: [ :each |
		  #( 'png' 'jpg' 'jpeg' ) includes: each extension asLowercase ]
]

{ #category : 'private' }
CMBlImageFolder >> read: aFile [
	"Cairo reads PNG files much faster than ImageReadWriter, but not JPEG files"

	^ aFile binaryReadStreamDo: [ :stream |
			  aFile extension asLowercase = 'png'
				  ifTrue: [ AeCairoImageSurface newFromPngOn: stream ]
				  ifFalse: [
						  AeCairoImageSurface fromForm:
							  ((ImageReadWriter formFromStream: stream) asFormOfDepth: 32) ] ]
]

{ #category : 'initialization' }
CMBlImageFolder >> setFolder: aDirectory [

	folder := aDirectory.
	surfaces := Dictionary new.
	backgrounds := Dictionary new
]

{ #category : 'accessing' }
CMBlImageFolder >> surfaceNamed: aString [
	"Return the Cairo surface of the file whose name, without its extension, is aString. The file is read only the first time"

	^ surfaces
		  at: aString
		  ifAbsentPut: [ self read: (self fileNamed: aString) ]
]
