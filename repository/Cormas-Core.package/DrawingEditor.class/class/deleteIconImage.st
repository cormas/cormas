resources
deleteIconImage
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