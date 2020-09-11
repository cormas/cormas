"
DrawingEditor is the ApplicationModel for a Drawing.

Instance Variables:
	buttons	<SelectionInList of: ButtonDescription>	the selection in list of all our tools
	drawing	<Drawing>	our drawing


"
Class {
	#name : #DrawingEditor,
	#superclass : #UIApplicationModel,
	#instVars : [
		'buttons',
		'drawing'
	],
	#category : 'Cormas-Core-HotDraw'
}

{ #category : #resources }
DrawingEditor class >> arcIcon [
	
	^OpaqueImage
		figure: self arcIconImage
		shape: self arcIconMask
]

{ #category : #resources }
DrawingEditor class >> arcIconImage [
	"UIMaskEditor new openOnClass: self andSelector: #arcIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[255 254 0 0 255 254 0 0 255 254 0 0 255 254 0 0 248 126 0 0 231 158 0 0 223 190 0 0 223 126 0 0 190 254 0 0 190 254 0 0 223 126 0 0 223 190 0 0 231 158 0 0 248 126 0 0 255 254 0 0 255 254 0 0 255 254 0 0 255 254 0 0])
]

{ #category : #resources }
DrawingEditor class >> arcIconMask [
	"UIMaskEditor new openOnClass: self andSelector: #arcIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 128 0 0 31 224 0 0 63 192 0 0 63 128 0 0 127 0 0 0 127 0 0 0 63 128 0 0 63 192 0 0 31 224 0 0 7 128 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0])
]

{ #category : #resources }
DrawingEditor class >> bezierIcon [
	
	^OpaqueImage
		figure: self bezierIconImage
		shape: self bezierIconMask
]

{ #category : #resources }
DrawingEditor class >> bezierIconImage [
	"UIMaskEditor new openOnClass: self andSelector: #bezierIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[255 254 0 0 255 254 0 0 255 242 0 0 255 242 0 0 255 242 0 0 255 230 0 0 255 206 0 0 255 30 0 0 252 126 0 0 241 254 0 0 231 254 0 0 207 254 0 0 159 254 0 0 159 254 0 0 159 254 0 0 255 254 0 0 255 254 0 0 255 254 0 0])
]

{ #category : #resources }
DrawingEditor class >> bezierIconMask [
	"UIMaskEditor new openOnClass: self andSelector: #bezierIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 12 0 0 0 12 0 0 0 12 0 0 0 24 0 0 0 48 0 0 0 224 0 0 3 128 0 0 14 0 0 0 24 0 0 0 48 0 0 0 96 0 0 0 96 0 0 0 96 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0])
]

{ #category : #resources }
DrawingEditor class >> bringToFrontIcon [
	
	^OpaqueImage
		figure: self bringToFrontIconImage
		shape: self bringToFrontIconMask
]

{ #category : #resources }
DrawingEditor class >> bringToFrontIconImage [
	"UIMaskEditor new openOnClass: self andSelector: #bringToFrontIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[255 254 0 0 128 126 0 0 191 126 0 0 187 126 0 0 179 126 0 0 160 62 0 0 128 30 0 0 160 14 0 0 179 6 0 0 187 70 0 0 191 102 0 0 191 102 0 0 191 102 0 0 191 78 0 0 191 62 0 0 128 126 0 0 255 254 0 0 255 254 0 0])
]

{ #category : #resources }
DrawingEditor class >> bringToFrontIconMask [
	"UIMaskEditor new openOnClass: self andSelector: #bringToFrontIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 128 0 0 127 192 0 0 127 224 0 0 127 240 0 0 127 248 0 0 127 184 0 0 127 152 0 0 127 152 0 0 127 152 0 0 127 176 0 0 127 192 0 0 127 128 0 0 0 0 0 0 0 0 0 0])
]

{ #category : #resources }
DrawingEditor class >> deleteIcon [
	
	^OpaqueImage
		figure: self deleteIconImage
		shape: self deleteIconMask
]

{ #category : #resources }
DrawingEditor class >> deleteIconImage [
	"UIMaskEditor new openOnClass: self andSelector: #deleteIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[255 254 0 0 255 190 0 0 255 94 0 0 254 238 0 0 253 246 0 0 251 250 0 0 247 242 0 0 239 234 0 0 223 218 0 0 191 182 0 0 127 110 0 0 62 222 0 0 93 190 0 0 107 126 0 0 182 254 0 0 213 254 0 0 227 254 0 0 247 254 0 0])
]

{ #category : #resources }
DrawingEditor class >> deleteIconMask [
	"UIMaskEditor new openOnClass: self andSelector: #deleteIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 64 0 0 0 224 0 0 1 240 0 0 3 248 0 0 7 252 0 0 15 252 0 0 31 252 0 0 63 252 0 0 127 248 0 0 255 240 0 0 255 224 0 0 255 192 0 0 255 128 0 0 127 0 0 0 62 0 0 0 28 0 0 0 8 0 0 0])
]

{ #category : #resources }
DrawingEditor class >> ellipseIcon [
	
	^OpaqueImage
		figure: self ellipseIconImage
		shape: self ellipseIconMask
]

{ #category : #resources }
DrawingEditor class >> ellipseIconImage [
	"UIMaskEditor new openOnClass: self andSelector: #ellipseIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[255 254 0 0 255 254 0 0 255 254 0 0 255 254 0 0 248 126 0 0 231 158 0 0 223 238 0 0 223 238 0 0 191 246 0 0 191 246 0 0 223 238 0 0 223 238 0 0 231 158 0 0 248 126 0 0 255 254 0 0 255 254 0 0 255 254 0 0 255 254 0 0])
]

{ #category : #resources }
DrawingEditor class >> ellipseIconMask [
	"UIMaskEditor new openOnClass: self andSelector: #ellipseIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 128 0 0 31 224 0 0 63 240 0 0 63 240 0 0 127 248 0 0 127 248 0 0 63 240 0 0 63 240 0 0 31 224 0 0 7 128 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0])
]

{ #category : #examples }
DrawingEditor class >> example1 [
	"Open a drawing editor with another drawing inside."
	"self example1"
	
	| editor |
	editor := self new.
	editor open.
	editor drawing
		add:
			(ViewAdapterFigure
				view:
					(DrawingEditor new allButOpenInterface: #windowSpec) window component
				in: (10 @ 10 corner: 450 @ 350))
]

{ #category : #examples }
DrawingEditor class >> example2 [
	"Open a drawing editor with a browser inside."
	"self example2"
	
	| editor |
	editor := self new.
	editor open.
	editor drawing
		add:
			(ViewAdapterFigure
				view:
					(FileBrowser new allButOpenInterface: #windowSpec) window component
				in: (10 @ 10 corner: 450 @ 350))
]

{ #category : #resources }
DrawingEditor class >> handIcon [
	
	^OpaqueImage
		figure: self handIconImage
		shape: self handIconMask
]

{ #category : #resources }
DrawingEditor class >> handIconImage [
	"UIMaskEditor new openOnClass: self andSelector: #handIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[254 127 0 0 229 143 0 0 217 183 0 0 217 181 0 0 237 178 0 0 237 182 0 0 151 246 0 0 103 254 0 0 119 253 0 0 191 253 0 0 223 253 0 0 239 251 0 0 239 251 0 0 247 247 0 0 251 247 0 0 248 7 0 0])
]

{ #category : #resources }
DrawingEditor class >> handIconMask [
	"UIMaskEditor new openOnClass: self andSelector: #handIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[1 128 0 0 27 240 0 0 63 248 0 0 63 250 0 0 31 255 0 0 31 255 0 0 111 255 0 0 255 255 0 0 255 254 0 0 127 254 0 0 63 254 0 0 31 252 0 0 31 252 0 0 15 248 0 0 7 248 0 0 7 248 0 0])
]

{ #category : #resources }
DrawingEditor class >> imageIcon [
	
	^OpaqueImage
		figure: self imageIconImage
		shape: self imageIconMask
]

{ #category : #resources }
DrawingEditor class >> imageIconImage [
	"UIMaskEditor new openOnClass: self andSelector: #imageIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[255 254 0 0 255 254 0 0 255 254 0 0 255 254 0 0 143 226 0 0 191 250 0 0 191 250 0 0 255 254 0 0 255 254 0 0 255 254 0 0 255 254 0 0 191 250 0 0 191 250 0 0 143 226 0 0 255 254 0 0 255 254 0 0 255 254 0 0 255 254 0 0])
]

{ #category : #resources }
DrawingEditor class >> imageIconMask [
	"UIMaskEditor new openOnClass: self andSelector: #imageIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 112 28 0 0 64 4 0 0 64 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 64 4 0 0 64 4 0 0 112 28 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0])
]

{ #category : #'interface opening' }
DrawingEditor class >> openOnDrawing: aDrawing [
	
	| editor |
	editor := self new.
	editor drawing: aDrawing.
	editor open
]

{ #category : #resources }
DrawingEditor class >> polylineIcon [
	
	^OpaqueImage
		figure: self polylineIconImage
		shape: self polylineIconMask
]

{ #category : #resources }
DrawingEditor class >> polylineIconImage [
	"UIMaskEditor new openOnClass: self andSelector: #polylineIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[255 254 0 0 255 126 0 0 254 62 0 0 252 158 0 0 249 206 0 0 243 230 0 0 231 206 0 0 207 158 0 0 159 62 0 0 199 126 0 0 241 254 0 0 252 126 0 0 255 30 0 0 255 198 0 0 255 206 0 0 255 158 0 0 255 62 0 0 255 254 0 0])
]

{ #category : #resources }
DrawingEditor class >> polylineIconMask [
	"UIMaskEditor new openOnClass: self andSelector: #polylineIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 128 0 0 1 192 0 0 3 96 0 0 6 48 0 0 12 24 0 0 24 48 0 0 48 96 0 0 96 192 0 0 56 128 0 0 14 0 0 0 3 128 0 0 0 224 0 0 0 56 0 0 0 48 0 0 0 96 0 0 0 192 0 0 0 0 0 0])
]

{ #category : #resources }
DrawingEditor class >> rectangleIcon [
	
	^OpaqueImage
		figure: self rectangleIconImage
		shape: self rectangleIconMask
]

{ #category : #resources }
DrawingEditor class >> rectangleIconImage [
	"UIMaskEditor new openOnClass: self andSelector: #rectangleIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[255 254 0 0 255 254 0 0 255 254 0 0 255 254 0 0 128 2 0 0 191 250 0 0 191 250 0 0 191 250 0 0 191 250 0 0 191 250 0 0 191 250 0 0 191 250 0 0 191 250 0 0 128 2 0 0 255 254 0 0 255 254 0 0 255 254 0 0 255 254 0 0])
]

{ #category : #resources }
DrawingEditor class >> rectangleIconMask [
	"UIMaskEditor new openOnClass: self andSelector: #rectangleIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 252 0 0 127 252 0 0 127 252 0 0 127 252 0 0 127 252 0 0 127 252 0 0 127 252 0 0 127 252 0 0 127 252 0 0 127 252 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0])
]

{ #category : #resources }
DrawingEditor class >> roundedRectangleIcon [
	
	^OpaqueImage
		figure: self roundedRectangleIconImage
		shape: self roundedRectangleIconMask
]

{ #category : #resources }
DrawingEditor class >> roundedRectangleIconImage [
	"UIMaskEditor new openOnClass: self andSelector: #roundedRectangleIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[255 254 0 0 255 254 0 0 255 254 0 0 255 254 0 0 240 30 0 0 207 230 0 0 223 246 0 0 191 250 0 0 191 250 0 0 191 250 0 0 191 250 0 0 223 246 0 0 207 230 0 0 240 30 0 0 255 254 0 0 255 254 0 0 255 254 0 0 255 254 0 0])
]

{ #category : #resources }
DrawingEditor class >> roundedRectangleIconMask [
	"UIMaskEditor new openOnClass: self andSelector: #roundedRectangleIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 15 224 0 0 63 248 0 0 63 248 0 0 127 252 0 0 127 252 0 0 127 252 0 0 127 252 0 0 63 248 0 0 63 248 0 0 15 224 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0])
]

{ #category : #resources }
DrawingEditor class >> selectionIcon [
	
	^OpaqueImage
		figure: self selectionIconImage
		shape: self selectionIconMask
]

{ #category : #resources }
DrawingEditor class >> selectionIconImage [
	"UIMaskEditor new openOnClass: self andSelector: #selectionIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[255 254 0 0 239 254 0 0 231 254 0 0 235 254 0 0 237 254 0 0 238 254 0 0 239 126 0 0 239 190 0 0 239 222 0 0 239 14 0 0 237 126 0 0 233 190 0 0 230 190 0 0 238 222 0 0 255 94 0 0 255 62 0 0 255 254 0 0 255 254 0 0])
]

{ #category : #resources }
DrawingEditor class >> selectionIconMask [
	"UIMaskEditor new openOnClass: self andSelector: #selectionIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 16 0 0 0 24 0 0 0 28 0 0 0 30 0 0 0 31 0 0 0 31 128 0 0 31 192 0 0 31 224 0 0 31 240 0 0 31 128 0 0 31 192 0 0 25 192 0 0 17 224 0 0 0 224 0 0 0 192 0 0 0 0 0 0 0 0 0 0])
]

{ #category : #resources }
DrawingEditor class >> sendToBackIcon [
	
	^OpaqueImage
		figure: self sendToBackIconImage
		shape: self sendToBackIconMask
]

{ #category : #resources }
DrawingEditor class >> sendToBackIconImage [
	"UIMaskEditor new openOnClass: self andSelector: #sendToBackImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[255 254 0 0 128 126 0 0 191 126 0 0 184 62 0 0 184 14 0 0 184 6 0 0 191 98 0 0 191 112 0 0 191 120 0 0 191 104 0 0 191 72 0 0 191 0 0 0 191 2 0 0 191 78 0 0 191 110 0 0 128 126 0 0 255 254 0 0 255 254 0 0])
]

{ #category : #resources }
DrawingEditor class >> sendToBackIconMask [
	"UIMaskEditor new openOnClass: self andSelector: #sendToBackIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 127 128 0 0 127 128 0 0 127 192 0 0 127 240 0 0 127 248 0 0 127 156 0 0 127 142 0 0 127 134 0 0 127 150 0 0 127 182 0 0 127 254 0 0 127 252 0 0 127 176 0 0 127 144 0 0 127 128 0 0 0 0 0 0 0 0 0 0])
]

{ #category : #resources }
DrawingEditor class >> splineIcon [
	
	^OpaqueImage
		figure: self splineIconImage
		shape: self splineIconMask
]

{ #category : #resources }
DrawingEditor class >> splineIconImage [
	"UIMaskEditor new openOnClass: self andSelector: #splineIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[255 254 0 0 255 254 0 0 255 254 0 0 255 254 0 0 193 254 0 0 128 254 0 0 28 118 0 0 62 102 0 0 62 78 0 0 62 30 0 0 28 62 0 0 128 254 0 0 193 254 0 0 243 254 0 0 231 254 0 0 207 254 0 0 159 254 0 0 255 254 0 0])
]

{ #category : #resources }
DrawingEditor class >> splineIconMask [
	"UIMaskEditor new openOnClass: self andSelector: #splineIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 15 @ 18
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 62 0 0 0 127 0 0 0 227 136 0 0 193 152 0 0 193 176 0 0 193 224 0 0 227 192 0 0 127 0 0 0 62 0 0 0 12 0 0 0 24 0 0 0 48 0 0 0 96 0 0 0 0 0 0 0])
]

{ #category : #resources }
DrawingEditor class >> textFigureCreationIcon [
	
	^OpaqueImage
		figure: self textFigureCreationImage
		shape: self textFigureCreationMask
]

{ #category : #resources }
DrawingEditor class >> textFigureCreationImage [
	"UIMaskEditor new openOnClass: self andSelector: #textFigureCreationImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 1
				bitsPerPixel: 1
				palette: MonoMappedPalette blackWhite
				usingBits:
					#[255 255 0 0 255 255 0 0 255 255 0 0 192 3 0 0 192 3 0 0 222 123 0 0 254 127 0 0 254 127 0 0 254 127 0 0 254 127 0 0 254 127 0 0 254 127 0 0 254 127 0 0 254 123 0 0 252 49 0 0 255 238 0 0])
]

{ #category : #resources }
DrawingEditor class >> textFigureCreationMask [
	"UIMaskEditor new openOnClass: self andSelector: #textFigureCreationMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 63 252 0 0 63 252 0 0 33 132 0 0 1 128 0 0 1 128 0 0 1 128 0 0 1 128 0 0 1 128 0 0 1 128 0 0 1 128 0 0 1 132 0 0 3 206 0 0 0 17 0 0])
]

{ #category : #resources }
DrawingEditor class >> textIcon [
	
	^OpaqueImage
		figure: self textFigureCreationImage
		shape: self textMask
]

{ #category : #resources }
DrawingEditor class >> textMask [
	"UIMaskEditor new openOnClass: self andSelector: #textMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 63 252 0 0 63 252 0 0 33 132 0 0 1 128 0 0 1 128 0 0 1 128 0 0 1 128 0 0 1 128 0 0 1 128 0 0 1 128 0 0 1 128 0 0 3 192 0 0 0 0 0 0])
]

{ #category : #'interface specs' }
DrawingEditor class >> windowSpec [
	"UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Drawing Editor' 
			#bounds: #(Rectangle 800 600 1355 1080) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 0 0 28 0 0 1 0 1) 
				#flags: 11 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#component: #drawing) #(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 0 0 0 0 0 1 28 0) 
				#flags: 0 
				#component: #toolbar))))
]

{ #category : #'tool hotDraw' }
DrawingEditor >> activateToolNamed: aString [
	"Activate the tool button in the toolbar which name = aString. (Desactivate the other buttons). Example: aString: 'Inspect Tool' or 'CreateEntity Tool'  "
	
	| anIndex |
	1
		to: buttons list size
		do:
			[:i | 
			| each |
			each := buttons list at: i.
			each value
				ifNotNil:
					[each value initialState name = aString ifTrue: [anIndex := i]]].
	buttons selectionIndex: anIndex
]

{ #category : #'tool hotDraw' }
DrawingEditor >> activateToolNumber: anInteger [
	"anInteger refers to the order of the tool in the toolbar 
1 is for inspect tool"
	
	buttons selectionIndex: anInteger
]

{ #category : #'drawing description' }
DrawingEditor >> activeToolNames [
	"Return the tool names that should pass input down to their views. Override to include more/less tools."
	
	^#('Selection Tool')
]

{ #category : #private }
DrawingEditor >> buildButtonDescriptionForTool: aString andIcon: iconSymbol [
	
	| tool icon |
	tool := Tool toolFor: aString.
	tool passInputDown: (self activeToolNames includes: aString).
	icon := (self class respondsTo: iconSymbol)
		ifTrue: [self class perform: iconSymbol]
		ifFalse: [self class selectionIcon].
	^ButtonDescription icon: icon value: tool
]

{ #category : #private }
DrawingEditor >> buildDrawing [
	
	drawing := self drawingClass new.
	drawing model: self.
	^drawing
]

{ #category : #accessing }
DrawingEditor >> drawing [
	
	drawing isNil
		ifTrue:
			[drawing := self buildDrawing.
			self initializeDrawingController].
	^drawing
]

{ #category : #private }
DrawingEditor >> drawing: aDrawing [
	
	drawing := aDrawing.
	self initializeDrawingController
]

{ #category : #'drawing description' }
DrawingEditor >> drawingClass [
	"What type of drawing should we create?"
	
	^Drawing
]

{ #category : #private }
DrawingEditor >> iconNameFor: aString [
	
	| iconName |
	aString isNil ifTrue: [^nil].
	iconName := aString select: [:each | each isAlphaNumeric].
	iconName := iconName
		copyFrom: 1
		to: (iconName size - 4 max: 1).
	iconName
		at: 1
		put: iconName first asLowercase.
	^(iconName , 'Icon') asSymbol
]

{ #category : #'drawing description' }
DrawingEditor >> iconNames [
	"If the icon names don't follow the convention of removing white space from the tool name, 
	making the first letter lowercase, and then replacing 'Tool' with 'Icon'; you might need to 
	override this.

	Normally the icon names can be converted from the tool names:
		Selection Tool -> selectionIcon
		Bring To Front Tool -> bringToFrontIcon"
	
	^self toolNames collect: [:each | self iconNameFor: each]
]

{ #category : #'initialize-release' }
DrawingEditor >> initializeDrawingController [
	
	drawing controller
		tool:
			(BlockValue
				block: [:selection | selection value]
				arguments: (Array with: self toolbarButtons selectionHolder))
]

{ #category : #'interface opening' }
DrawingEditor >> postBuildWith: aBuilder [
	
	super postBuildWith: aBuilder.
	builder window damageRepairPolicy: DoubleBufferingWindowDisplayPolicy new.
	builder window model == self
		ifTrue: [builder window label: self windowName]
]

{ #category : #'drawing description' }
DrawingEditor >> toolNames [
	"Return the list of names for the tools. 'nil' represents a space between tools in the icon bar."
	
	^#('Selection Tool' 'Hand Tool' nil 'Delete Tool' 'Bring To Front Tool' 'Send To Back Tool' nil 'Polyline Tool' 'Bezier Tool' 'Spline Tool' 'Rectangle Tool' 'Rounded Rectangle Tool' 'Ellipse Tool' 'Arc Tool' 'Image Tool' 'Text Figure Creation Tool')
]

{ #category : #accessing }
DrawingEditor >> toolbar [
	
	^ToolbarView model: self toolbarButtons
]

{ #category : #private }
DrawingEditor >> toolbarButtons [
	
	buttons isNil
		ifTrue:
			[| list |
			list := List new.
			self toolNames
				with: self iconNames
				do:
					[:tool :icon | 
					list
						add:
							(tool isNil
								ifTrue: [ButtonDescription spacer]
								ifFalse: [self buildButtonDescriptionForTool: tool andIcon: icon])].
			buttons := SelectionInList new.
			buttons list: list.
			buttons selection: list first].
	^buttons
]

{ #category : #'drawing description' }
DrawingEditor >> windowName [
	"What should our window label be?"
	
	^'Drawing Editor'
]
