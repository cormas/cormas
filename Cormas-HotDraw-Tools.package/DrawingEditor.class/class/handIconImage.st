resources
handIconImage
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