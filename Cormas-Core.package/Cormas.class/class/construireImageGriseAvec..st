util_images
construireImageGriseAvec: uneImage
	"construire une image grise √† partir d'une image existante.
Le principe est de modifier la palette pour remplacer toutes les couleurs par un niveau de gris"
	
	| colors palette newImage im |
	im := uneImage asImage.
	colors := im palette colors
		collect: [:each | ColorValue brightness: each brightness / 3.0 + 0.33].
	palette := MappedPalette withColors: colors.
	newImage := Image
		extent: im extent
		depth: im depth
		bitsPerPixel: im bitsPerPixel
		palette: palette
		usingBits: im bits.
	^newImage