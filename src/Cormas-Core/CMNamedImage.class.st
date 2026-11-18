"
I am an image that one file of the model shows. My name is the name of the file without its extension, so `CMImage named: 'tall-grass'` shows `tall-grass.png`.

## Responsibility:

- Know the name of my file.
- Be equal to another image with the same name, size, shift and tint.

## Collaborators:

- `CMImage` creates me with `named:`, and holds what I share with every image.
- A renderer finds my file in the model's `images` folder.

## Public API and Key Messages

- `CMImage named: 'tree'`
- `name`

```
(CMImage named: 'tree') size: 0.5
```

## Internal Representation

- `name`: a `String`, the name of my file without its extension.
"
Class {
	#name : 'CMNamedImage',
	#superclass : 'CMImage',
	#instVars : [
		'name'
	],
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'comparing' }
CMNamedImage >> = anObject [

	^ super = anObject and: [ name = anObject name ]
]

{ #category : 'comparing' }
CMNamedImage >> hash [

	^ super hash bitXor: name hash
]

{ #category : 'accessing' }
CMNamedImage >> name [

	^ name
]

{ #category : 'accessing' }
CMNamedImage >> setName: aString [

	name := aString
]
