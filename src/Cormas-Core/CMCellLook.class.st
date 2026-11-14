"
I describe how a cell appears in a view: its color or a picture, and its border.

## Responsibility:

- Hold the color of the cell, or the tiles to draw instead.
- Start with a grey cell and a light border, so that a grid is drawn even when its model defines no aspect.

## Collaborators:

- An aspect of a cell fills me.
- `TCMTiledLook` gives me the tiles.
- A renderer draws me, and turns tile names into a picture.

## Public API and Key Messages

- `color:`
- `tile:`, `overlayTile:scaledTo:`, `hasTile`
- `borderColor:`, `borderThickness:`

```
aspectRocky: look
	<aspect>
	look tile: #rocks
```
"
Class {
	#name : 'CMCellLook',
	#superclass : 'CMAreaLook',
	#traits : 'TCMTiledLook',
	#classTraits : 'TCMTiledLook classTrait',
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'initialization' }
CMCellLook >> reset [

	super reset.
	self resetTile
]
