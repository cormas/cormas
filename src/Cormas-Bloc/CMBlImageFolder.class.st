"
I am the folder of a model's image files, as a view sees it: I find the file of an image by its name, and read it once.

## Responsibility:

- Find the PNG or JPEG file whose name, without its extension, is the name of an image.
- Raise an error naming the image and the folder when no file, or more than one, has that name.
- Keep every file I read as a Cairo surface, so that a file is read and converted only the first time an image uses it.

## Collaborators:

- A space element creates me on its model's `images` folder, and asks me for the surfaces of the images it draws.
- `AeCairoImageSurface` reads PNG files; `ImageReadWriter` reads JPEG files.

## Public API and Key Messages

- `CMBlImageFolder on: aDirectory`
- `surfaceNamed: aString`

```
(CMBlImageFolder on: CMMyModel folder / 'images') surfaceNamed: 'tall-grass'
```

## Internal Representation

- `folder`: a `FileReference` to a directory, which may not exist.
- `surfaces`: a `Dictionary` from names to the `AeCairoImageSurface`s read so far.

### Implementation Points

- I never read a file again, so a modeller who edits an image sees the change in a newly opened view, which creates a new folder.
- Cairo reads a PNG file of 2000 by 2000 pixels in about 15 ms, where `ImageReadWriter` takes about 1 s, and converting a form of that size to a surface takes about 250 ms. So PNG files never become forms.
"
Class {
	#name : 'CMBlImageFolder',
	#superclass : 'Object',
	#instVars : [
		'folder',
		'surfaces'
	],
	#category : 'Cormas-Bloc',
	#package : 'Cormas-Bloc'
}

{ #category : 'instance creation' }
CMBlImageFolder class >> on: aDirectory [

	^ self new setFolder: aDirectory
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
	surfaces := Dictionary new
]

{ #category : 'accessing' }
CMBlImageFolder >> surfaceNamed: aString [
	"Return the Cairo surface of the file whose name, without its extension, is aString. The file is read only the first time"

	^ surfaces
		  at: aString
		  ifAbsentPut: [ self read: (self fileNamed: aString) ]
]
