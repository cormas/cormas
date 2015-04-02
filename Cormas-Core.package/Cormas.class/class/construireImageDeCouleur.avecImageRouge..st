util_images
construireImageDeCouleur: aColorValue avecImageRouge: uneImage
	"construire une image colori√©e √† partir d'uneImage rouge.
	Le principe est de prendre l'image rouge et de fabriquer des copies en changeant la palette.
	Les couleurs rouges de la palette d'origine sont remplac√©es par la nouvelle couleur mais en essayant
	de garder le niveau de gris (brightness) pour conserver les ombres.
	La couleur rouge est int√©ressante car sa valeur hue est de 0"
	
	| colors palette newImage |
	colors := uneImage palette colors
		collect:
			[:each | 
			(each hue <= 0.1 and: [each isGray not])
				ifTrue:
					[ColorValue
						hue: aColorValue hue
						saturation: aColorValue saturation
						brightness:
							(aColorValue brightness - (ColorValue red brightness - each brightness)
								max: 0)]
				ifFalse: [each]].
	palette := MappedPalette withColors: colors.
	newImage := Image
		extent: uneImage extent
		depth: uneImage depth
		bitsPerPixel: uneImage bitsPerPixel
		palette: palette
		usingBits: uneImage bits.
	^newImage