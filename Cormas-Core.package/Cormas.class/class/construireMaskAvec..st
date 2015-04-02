util_images
construireMaskAvec: uneImage
	"construction d'un mask √† partird une image.
	le principe est de cr√©er un mask en mettant opaque les pixels de couleur diff√©rente du premier pixel.
	Pour autoriser du blanc dans l'image, il est n√©cessaire de consid√©rer une couleur particuli√®re comme transparente.
	Plut√¥t que prendre automatiquement le blanc, il est pr√©f√©rable de prendre la couleur du premier pixel.
	self construireMaskAPartirDe: self imageMaison
	"
	
	| im mask transparentColorValue palette transparentValue opaqueValue |
	im := uneImage asImage.
	transparentColorValue := im atX: 0 y: 0.
	palette := CoveragePalette monoMaskPalette.
	transparentValue := palette indexOf: CoverageValue transparent.
	opaqueValue := palette indexOf: CoverageValue opaque.
	mask := Image
		extent: im extent
		depth: 1
		bitsPerPixel: 1
		palette: palette.
	im
		pixelsDo:
			[:x :y | 
			mask
				atX: x
				y: y
				put:
					((im atX: x y: y) = transparentColorValue
						ifTrue: [transparentValue]
						ifFalse: [opaqueValue])].
	^mask