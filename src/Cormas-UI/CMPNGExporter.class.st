"
I export a Roassal canvas, such as a chart, to a PNG file cropped to its shapes and drawn at three times their size on screen, so that the picture has no empty space around it and stays sharp when it is printed or shown on a high-resolution display.

## Responsibility:

- I draw every shape of the canvas at three times its size, text and lines included.
- I crop the picture to the shapes, with a small margin.
- I paint the background of the canvas behind the shapes.
- I write the picture to a PNG file.

## Collaborators:

- `RSCanvas`: the canvas I draw.
- `RSAthensRenderer`: draws the shapes of the canvas at my scale.
- `AthensCairoSurface`: the picture I draw on and write to the file.

## Public API and Key Messages

- `canvas:` sets the canvas to export.
- `exportToFile:` writes the PNG file.

```
CMPNGExporter new
	canvas: aCanvas;
	exportToFile: 'chart.png' asFileReference
```

### Implementation Points

The camera is placed by `zoomToShapes` of `RSPNGExporter`, then the drawing is put over the background color, as the window of the canvas does on screen.
"
Class {
	#name : 'CMPNGExporter',
	#superclass : 'RSPNGExporter',
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'private' }
CMPNGExporter >> drawnShapes [
	"A surface with the shapes of the canvas drawn at my scale, on a transparent background"

	| surface renderer |
	surface := AthensCairoSurface extent:
		           self morph extent asIntegerPoint * self scale.
	renderer := RSAthensRenderer new.
	canvas invalidate.
	surface drawDuring: [ :athensCanvas |
			renderer
				surface: surface;
				canvas: athensCanvas;
				scale: self scale.
			canvas accept: renderer ].
	^ surface
]

{ #category : 'export' }
CMPNGExporter >> exportToFile: file [

	self removeIfNecessary: file.
	self morph.
	self cameraSetter set: [
			| shapes border picture |
			shapes := self drawnShapes.
			border := self margin * self scale.
			picture := AthensCairoSurface extent: shapes extent + (2 * border).
			picture drawDuring: [ :athensCanvas |
					athensCanvas
						setPaint: canvas color;
						drawShape: (0 @ 0 extent: picture extent).
					athensCanvas pathTransform translateBy: border @ border.
					athensCanvas
						setPaint: shapes;
						drawShape: (0 @ 0 extent: shapes extent) ].
			picture writeToPng: file pathString ]
]

{ #category : 'initialization' }
CMPNGExporter >> initialize [

	super initialize.
	self zoomToShapes
]

{ #category : 'accessing' }
CMPNGExporter >> margin [
	"The space left around the shapes, in pixels of the canvas on screen"

	^ 10
]

{ #category : 'accessing' }
CMPNGExporter >> scale [
	"The number of pixels of the picture for each pixel of the canvas on screen"

	^ 3
]
