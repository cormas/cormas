resources
manipulateIconImage2
	"Tools.UIMaskEditor new openOnClass: self andSelector: #manipulateIconImage"
	
	<resource: #image>
	^Image
		extent: 25 @ 22
		depth: 2
		bitsPerPixel: 2
		palette:
			(MappedPalette
				withColors:
					(#(#(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 0)) #(ColorValue 
						#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
						collect:
							[:each | 
							(each at: 1) value
								perform: (each at: 2)
								withArguments: (each at: 3)]))
		usingBits:
			#[170 170 170 170 170 170 128 0 170 170 170 170 170 170 128 0 170 170 170 42 170 170 128 0 170 170 168 74 170 170 128 0 170 170 168 74 170 170 128 0 170 170 161 82 170 170 128 0 170 170 161 82 170 170 128 0 170 170 133 84 170 170 128 0 170 170 133 85 42 170 128 0 170 170 21 85 42 170 128 0 170 170 21 85 74 170 128 0 170 168 85 85 74 170 128 0 170 168 85 85 82 170 128 0 170 161 85 85 84 170 128 0 170 161 85 85 84 170 128 0 170 133 85 85 85 42 128 0 170 133 85 85 85 42 128 0 170 0 0 0 0 10 128 0 170 170 170 170 170 170 128 0 170 170 170 170 170 170 128 0 170 170 170 170 170 170 128 0 170 170 170 170 170 170 128 0]