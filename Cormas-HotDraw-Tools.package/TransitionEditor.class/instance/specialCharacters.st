private
specialCharacters
	
	^#(#tab #del #backspace #esc #cr #newPage #lf)
		collect: [:each | Character perform: each]