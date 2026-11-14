"
I describe how a cell appears in a view: its color or a picture, and its border.

## Responsibility:

- Hold the color of the cell, or the name of a tile to draw instead.
- Start with a grey cell and a light border, so that a grid is drawn even when its model defines no aspect.

## Collaborators:

- An aspect of a cell fills me.
- A renderer draws me, and turns a tile name into a picture.

## Public API and Key Messages

- `color:`, `tile:`, `hasTile`
- `borderColor:`, `borderThickness:`

```
aspectRocky: look
	<aspect>
	look tile: #rocks
```

## Internal Representation

- `tile`: a `Symbol` naming a tile, or nil when the cell is drawn with its color.
"
Class {
	#name : 'CMCellLook',
	#superclass : 'CMAreaLook',
	#instVars : [
		'tile'
	],
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'accessing' }
CMCellLook >> hasTile [

	^ tile isNotNil
]

{ #category : 'initialization' }
CMCellLook >> reset [

	super reset.
	tile := nil
]

{ #category : 'accessing' }
CMCellLook >> tile [

	^ tile
]

{ #category : 'accessing' }
CMCellLook >> tile: aSymbol [
	"Draw the tile named aSymbol instead of the color"

	tile := aSymbol
]
