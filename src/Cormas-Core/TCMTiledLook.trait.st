"
I let a look show a picture instead of its color: a tile, with smaller tiles laid over it. I hold only the names of the tiles, so a model that uses me does not depend on any UI package.

## Responsibility:

- Hold the name of the tile to draw, and the names and scales of the tiles laid over it, in order.
- Forget them when the look is reset.

## Collaborators:

- `CMCellLook` and `CMAgentLook` use me.
- A renderer finds each tile by its name in the tilesets, composes the picture and draws it.

## Public API and Key Messages

- `tile:`, `tile`, `hasTile`
- `overlayTile:scaledTo:`, `overlays`

```
aspectImage: look
	<aspect>
	look tile: #grassLight.
	self isForest ifTrue: [ look overlayTile: #tree scaledTo: 0.7 ]
```

## Internal Representation

- `tile`: a `Symbol` naming a tile, or nil when the color is drawn instead.
- `overlays`: an `Array` of associations from the name of a tile to its scale, a fraction of the tile below. Empty most of the time, and replaced rather than changed, so that a look without overlays creates nothing.
"
Trait {
	#name : 'TCMTiledLook',
	#instVars : [
		'tile',
		'overlays'
	],
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'accessing' }
TCMTiledLook >> hasTile [

	^ tile isNotNil
]

{ #category : 'accessing' }
TCMTiledLook >> overlayTile: aSymbol scaledTo: aNumber [
	"Lay the tile named aSymbol over the tiles already set, scaled to aNumber, a fraction of their size"

	overlays := overlays copyWith: aSymbol -> aNumber
]

{ #category : 'accessing' }
TCMTiledLook >> overlays [

	^ overlays
]

{ #category : 'initialization' }
TCMTiledLook >> resetTile [

	tile := nil.
	overlays := #(  )
]

{ #category : 'accessing' }
TCMTiledLook >> tile [

	^ tile
]

{ #category : 'accessing' }
TCMTiledLook >> tile: aSymbol [
	"Draw the tile named aSymbol instead of the color"

	tile := aSymbol
]
