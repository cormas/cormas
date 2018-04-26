util_images
construireOpaqueImageAvec: uneImage
	"construction d'une OpaqueImage √† partir d'une image.
	on consi√®d√®re que le premier pixel indique la couleur transparente"
	
	| mask cachedImage cachedMask |
	mask := self construireMaskAvec: uneImage.
	cachedImage := CachedImage on: uneImage.
	cachedMask := CachedImage on: mask.
	^OpaqueImage figure: cachedImage shape: cachedMask