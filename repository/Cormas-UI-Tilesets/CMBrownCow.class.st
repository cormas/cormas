Class {
	#name : 'CMBrownCow',
	#superclass : 'Object',
	#classVars : [
		'icons'
	],
	#category : 'Cormas-UI-Tilesets',
	#package : 'Cormas-UI-Tilesets'
}

{ #category : 'animations' }
CMBrownCow class >> eating [
	<script: 'self eating inspect'>
	
	^ {
		self frame48 .
		self frame49 .
		self frame50 .
		self frame51
	}
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame00 [
	"Private - Generated method"
	<script: 'self frame00 inspect'>
	^ self icons
		at: #frame00
		ifAbsentPut: [ Form fromBinaryStream: self frame00Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame00Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/00_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZdJREFUWEftlj9LA0EQxTeVFkLAdAaUgEWalOktUkb9CrbWIvgRBLG29SvkT2mRPmWaFEKIEDsFwUIr5S08GSezl91LIM1ek7vJ7rzfvJm9pOK2fFW2rO8yQHYgO5AdyA5szIHr7sUPXut3w0efUz+HXvkbAYDY+dme6/U//wHomAVRGkBWKAGkiAUlXcJ9KQAKIgGqxtVufS8VeNCo+RjXAIjPbFUUAKvV1cnn19lbEICiyQAUltWhKlR0ddn1gs+LkZPi48mOd0NWz1Zwz/3D8G9Wgg5APMZWbT8AWKlVefQMWACsquy/KHlKmMN0QFufKnxcPzEZpfVBAFaurbQGTvcZayj+sXh31fq+38b7lQBSHBtlLwmgp11DhKrH/igADok869pPQujW8LyHZoRnX36fdAqKZkEfRUvMAksCiJ1+zM9aAKed20OINXenc74LkFReVlzGpl/NI6wfPN28FIEvOUBxC4BJNRjiVozCRRCFAITAJ8WZFII6bsVWuWDOgHQhtu+hdcktWFcwdX/Uz3Fq0pT1vwYMATCn3IM0AAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame01 [
	"Private - Generated method"
	<script: 'self frame01 inspect'>
	^ self icons
		at: #frame01
		ifAbsentPut: [ Form fromBinaryStream: self frame01Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame01Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/01_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZdJREFUWEftljFLQzEUhdNJB0HQzUJFcOji6O7QsbV/wdVZBH+CIM6u/gW1o0P3jl06FEShbgqCg07KCRy53t7kJa+FLnlLX26TnO+ee5O24Vb8NFas7wpAcaA4UBwoDizNgfPuyQ+u9avBrd9Tj0NX/lIAINY/3nB395//AHTMgqgNIDOUAFLEgpIu4b0WAAWxAbLGc3jwPZfgzt62j3EOgDhmqZIAmK3OTo5fn96CABTNBqCwzA5ZIaOz064XnM6GrkqcAFxzfTP465WgAxBPsVXaPxqveShmqu1nKWh/tAcsANa07r8oeUq4h+mAtj5XeL95ZDJK64MAzBx2SiuthpNdzrkU/5i9u83mll/G90oAKa5rSQDdcBoilD3WJwHwopBnXftJCF0aNlmoR2TzRXsAX+Y2oXQG5bPELLDsY5hyAhYG6HUuWxBqr0+eeRfwjBPAisvY5Ku9i7kPjxcvMeg5ByhuAXBTDYa4FaNwDCIKQAh8UpybQlDHrViVC2YPSBdSah6bk12CRQVz1yf9HOdumjP/F9F4+yHFU+8hAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame02 [
	"Private - Generated method"
	<script: 'self frame02 inspect'>
	^ self icons
		at: #frame02
		ifAbsentPut: [ Form fromBinaryStream: self frame02Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame02Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/02_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZ1JREFUWEftljFLA0EQhTeVFoJgOgOKYJEmpb2FZYx/wdZaBH+CEFLb+hdiUlrYW9qkEEICsVMQLLRS3sKTyWR23b0E0uw1dze3t+97b2cvqbk1H7U167sCUBIoCZQESgIrS+Cqff6Dz3p3eOfn1PehT/5KACB21tly/fvPOQBdsyAqA0iHEkCKWFAyJVxXAqAgJoBrHEet7wWDuwd1X+MYAPGeS5UEQLfanbx/Hb8FASiaDUBh6Q6u4Ojyou0FX2aPToo/PW/4NKR7LgXf6d0O/3olmADEU2LV8QOATi3n0R7QjaUB6Krqvyi5SzjHXAJ0DRfSWa7wYePYZJTRmwD8gMC5jtJqOL3OGEPxj9m7227s+Nd4nQRACJzlWhJAd7uGCLnH+8kAhLAA8IwQemm430M9wr0vn2ftglgv6K1oiVlgWQCp3Y/+WQrg9ORmD2LNzdGEW5E7gxBWXdZGX819jB08XE9j4AsJUNwC4KQaDHWrRuEYRBSAEDhTnJNCUNet2n8pmD0gU0hd99C47CVYVjD3/aSf49xJc8b/AhyxATBMlPrRAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame08 [
	"Private - Generated method"
	<script: 'self frame08 inspect'>
	^ self icons
		at: #frame08
		ifAbsentPut: [ Form fromBinaryStream: self frame08Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame08Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/08_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAaFJREFUWEftlr1KBDEcxLM2WgiCdh4oguCBWNpbWJ76CrbWIvgIgljb+gIW6pVWYmcpwlmJgnYKgoU2KhOYY8gm2dzuwjXZ5nKbj/nN5J/cFWbMTzFmfZMBcgI5gZxATqDVBA56u3+42o/7Z4W2Y9d9awAQ3NmeNheXX0MA/R6CaAxApxCgIMVcIKajMI0A6BoLwvn62k/J6PzSnO1TQGwRByYBqEtXAS75vD29ewEI6NuSKACF1Rkc8YGz/b2e/Xpzez58f3c/adOgewpj7Mlp39ZIZQIQD0WqNhmvjgUAk0G/tlUc6wQT8AGo+zr/pHhCKovQjb6O8HJno8Toxu9NgM41Rp9bFhzhNGqKf75+mJnOrOFnJYCK89jExNnnQvjcY2wSAC8LPeMpCfCoxWrDLcDkItRjFRLAlmCcTyQGlXwKCBFbrDWArc2jhe7U4Nk92yFxd9zgu7vIsVfXhy8jJQBxTgAE26srv7b58DhhIIA+fUcIpKAAmBODKG2BAig5YXRxfefrT0nBWwMhiDq338hbUEekyZykn+MmAlVz/wGEqvkhzPTHMgAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame09 [
	"Private - Generated method"
	<script: 'self frame09 inspect'>
	^ self icons
		at: #frame09
		ifAbsentPut: [ Form fromBinaryStream: self frame09Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame09Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/09_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZxJREFUWEftljFLA0EQhe8qLQRBOwOKYJHG0t7CMupfsLUWwZ8giLWtf8BCTWkldpY26URBOwXBQivlHbzwmJvb29sE0uw1ucvMzfvm7c4mZTHjq5yxfpEBsgPZgexAdmCqDhwPDv5wtJ8NL0u9Dx33UwOA4P7eQnF98z0G0OcmiIkB2CkEKEgxC0R3FGYiAHaNguh8a/O31ujK+nIVU0AsEROjALRLq4Aueb0/f7gABPSWJAhAYe0MHfFCZ0eHg+rx/uFq/P3j01zlBrunMHLPL4bVHml1AOJNlmqbtFdzAUBnENd7FUedRgc8AO0+5Z8UJ6R1E1rrU4Q3ets1Rmu/6wA7Vxu9brnhCKdWU/zr7bNY7C0V/GwFUHGOTUicMQvhdY/cKAAeFjrjMQ5w1EJ7w27AzptQx8sKYUkQ90RCUK3ngB1FQnhFEaODsVPiAuzunK6yQH9+9GJnXIt7sdFPf405t3cnr50cUHG8CAAtoMUZJwQcsHHkhCBqDlgAhfCKx8Q7AaCgBxG7pjav8xKkCqW+F/VznFo85r1/dc/vIaWJVLYAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame10 [
	"Private - Generated method"
	<script: 'self frame10 inspect'>
	^ self icons
		at: #frame10
		ifAbsentPut: [ Form fromBinaryStream: self frame10Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame10Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/10_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAaZJREFUWEftljFLQzEUhVMXHQShbhYUQbAgju4OjlX/gquzCP6Egji79i+oHR3cHUWoIIhC3RQEB11UTuCU6+1NmjwedMmbXl6Se757bm7ahpvy05iyvisAxYHiQHGgOFCbA8edg19c66f9no+px6ErvxYAiO3vzbuLy89/APqbBVEZQGYoAaSIBSVdwnslAAoiALLGs7X5PZbg0uqi/8Y1AOKYpUoCYLY6Ozl+fXoLAlA0G4DCMjtkhYyODjte8HF446T47d2sd0Nmz1Jwz9l5f3RWgg5APMVWbT8AmKmVefIZsACYVdV/UbJLGMN0QFufK7zW2jYZpfVBAGaurbQOnK4z1lD8Y/juFlpNv43vEwGkODbKWhJAn3YNEcoe+5MAeEhkr2s/CaFLw34PnRH2vpzP7gLdZtoZzFtCIajoRRRqRULIoPJbDoQJsLvTXUbw9tzgmSLyToCA1f9cg/nBV3sFa66uT15ibTsGQHECbKz/+P33DzOjOAwOQCnKBZznOAYRBZAu6KAMTpdC85NciJYgZl3qXHYJUgPXtS7p57guMSvOH04g/yHJDQkKAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame11 [
	"Private - Generated method"
	<script: 'self frame11 inspect'>
	^ self icons
		at: #frame11
		ifAbsentPut: [ Form fromBinaryStream: self frame11Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame11Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/11_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAbBJREFUWEftljFLA0EQhTc2WgiCdgYUQTAglvYWllH/gq21CP4EQaxt/QtqSgt7SxEiCKIQOwUhhTYq7+DJODezuT0P0uw1enuz8755O7PaCmN+WmPWDxkgO5AdyA5kBxpx4KC7+40r/bh3VuTT77Hr/t8AENvZng7nF8M/AHrNg6gFICuUAFLEgpIuMTYZgIJIgKrxrK99lgqcX5or1hgDIL7zqPBeCYAVU4XJ+P7y+OoCULQWAIVlhTe3k2F/r1sIPgyugxTHN8TK6nkU3HNy2vvtlagDEPespa3afgBIdxAnK0/qAQuAldX5L0pOidxv9oC2PkV4ub1h8mnr3Slg5dpOmZXnDjBpM8XfB29hpj1bbOHvlQCkODbrbsea7ngJ4VWPfZUB2Chy3rWn0gF+k41pnYGc/ZE9gADdhHrErCPhGmI9QQ3nXkTeHWCNJpISMBXCnYLVla9wdz9RumYhZM1//6Oz2JnqPxEQcVi7vDp8jo1tCWBr82gBiQCABxBSkIktMcRhHT8hTuEYhAlgJbISW2tWtUkASAAXYralfEs+gpTkTcRW+nPchJCX4weWnQ8wEdOjLQAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame12 [
	"Private - Generated method"
	<script: 'self frame12 inspect'>
	^ self icons
		at: #frame12
		ifAbsentPut: [ Form fromBinaryStream: self frame12Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame12Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/12_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAbJJREFUWEftVrFKQ0EQvEhAC0HQzoAiBAyIpYWdhWXUX7C1FsFPEMTa1l9QU1rYW4oQQRGFpFMQUiiCyjwYGTd357vngzTvqnd7uzuzc7uX1NyIV23E+K4iUClQKVApUClQigJ77e0vPOmHnZMsn93Hnvt/EwDY1uakOz0b/CJgbSEShQhohUpAQXykVCX6JhMgIBKgaqyV5fehAmcXZjIbfUCIe14V9rkIsGKiMBn3/YfnIAGCFiJAYK3w6nrc7e60M8C73qVTcJzBV6vnVTDm6Ljz0ytRBQAekpayWvlBQNWBn1ae1AM+AqysyL8onRKN9/aAlT4FuNlY8/Kz0gengJVbOTUr7x3EVGaCv/Ze3FRjOgvhdy4CCo5g2+2w2Y5XEqHqEZebABtF591qqgrwTBvTdwc6+3/2ABxSm9COYwjQkgs24dLip7u5HfO+ckjCmee3jiTOSiGApEoCiXXxnYC9+9aab010H63t/GL/KTa2QwpsrB/MIQDJGGiT0k4fgDPG5xsjESSgrC1QrCL63g+aqx/1eh++SQQQQBWKvHg2JvkKygBNyZHr5zglYarvNzlmCjD+raYrAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame13 [
	"Private - Generated method"
	<script: 'self frame13 inspect'>
	^ self icons
		at: #frame13
		ifAbsentPut: [ Form fromBinaryStream: self frame13Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame13Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/13_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAadJREFUWEftljFLA0EQhTeVFoJgugQUwSKNZXqLlFH/gq21CP4EIVin9S+oKS3sLW1SCKIQOwXBQivlHbzwnOyuu5dAmr0mubuZed+8nd2k4ZZ8NZas7wpAcaA4UBwoDizEgdP+0Q+O9MHosqpn72PH/dwAEDs8WHNX159/AOyzEEQtAO1QAVTEB6UuMTYbgIIogK5xdXe/ZxpsbTerZ4wBEO+5VLhPAmDHVGEx3r8+vQUBKFoLgMLa4f3Dijs57leCj5M7p+J4h1jtnkvBnIvhaDorUQcgHrKWtlr7AaDuIE47z5oBHwA7q/MvSneJ5ntnwFqfI7zT3vPyWeuDu4CdWzu1KtcdYGozxT8m7269vVGl8HsSgIoj2U47ntmJV4hQ98hLBuCg6H63nqoDfKeD6VsD3fv/zgACUobQt/+Ri+ULCVq44EEU2oZaAEK6FXkOzA2w3zvf7KyOn3kOUMjSj786WzYOOYjHO8Tf3J69xLbtjAMQR4ItzIK+Yoi1Tmh8DCIIQAh8xsQViCA2PgsABelCnRPP5mQvwSJEc2ok/RznFMyN/QWISv8h+fNhZQAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame14 [
	"Private - Generated method"
	<script: 'self frame14 inspect'>
	^ self icons
		at: #frame14
		ifAbsentPut: [ Form fromBinaryStream: self frame14Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame14Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/14_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZtJREFUWEftljFLA0EQhTc2sRAE0xlQBMGApLS3sIz6F2xTi+BPEMTa1r+gSWlhbylCBEEUYqcgpNBG5S08GSezd7vHQZrd6m7vZt43b2YvabgZr8aM9V0GyA5kB7ID2YHaHDjqHfzgs346vPA59X3ok18LAMT29xbc5dXkH4DesyAqA8gKJYAUsaCkS7iuBEBBJEDVWFvdr6kCl9dafo/vAIj3bFUUAKvV1cn716e3IABFkwEoLKtDVajosN/zgo/jGyfFb++a3g1ZPVvBmLPz4d+sBB2AeIyt2n4AsFKr8ugZsABYVdV/UfKUMIfpgLY+VXi9vW0ySuuDAKxcW2kNnO4z3qH4x/jdLbaXfBivSwGkOAJlLwmgp11DhKpHfBQAh0Sede0nIXRreN5DM8KzL58nnYKiWSAUWmcJhaCSAGKnPwUieAr4DUCy2CVjRp+dVcQNro9fiuKnAHZ3TlY686NnKxn2Nze+fb77hzlHEe5jD4v7FC6CMAEQiKRWstT9MhfMFsCFWNvL3ktuQVnCup9H/RzXLSrz/QLW+/0hvfQ0KAAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame15 [
	"Private - Generated method"
	<script: 'self frame15 inspect'>
	^ self icons
		at: #frame15
		ifAbsentPut: [ Form fromBinaryStream: self frame15Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame15Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/15_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAaBJREFUWEftlrtKA0EYhWdttBAE7QwogUACYmlvYRn1FWytRcgjCJLa1hewUFNaiZ2lCLESBe0UBAvTqJyBE/7M/jOTSRbSzDTZndv5zpnLpjAzLsWM9U0GyAnkBHICOYFKEzhuH/zhaj/tnRfyOXTdVwYAwf29RXN59T0EkO8+iKkB6BQCFKSYC8R0JMxUAHSNCeF8a3NQMrpaX7FtEhBLxI5RAOlQixEuWd6fP1QAAmpL4gWgsHQFN7LA2dFh21bd3l0Mm+4f5m0adE9h9O2e9eweCSYAcV+crkXGK/sDgMmgXT5LccylJqABuO4n+SfFExLchG70kwo3atslRjf+UgJ0LiP0OeWGI6CMmuJfb59mqbZs+BsEkOI8MjFxtrsQmnv0jQLwopDnOwahnQzfGHcDqpsw5QRIISwJlk4TCW3YkVPgE0/Z8akQXgBMlFLce6D/01rH+OubzuvYCezunKy1FvovGMAJOBj1G81f+/r4NGfb3TpCAF6OD0GMJACAEK0GJ+t88GMDQDwGkbIsyUuQOnkV/aOf4ypEQnP8AxQA9iHfD/XdAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame16 [
	"Private - Generated method"
	<script: 'self frame16 inspect'>
	^ self icons
		at: #frame16
		ifAbsentPut: [ Form fromBinaryStream: self frame16Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame16Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/16_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZpJREFUWEftljFLA0EQhTeVFkJAOwNKwCKNpb2FZdS/YGstgj9BEGtb/4Ka0sLe0iaFIAqxUxAstFLewQsvm9m52+MgzW2Tu725ed+82RvSCQtenQXrhxagdaB1oHWgdaAxB06HR38Y6xej6yJnfJ8a+bUBVADXhwcr4eb2ewbA2lNIXNcCoCASQBSLYlqpAsTv0KnGAHa2f+dcXu+vFXsKyfssAKu/J8fD8Dx5mIq+v3wkASgKR7Z6u+HyajRtlesAhVnd49PSjAghVBwxiNfq2QrEq7h7BiDu2apVxQAQ5IL9vNdDyudJB6oA5P6bqgwQW087qwqiz9aK7TdbwMrRS7XSE1ebKf41+Qzd3mrxGq9LAVSc37YlzJ6rM4RIVY88lQA4qXRwKET8ucUQnlP89jUm6xBSzHJAk1qHLQVWC8BrC57h/FjVWu+ZAPt75xsIHiyPX3UIWXPBSgqA8c9gE8/u7s/evLbMAVDcAtBE1nTUPQKUQbgAhMCvJkztwzEr1nPBbUHVwePFZbegCdGcHLX+D+QIlMX+A4wtCTBkVXwtAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame17 [
	"Private - Generated method"
	<script: 'self frame17 inspect'>
	^ self icons
		at: #frame17
		ifAbsentPut: [ Form fromBinaryStream: self frame17Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame17Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/17_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAY1JREFUWEftljFLA0EQhTeVKQRBOwOKYJHG0t7CMupfsLUWwZ8giLWtf0FNmSJ9SpsUgijETkGw0Ep5B+94mcxu7vAgILtNLpvded++mdlLKyx4tBasHzJAdiA7kB3IDmQH/o8DZ73jH7xZL/s3xaHs99hbt5IDXjCdw/PR4XK4vfucAvDmFBLPSQCK7O58FwcYPSyVB0FwDIhiUExPqgCE5B46FQXABgpr0PWttULUAsTWWsjGAE5PeuFxMizZXp/eZtIMWA5Cb3f2wtV1v0yV64C1XgNpQEKoONIEN7iHwvjEehV3a4DWIxBtjlUwg1sA3WfTxdwz5pQDKs7CavJPq3ZJFIBtolVrIXhiLzVYizx7w9qfbEOvCyBoi812BcU/Ju9hpbNacPC5EQAE9BzQKo+lrTLAwf7FBoJ02+NnvYRSRQkovag8CFuAbgoo7gFgzrtwrBhAxl/dTc7fD85fYq7M3AMKQAh8MiBcmdcZKo61tQCwwULME0z9nhJPdsFfROvsrfQ6rhOw7tpf8RzzIQHN3bcAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame18 [
	"Private - Generated method"
	<script: 'self frame18 inspect'>
	^ self icons
		at: #frame18
		ifAbsentPut: [ Form fromBinaryStream: self frame18Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame18Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/18_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAYNJREFUWEftlr1KA0EUhSeVFkLAdAkogkUay/QpUq76CmmtRcgjCGKd1ldIsmXeIKXNdiGCdgoBC62UM3Dg5mZ+sstKQGaqyWRmznfPvTOzDbPn1tizvkkAyYHkQHIgOfB/HLjLhj94Vx7yJxuU/u17c2pxAGLXV0dmMv3cANBjLojaAaTInwLQYgr2Lr63AmyftewYnJGNacJYJQdoudz0bfnuBSAEHGGfELUASPHF84GBGzJ6pqIygLYbUdzeZDaax3FuBdkAQCFX5FiHNTs5QGEpoPMqxWKfd6wFbw3Is4t+qLBCYuedvvNvGTknbNQARWEjGgEYtU8UkdEJiq9fP0yzc2yXsB8F4A0GYZ1LV8VLMEL4ome9SPu9x5CpcOVXHzcNEUqNFg/eA66zzs0J4UuNvJJjhem8By4H9yfdw2KlizBUC/ouKL66pxCfzUcvIYgtAIhjgQsgFo28CwgQg/ACEGJXUTlPipcGwAK6UEVcrymdgjpEy+xR6TEqIxCb+wvQ4M8hogIlyAAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame19 [
	"Private - Generated method"
	<script: 'self frame19 inspect'>
	^ self icons
		at: #frame19
		ifAbsentPut: [ Form fromBinaryStream: self frame19Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame19Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/19_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAX1JREFUWEftljFLBDEQhbOVFoKgnQuKYHGNpb2F5al/wdZaBH+CINbX3l9Qt7Swt7S5QhCFtVMQLLRSXuDJODvZTZaFa7LVZi+T972XCbnCzfkp5qzvMkBOICeQE8gJ5AQGS+B0fPSDi+2imvo19Th06Q0CALHDgyV3df35D0B/syB6A0iHEkCKWFAyJbz3AqAgFoBrPDvb3w2Da5ur/hvnAIhjblUUAN1qd3L8+vQWBKBoMgCFpTu4gqOT47EXfKzvnBS/f1jwaUj33ArWXE6qv14JJgDxmFh1/ACgU8t5dA9YAHTV93+kPCVcw0xAR58qvFXumowy+iAAnesorYbT+4w5FP+o391yueLL+N4JIMVRKPeSALrbNUTIPeqjANgk8qzrPAmht4bnPdQjPPvyd7MH9vfO10eLs2d9Ctp6QR/F2ddoA0I3t2cvbU3bAIA4CiyA2O5H/xCgCyIIQIhYUTlPiicDoIAp9BHXNclbMIRoyhpRl1HKgqlzfwESB9chtqyDvwAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame20 [
	"Private - Generated method"
	<script: 'self frame20 inspect'>
	^ self icons
		at: #frame20
		ifAbsentPut: [ Form fromBinaryStream: self frame20Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame20Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/20_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZZJREFUWEftljFLA0EQhTeVFgFBuwQigkWalPYWKZP4F2ytRfAnCCG1rX8hmtLC3tImhRAixE5BsNBKeQtPJpPZvdsjEJC96m5ud943b3Zvr+Y2fNU2rO8yQHYgO5AdyA78Hwcueqc/OFeGkxtflH4OnTlrcQBiJ4O6G99+LgHomAVRGUBWKAGkiAUlXcJ9JQAKIgGqxnXU+V4psHGw52McAyA+s1XJAKycyaj6OnsLAlC0MgBFkYi2np/1vODz4sFJ8cenLe+GrF7PGV1P/tZK1AEKS3u1rdp+AEh3YL+svPQagHisr1V+5eQu4fygAxYAqy8SP2wem0Ok9VEAbb0WZs91n5GU4h+Ld7fT3PU6vC8FwMp1L0OrXUOEqsf8QgApzhVveakd4Bju91CLuPfl+6U1YH3divptOQP3LDErl7kI+92rVnt7Ote7AHZbHxydGADTr/Y+4nf3ly+xIlYAII4JFgDiSC73Pp91jABFEEEAQmh6JgYg3kkhK5YMgAl0oWz/Y+OSW7AO0ZQcyadhSvIyY38BALfuIV3VfgYAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame21 [
	"Private - Generated method"
	<script: 'self frame21 inspect'>
	^ self icons
		at: #frame21
		ifAbsentPut: [ Form fromBinaryStream: self frame21Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame21Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/21_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZlJREFUWEftlr1KA0EUhSeVFoKgnQFFsEhjaW9hGfUVbK1F8BEEsbb1FdSUFvaWNikEUYidgmChlXIGjpzcndmdHQfS7Fa783PPd8/cO0nPzfjpzVjfdQCdA50DnQOdA8UcOB4e/OBaPxtd+pj2O3blFwGA2P7egru6/pwCsGMhiGwAzVABVCQEpS7hPQuAggiArPFsbX5XElxZX/ZjXAMgfvOo/g1A1dentygARYsA0Pqjw6EXfJzcORW/f5jzbmj2PAruOb8Y/dVKkgMUhaBmwZTVfgBwTSjzVjVAYRVgZjn/pLRLuD/qAMTrCqsOYKO/HZxW67MAmD3P3J4zglL8Y/LuFvtLXofvyQDWerXdVruFiGUPkCQAWm+LST21DnCO/R47Hva+zk/VgIprxacUnG3FkFgoTgWAbaK3nd0YunR0DdzLAmCQ3Z3T1cH8+DnUBVjDy4bv9j7A/PhrsIbxm9uTlzoHK20IcWwIASBwTEzXK0ATRBSAEErPrHSuaaw1ADbQhZTia1rT+giaApaeT/oxKi2q8X4Bs3z7ISZxz0sAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame22 [
	"Private - Generated method"
	<script: 'self frame22 inspect'>
	^ self icons
		at: #frame22
		ifAbsentPut: [ Form fromBinaryStream: self frame22Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame22Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/22_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZdJREFUWEftVrFKQ0EQvFRaCILpDCiCRRrL9BaWUX/B1loEP0EQ67T+gprSwt7SJoUgCrFTECy0UuZgZLPZvffuJZDmXpN3m72Z2dm9S1phwU9rwfyhCCgOFAeKA8WBuTlw2j/6xbV+MbyKmHrtXflzEQCyw4OVcH3zNSFAxywRjQXICqUASWKJki7hvZEAEgIAVePp7fxMFbi+1Y4x5kAQ12xVtgBWTjCyvj2/uwJI2lgASQFEW0+O+5HwaXwfJPnD41J0Q1av91wOhv+zknSAxNJebau2HwKkO7BfVl57BkCe6muTf1LylHC/64AlgNVXkW93ds0UaX1SgLZeE7Pnus8AJfnn+COsdtYiD99rCWDlupfetGsRXvXYXylAknPiLS+1A8zhefdaxLMvv5+YAet2q+q35Qzcs8gsrOwhtC4cDTyzgP29843u8ujFOoYAl2efax0bfXc3Ebu9O3tNuTjlAMi5QYogEYB13IsRJyUiKQAAIMMnK5LidNzLzRIAUOlC3SH08rJbMCth7v7sn+Ncgqr8P8teAzCxs8/rAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame24 [
	"Private - Generated method"
	<script: 'self frame24 inspect'>
	^ self icons
		at: #frame24
		ifAbsentPut: [ Form fromBinaryStream: self frame24Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame24Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/24_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAX1JREFUWEftljFLBDEQhbOVFoKgnQuKYHGNpb2F5al/wdZaBH+CINbX3l9Qt7Swt7S5QhCFtVMQLLRSXuDJODvZTZaFa7LVZi+T972XCbnCzfkp5qzvMkBOICeQE8gJ5AQGS+B0fPSDi+2imvo19Th06Q0CALHDgyV3df35D0B/syB6A0iHEkCKWFAyJbz3AqAgFoBrPDvb3w2Da5ur/hvnAIhjblUUAN1qd3L8+vQWBKBoMgCFpTu4gqOT47EXfKzvnBS/f1jwaUj33ArWXE6qv14JJgDxmFh1/ACgU8t5dA9YAHTV93+kPCVcw0xAR58qvFXumowy+iAAnesorYbT+4w5FP+o391yueLL+N4JIMVRKPeSALrbNUTIPeqjANgk8qzrPAmht4bnPdQjPPvyd7MH9vfO10eLs2d9Ctp6QR/F2ddoA0I3t2cvbU3bAIA4CiyA2O5H/xCgCyIIQIhYUTlPiicDoIAp9BHXNclbMIRoyhpRl1HKgqlzfwESB9chtqyDvwAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame25 [
	"Private - Generated method"
	<script: 'self frame25 inspect'>
	^ self icons
		at: #frame25
		ifAbsentPut: [ Form fromBinaryStream: self frame25Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame25Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/25_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAYBJREFUWEftljFLQzEUhdNJB0Gwm4WK4NDFsbuDY2v/gquzFPoThOLs6l+w7ejg7ujSoSAKdVMQOtSp5QZOOd4mecnjQZe86b2Q5Hz33JOmNbPjp7ZjfZMBsgPZgexAdiA7UJkD/c71Si624eTR7qm/fZdeJQAi1rs6ME+jxT8APeaCKA3AFTIAi7ig2CV5LwUAQdlAqpanff63VeDxad2OYY4A4RutigJAtbo6/v56//YCQDQZAMJcnVQlFd3edKzgbP5iisQBgDX3D5NNVrwOiHiMrWz/69uehUKl2n60AvYHM+ACQE/L/o/kU4I9nA5o61OFzxoXTka23guAysVOttIVOE455kL8d/5jDhtHdhneCwFYXPcSADpwGsJXvayPAsAPBZ917ScgdGsQMl9GOHzBDHQv75qt/emHPgWhLLAz0r7psnUiIuPnwWcotFshFHFZ4AKITT8DFEF4AQARK8rzUD3GQi44jyFcKCOu1yS3oArRlD2iLqOUDVPnrgHpzdEh0Eo3qAAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame26 [
	"Private - Generated method"
	<script: 'self frame26 inspect'>
	^ self icons
		at: #frame26
		ifAbsentPut: [ Form fromBinaryStream: self frame26Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame26Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/26_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAYJJREFUWEftljFLA0EUhDeVFoKgnYGIYJHGMn0Ky8T8hbTWIuQnBMTa1r9gvDKFvaVNioAoxC6CYKFVZBZGXl7eJrvHQZq9Jrd3uzvfzL69Tc1t+aptWd9lgJxATiAnkBPICVSWwHWnv8DBdlPc+zl1O3ToVQIAsd7FnnsYfS8B6GcWRGkA6VACSBELSqaE+1IAFMQEcI2rdfa7YvDo5NA/Yx8Asc2ligKgW+1Otj9e50EAiiYDUFi6gys4urrseMHp7MlJ8eeXHZ+GdM+l4Jjbu+K/VoIJQDwmVh0/AOjUcr62BnRhaQC6Kvs/Uu4SzrGUAF3DhXSWKnxab5uMMnoTgB8QONdRWgWn1xl9KP41+3T79QM/jPdRAITAr1xLAuhq1xAh9xgfDUAICwDvCKGXhvs9VCPc+/K9uQu658NGc3fyllKEeitOfprHEHocD97XFe0KAMQxwAKIrX7UDwE2QQQBCBErKvtJ8WQADGAKZcT1mOQlqEI0ZY6owyhlwtS+fyis1yEdmjzZAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame32 [
	"Private - Generated method"
	<script: 'self frame32 inspect'>
	^ self icons
		at: #frame32
		ifAbsentPut: [ Form fromBinaryStream: self frame32Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame32Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/32_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAXVJREFUWEftlr9qAkEQxtfKFIGAdhEUIYVNSnuLlBpfIa21CHmEQLC2zSv4p8wbpExjFyIkXQKBFEmlfAsfjOPO5c4sCLJb3e3N7PfNb+dur+QOPEoH1nfJQCKQCCQCiUAicDwERt2bNU7W+8WDL0rfW6duFAIQ61+fuunse8uAnguZiG5AikQzQJxZPy/ty9+dx+fNqp8DGTm4TZjLJEBhuTgWxYKoTo73lw/TAE0wR26VaQDiVlXawF/i0QxIpMNB11c8niwcjT49l/2cpEP87AfkIYfbECSg0VNYMpYL5/2xZU5mDxA9qtH7TCEiDxlDzEWtE/QkK2fAFgEprlFqcd7rpqT419unO6tVfBivcxng14wfl1ApIQJsTKt69ovEb76Gvau7eutk+arfAgs5FoIpNqHVE1o8aADieBAykLfZYGT502owfv54u7Jyd94CGqCJvKIyTopjvpABJEgT+xiQOVniZg/8V7RIfpTTsIigjt0AAPHCIWqqumwAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame33 [
	"Private - Generated method"
	<script: 'self frame33 inspect'>
	^ self icons
		at: #frame33
		ifAbsentPut: [ Form fromBinaryStream: self frame33Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame33Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/33_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAX5JREFUWEftVrFKQ0EQvFSmEATTGVAEizQp01tYRv0FW2sR/ARBrNPmF9SU/oFlmnSioJ2CYKGVMgcD4767e/fCkzR3VbLs3szOzt29jlvx6qwY3xUCRYGiQFGgKFAUaE2B8/HJDx62q9nU72n/xx69VggA7Pho3d3cfv4hYGMhEq0TUJB/JUCJCTgaflca3Nrt+RiU0cUxIZalgAVDIbrT9fr4FiVAEqzRUSUJEFi7Q1fYQAnUgS9FAOAxWUHg7HTsO76ezBzzHuZrPqbkKD/9gDrUcAxRBUIEOFOdqx1F6huTZGo9YKVX4JyP2L3+fjBNO2dCRQF2Djlj3XHm6nLmEvzj5d1t9Dc9Dn/XElDwkNMRs4azJGLd0y8qf+UY6vXJ2y2kpVWAOfa821oLHr0HDg8utwfdxZM9BSkvqDIY3+JrsAOAu/uL55RvKh4AOApCBHIMiBwlUEciSoAkckE1j90zllIheA9QhWXAbU3jEbQB2mSPrMeoyYZNc38BFvrJIQxMFwIAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame34 [
	"Private - Generated method"
	<script: 'self frame34 inspect'>
	^ self icons
		at: #frame34
		ifAbsentPut: [ Form fromBinaryStream: self frame34Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame34Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/34_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAXlJREFUWEftljFrAkEQhc8qKQJC0ilEhBQ2lulTWKr5C2lTByE/IRBS2/oXTCwt7FOmsQiIAdMlELCIleEtPBnH2dWTBSHsNZ6zO/PefLvLXiE78FM4sH6WDCQCiUAikAgkAv+HQKd5s8TN+jjouab0f9+tG4UAxK7bJ1n/eb5mQMcsE9ENSJFoBojT6gDIMX5ZX2wMl6pnLkYy1rIECTBBFkdRFER3LI73z8mX14CcJw3h3Wsg1JU0gCLbxKMZkEjvbpuu4/fZaGXg9e3IxUiHwozBOPKeuoPVZjUJaPQUloxRjI8UDH3kModH1VwCokc3vsJEbhlD0YvylelDds4JawSkuEbJBL3eelNS/Gf2nRXLpy6N7zsZQAKPVh4C3Ji+7lF3qwF22Wo8nNeOx1N9tn3IeRK4CX37QK69uQQIQhy/loHQBpNjMDL+rVUYexnef/hyN04BDdDErqJynhRHPJcBSWEfcZ0TEjePYQzRPDWi3IZ5BPXcPxoqzyE6sR2/AAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame35 [
	"Private - Generated method"
	<script: 'self frame35 inspect'>
	^ self icons
		at: #frame35
		ifAbsentPut: [ Form fromBinaryStream: self frame35Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame35Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/35_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAXhJREFUWEftljFLA0EUhC+VFoJgOgOKYJHGMn0Ky0T/gq21BPwJgljb+hdMUqawt7RJERCF2CkIFlpFZmGOyd7b3OYSSLNXXfbeznxvdvcutWzDV23D/lkCSAmkBFICKYGUQEpgbQn0OhczfNpvhw9O0/8d+uyvBQBm52c72WP/Zw7AH7MgogDYjSWAjhVAa1YGoHHr5C/X3T+qu079S2v4DLW4mIy1LMEEUBwShSC6ozjuP14/C1AE0DoFwv1SANoRASBSZr40gB+9dkKxq8uO63gyfcoBnl+23JjCcbm4HzDv7n6Yb9ZCAoweYiqk+aJjmvmGi/5lE4ZHtbAEah4S9uP208G840bb5NDOWTCXgO5SHi1LiRDWnqD59/Qr223suem8LwWgWff05qC5PX7zT4HVLefwZIS6R10UAMxRbAEsWl88031h1eram0uAQQIQoszUej7+bR7q+GB0/R7SMd8DClEFINa8cApWNasyP+pjVEU4ds4/XZDFIQKW2ywAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame40 [
	"Private - Generated method"
	<script: 'self frame40 inspect'>
	^ self icons
		at: #frame40
		ifAbsentPut: [ Form fromBinaryStream: self frame40Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame40Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/40_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAYpJREFUWEftlTFLA0EQhTeVFoJgOgOKYJHGMr2FZdS/YGstgj9BEOu0/gU1pYW9pU0KQRRipyBYaKW8hRdeNrNzJzlIs9vkMpmb982b3WwrLHi1FqwfCkBxoDhQHCgOFAcac+C0f/SLi+1ieBVrpt9zl14jABA7PFgJ1zdfUwBpzIKoBcBuvKubYppjQalLeHYBKNzb+ZnUXd9qx05RHAvPWJrDZORqjr7DUWUBIJ4rqgAUe3t+nzGIAISYG0A7OjnuR8Gn8X1Q8YfHpeiG5nIUfOdyMJzsFdOB1HrthG3S+tR+ALBTq/PKPUDr00LqLzu2wLyNqqeEeVMOqDgStJPcrC2I7c6uyaHWZwFoEc+2VSl1QDclxT/HH2G1sxZf53MlgIpZp8CznBC57lF7bgBvvvgN+8ZbPPuaY56C/b3zDSR1l0cv/C9Ii1txjY2+u5uocXt39upBzQBQ3AJg0RQMcStGYQ/CBSAEPinOohBM41asygV3BFUzr/P7v0dQp2iTObWu4yYF01p/0w7zIdiwC+8AAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame41 [
	"Private - Generated method"
	<script: 'self frame41 inspect'>
	^ self icons
		at: #frame41
		ifAbsentPut: [ Form fromBinaryStream: self frame41Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame41Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/41_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAXhJREFUWEftlj9LBDEUxLOVFoKgnQeKYHGNpb2F5alfwdZaBD+CINbX+hXUKy3sLW2uEETh7BQEC62UWZhjfPuSjWexTdJsLslkfpm3f64KHbeqY/9QAEoCJYGSQEmgJFASyErgeHDwnfpsn40uKq5BH2vt75g+CcBNtja/pvqV9eXGXpdXH2F/byHgqgB2zIOIAsBcjSkmAMzQaMKrmnhQmCck+n8CUHNsjkaQXFhqCOEC2Oht7IxcT/vy+NpIWHWq0VI1ABj93f1cHa/XsMHR4aCeepjcBjWHDmnYtFRzPhxNy/ALQM1ZXwsAM2zO6DGv8Vtwe/LkPaCPDvqxBHhi74lIPa4aPdfNdBO2/ZXf6G27SzT6mQBixho7zd8nb2Gxt1RL2M8G2N05XYWwPz9+Yn1hos0bR8lip4c2C4DmHsD4s78WGwdsW2n0BRQtgQLQDFeaU0hDHffGsP765uQ5BufehBai7WSp+ZQ5dFlfw/8AtGk7B/gB1fbjIU27N+4AAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame42 [
	"Private - Generated method"
	<script: 'self frame42 inspect'>
	^ self icons
		at: #frame42
		ifAbsentPut: [ Form fromBinaryStream: self frame42Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame42Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/42_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAXVJREFUWEftlTFLA0EQhTeVFgHBdAlEBIs0lulTpIzmL9hai/9BEGtb/4KSH2BvmSaFIBaxUxBSaKW8g3c8JzN6F4trdpvcTXbmfftmd6+VGh6thvVTBsgOZAeyA9mB7EB2oJID55OTr+izfTm7qVQjyv81mcLDw88yv7vfKZ9fnl7Tw3yreN8UJASAuApT1QIwbkEI/xdYLQAVpzBdmB630+3dqnQCADbmtcEFsNZ7whDDgEtYPcVUxIOy7VoDoPUs6lFDHMUxFMTOJTjnaA5b8wNAxVGMCVpYLbfxCICglQBoEXsYOXB2Oin+elzeJ0DpZkRbdPVsBXOurmflXtl4E9JW7gMFUOe8dunJqAUQXSbeJo2cs8fSBTgaX/RRYLC9eOZdwHPOwhq3e+WgN3JZ1XpOWAOguAew+BjsRWCEoPj78i3t9HYLHT7XBqAYfilOcrijcbwDIlo95lYCwER1Ieq7FydUlONdy//6ktWBi+Y2DvANfKDfIVaWpZQAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame43 [
	"Private - Generated method"
	<script: 'self frame43 inspect'>
	^ self icons
		at: #frame43
		ifAbsentPut: [ Form fromBinaryStream: self frame43Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame43Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/43_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAXZJREFUWEftlTFPAkEQhZcKCxIS7CSBkFjQWNpTWCL+BVtq438wMda2/AUNP8Ce0obCxFhgJ4mJhVaQd8m7PJcZuIPimr3m7uZm9n37ZnevFiq+ahXrhwSQHEgOJAeSA8mB5EAhB26H1yvvt30/nRQaw6vfWkzh87O/vP6kd5w/f75/hdlrPXvfF8QFgLgKUzUGYDwGIfwusFIAKk5hunA1aoSn55/cCQDEMasNJkBsvSUMMVxwCbOnmIpYUHG7NgBoPQe1qCGOwXEpSJxLcOZoDVvzD0DFMRgLdGC1PI57AAQtBECL2EPPgZvxMPv0tngJgNLFiLbo7NkK1jw8TvO1svcipK1cBwqgzlnt0p1RCsA7TKxF6uXqTkGOCXB5cdfBx/7R/INnAfc5B9a4tVZO2wOTQe03AShuAcx/+10PTCEo/r1Yhma7lYHwuRQAxXCnOKcFdzSOd0J4s0f+TgAkqQteL604obbVxEfzQX+yMnBebuUAaxmw3yFYwnQ8AAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame44 [
	"Private - Generated method"
	<script: 'self frame44 inspect'>
	^ self icons
		at: #frame44
		ifAbsentPut: [ Form fromBinaryStream: self frame44Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame44Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/44_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAXVJREFUWEftlbFKBEEQRGcjDQRBMw88BINLDM0NDE/9BVNjEfwEQYxN/QX1Qv/A0OQyUdBMQTDwIqUWSsre7p0VFi6ZSXZ2tnvqTU03W6U5j2rO+qkAFAeKA8WB4kBxoDjQyYGT8eF322/7fHJVMQZzxNr3KL8VgJtsb81+89c2Vht7Xd98poP9pYSnAtg1DyIEgLgKMzkHoCK9A6g4TqujDdbG0iXkuw5Y6+2pabkCvD6+NRy2wHAEQ6+qAUDr7x8W6nv1hgVQceTBDYprfWQBVBzCHgDEIHJ8NK7ZLi4ntSCHBVdYzJGHHF7DHwe0dTCPHCBEBBm1HGshWwPsY1tYXgd4YpuDHZdBT86Af7eht7PaTvGPl/e0PFipwznvDLC3e7aOxNHi9IkuQMRrO13HlUWnZ72o/W4bUtwDmH6NhtE6YKO757oVzwJQDE+KczMK6rq3hvjbu9PnCM6tAXUhd6rc9zZx14Hchn1/7/Q77ltU9/sBuxLaIVEiB+4AAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame45 [
	"Private - Generated method"
	<script: 'self frame45 inspect'>
	^ self icons
		at: #frame45
		ifAbsentPut: [ Form fromBinaryStream: self frame45Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame45Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/45_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAYhJREFUWEftVbFKA0EU3FRaCIJ2BhTBIo2lvUXKqL9gay2CnyCIta2/oKb0D1KmSRcUtFMQLLRSZmFk8u7t3kUP0uw2ubx7OzNv3tvbTljw6iyYPxQBxYHiQHGgOFAcaM2Bs8HxNy62y+FNxLT/U5deKwJAdnS4Em7vPmYE2JgnopEAVpO7ukmmOf8WQOK93a9f3I3t9fiManVpDuOpXLYJeUkHQJ4CBTmq0/Uyfa0YRAEUzD3aqrkEaEUqQMlH46UA4TZXRdcKsNZrJazm9GQQK766HkZCLghQcZYY+7CHbag4QOstkLUb77FsK3KDyrlJzoCSp8Btr6072LfT3Xd1aOVMmHFAPx482x4SRXgzQfL357ew2l2L2/lcK0DJvFPgVcs97HWqes6L2v+nY5jrMecilWPJkwIO+hebeNlbnjxywi24F9fY5LO3BYz7h/OnnOjKKSC5J4CgVhjiXozEORFZARSBX5ITFIQ27sXqXHC/hOpCzr4m7+ZuQRPQNnMaXcdtElqsH/kO7iFD7oURAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame46 [
	"Private - Generated method"
	<script: 'self frame46 inspect'>
	^ self icons
		at: #frame46
		ifAbsentPut: [ Form fromBinaryStream: self frame46Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame46Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/46_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZdJREFUWEftVrFKA0EQvVRaCILpDCiCRRrL9BaWUX/B1loEP0EQ67T+gprSP7C0SScK2ikIFlopb+HBc25275acpNlt7jLMzHvzZnZyvWrBp7dg/KoQKAoUBYoCRYHOFDgdH/1grV9Mr0JO+zu28jshALDDg5Xq+ubzDwFr80h0TkBB/pUAJSbgaOe7VuD6Vj/YoIwetgm2VgpYMASiOj2vj29RAiTBGG1VkgCBtTpUhQRKQMHvH5Yq+Gv1bEUWAYDHZAWBk+NxqPhyMg2APCCg5JQs4xDDNkQV8AiwKu2rbUXqC4uz0DgDVnoFbvMJtz3Ydd20cjrUFGDlVkpv4Gyf4UPwj5f3anWwFsL43khAwb1Jh81OuyURq57zovLXrqGuT243T0uSsK2x993GWvDkHmgaQpvcXkUPzCsm6xa0GUD4YH7mIrC/d76BRMPl2RPvOJLq8exqm30NN+F/e3f2nCJeU4DgHgEmtcRg92wETpFIEiAJPAnOpAC0ds/WpII7A6pC277H/LJbMC9gbnyrv+PcpDn+vyKy+SGtu4idAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame48 [
	"Private - Generated method"
	<script: 'self frame48 inspect'>
	^ self icons
		at: #frame48
		ifAbsentPut: [ Form fromBinaryStream: self frame48Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame48Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/48_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAb1JREFUWEftljFLA0EQhS+VFoIQOyOKohAL7ewtrCTqX7DVQgsRLCwtBLGx0Na/oKa0sLe0MKAgCrEzIFiYKvIW3jE3mb3sxkCauyZ3c7v7vnkzu5dSMuSrNGT9pAAoHCgcKBwoHBiYA4e17Q6O9bP6tVtTP/uO/IEAQGxrcyy5uf3JAOiYBdE3gMxQAkgRC0q6hPu+ACiIBZA1rpWldleCk7MTLsYxAOIzSxUEwGx1dvL58+3LC0DRaAAKy+yQFTI62Kk5wdfmQyLFH59GnBsye5aCc86v6mmveB2AeIit2n4AMFMr8+AesACYVb//ouQu4RqmA9r6WOH5yqrJKK33AjBzbaXVcLrOGEPx72YrGa+U3TTe9wSQ4pgoa0kA3e0awpc95gOgvT6VXOyepM5nSmAdLpaXhNCl4X739cjc/rJ79fzSSiGidkFeL+ityIOGMHuXx53FhXJGHO+iAEK7H/2jATAXENJ+L8DG2uk0XlZHG+88C7CovKy4jDV+qzMYf3d/9JEH3uUAxS0ALqrBELdiFM6DyAUgBH4pzkUhqONWrJcLZg9IF0Lr7hsXXYL/CsbOD/ocxy4aM/4PSZYQMGJ3iJkAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame49 [
	"Private - Generated method"
	<script: 'self frame49 inspect'>
	^ self icons
		at: #frame49
		ifAbsentPut: [ Form fromBinaryStream: self frame49Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame49Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/49_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAcBJREFUWEftljFLQzEUhdNJB0FoNyuKolAH3dwdnKTqX3DVQQcRHBwdBHFx0NW/oHZ0cHd0sKAgCnVrQXCwU+UETrlNb2LyWujy3tK++15yvnNyk7ZgRnwVRqxvcoA8gTyBPIE8gaElcFTd6eBYP6/d2Dnde9+RPxQAiG1vTZjbu58eALemQWQGkA4lgBTRoGRK+J4JgIKYAK5xrS63+wxOzZVsje8AiPdcqigAunXdyfuv96YXgKLJABSW7uAKjg53q1bwrfFopPjT85hNQ7rnUnDMxXWt2yveBCAeE6sbPwDoVHMe3QMaAF0N8i9K7hRvE7rRZxFeKK+pnDJ+FYDO3Si1hpNgcMboKf7daJnJctEO5fcggBTHILmWBHC7XYPwucccAGhvTJvLvVPbfz1NqB0uWo6E0JaGe97XJ/MHK/bRy2vLQiTtglAvuFuRB40E2b866SwtFrvi3ibEA982jNkB6B8NAGMBwfi9AJvrZzN4WBmvf/AswKTy0uqyVv+tzOL9+4fjzxB03xJQXAPgpC4Y6lqNwiGIIAAh8ElxTgpBt67V/ktBbUKZQsyah95JXoJBBVPHR/0cp06a8v4fiTsQMHq5ssYAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame50 [
	"Private - Generated method"
	<script: 'self frame50 inspect'>
	^ self icons
		at: #frame50
		ifAbsentPut: [ Form fromBinaryStream: self frame50Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame50Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/50_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAcJJREFUWEftlj9LA0EUxDeVFoIQOyOKohAL7ewtrCTqV7A1hRYiWFhaCGJjoa1fQU1pYW9pYUBBFGJnQLAwVWQWJjzfvVtvL4E0d01y+29+M293k5Ib8lMasr4rAIoEigSKBIoEBpbAQW27i2v9tHHl19TvaVf+QAAgtrU55q5vvv8A6DYLIjeAdCgBpIgFJVPC91wAFMQCcI1nZamTMDg5O+HbOAZAfGepMgHQrXYn3z9eP1MBKBoNQGHpDq7gaH+n5gVfWvdOij88jvg0pHuWgnPOLhu9vZKaAMSzxKrjBwCdSucsQ+Y9YAHQVd5/UfKUcA0zAR19v8ISWEMkAOhcR2ltuBDYfGXVDErWP3EMpTg6ZS25mt7terNhHMW/Wm03Xin7qfz+LwA3iTzr2gohdAKIF9Bp7rEOADrrU+68fuzTjzoFocgJhdKFnrm9Zd/99Nz2EFEAWXc/IHjTyTm7F0fdxYVyTzw1gY21k2l0Vkebb7wLtDOrXbY1f6ozWOP27vBdQzB+E4DiFgAX1WBot9oorCEkUKIEEoAQ+KQ4J0NQt1ttVgpBAHRqiKy1t8aF3AdPQT+iMXMz/RzHLBg79heO1RAwUPptmQAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame51 [
	"Private - Generated method"
	<script: 'self frame51 inspect'>
	^ self icons
		at: #frame51
		ifAbsentPut: [ Form fromBinaryStream: self frame51Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame51Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/51_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAcJJREFUWEftljFLA0EQhS+VFoIQOyOKohAL7ewtrCTqX7DVQgsRLCwtBLGx0Na/oKa0sLe0MKAgCrEzIFiYKvIW3jGZzJ67l0Cauya5vd1933szt0kpGfJVGrJ+UgAUCRQJFAkUCQwsgcPadgfH+ln92u2p731H/kAAILa1OZbc3P50AegxCyI3gHQoAaSIBSVTwvdcABTEBnCNa2Wp3WNwcnbCjXEOgHjPUgUB0K12J+8/3768ABSNBqCwdAdXcHSwU3OCr82HRIo/Po24NKR7loJrzq/qaa94E4B4SKw6fgDQqXTOMgT3gAVAV3n/Rcm3hHuYCejo+xWmWBAAnesorYbzgc1XVs2QZO3NBKQ4JshacoHudjYl51L8u9lKxitlt4zfgwDYJPJd13YIIRNAvIDwucceAGivTyUXuydp6aPegqxeABTKlnXN7S+7x88vrRQiCiC0+wHCk45r9i6PO4sL5S5xPDMBNtZOp/GwOtp451mg3VnjcqzxW53BHnf3Rx8SQsZvAlDcAuCmGgzj1hiFJYROsScBCUAIfFKcG0BQj1tjOoV/ATBBQ4TW3pqX5d7bA/0Ixq4N+jmO3TRm/h9MaBAwDjhQPwAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame56 [
	"Private - Generated method"
	<script: 'self frame56 inspect'>
	^ self icons
		at: #frame56
		ifAbsentPut: [ Form fromBinaryStream: self frame56Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame56Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/56_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAcVJREFUWEftlTFLA0EQhfcqLQRBOwOKICSNpb2FZdS/YBWwFsGfEBBrIZV/QU1pYW9pE0EQhdgpCBZaRd7Bk3Eye7ubbEyTay43tzvvmzezucJN+SqmrO9mADMHsjvw0OkM6q1WwXtoyLMCQHSxtuQ++u+Od8BUQUwEgIIA+VcACEsXQuJYn9UBVh7b/4kBhAZPvs/mwHHzYIDEp92LMqd+9kFlAYDY/t6Cu7z6/AOgYxbEyACyQgkgRSwo6dLIM0BBJEDVuLY2v4cKXFlfLmNcAyA+s1VRDrBaXZ18fn168wJQNBmAwrI6VIWKjg6bpeBj/9ZJ8bv7udINWT1bwT1n593fWfE6APEYW7X9AGClVuXRM2ABsKqUcy7XylPCuOmAtj5VeKO2bTJK670ArFxbaQ2c7jPWUJxfRMT4OwggxbFR9pIAeto1hK967I8C4JDIs679JIRuDc+7b0Z49uX7pFNQNQv6KFpiFlgSQOz0Y37GAtjdaa9CrDHfe+Z/AZLKy4rLWO+rsYb11zcnL1XgQw5Q3AJgUg2GuBWjcBVEJQAhcKc4k0JQx61YyAVzBqQLsX33rUtuwbiCqfujPsepSVPW/wDCwCUw5vLnRwAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame57 [
	"Private - Generated method"
	<script: 'self frame57 inspect'>
	^ self icons
		at: #frame57
		ifAbsentPut: [ Form fromBinaryStream: self frame57Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame57Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/57_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAdtJREFUWEftljFLQzEUhdNJQUHQSQuKKNjF0d3BsepfcCo4i+BPEMRZ6ORfUDs6iKujCBUEUWg3BcFBJ+U8OOV6e5OX2JSC+JY2t0nOd+69yWvFjfipjFjfZQO4bza/aGal0ajosc9oFgCITVWnexpvnVeH8cTSbBHrXt85QFkQQwHQQgD62wBwrMvALITcY06WElDM6gVf6rkmKwAzIU9D2THPDlAmqH//B8iWgf36TnETHrVOiz31eKg3IcS2tybd2fn7DwAdy3oTSocSQIpYUDJLv74HKIgN4BrP2upnn8G5xZkixjkA4piliuoButXu5Lj7+OIFoGgyAIWlO7iCo73deiH40LlyUvzmdqzIhnTPUnDN8Umr1yveDEA8Jq06/QCgU8t5dA9YAHSVettxvjwlwXeBTn2q8HJ13WSUqfcC0LlOpdVwus6YQ3H+K0KM30sBpDgWyloSQHe7hvC5x/ooADaJPOs6n4TQpeF59/UIz778PekUhHpBH0VLzAJLAojtfvTPQACbG4fzEKuNt594F2BT+VhxGWt/1BYw/+Ly4DkE3pcBilsA3FSDIW7FKByCCAIQAp8U56YQ1HErVpYFswdkFmLr7puXXIJBBVPXR72OUzdNmf8NguQzMK4wbbMAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame58 [
	"Private - Generated method"
	<script: 'self frame58 inspect'>
	^ self icons
		at: #frame58
		ifAbsentPut: [ Form fromBinaryStream: self frame58Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame58Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/58_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAdlJREFUWEftlT9LA0EQxe8qBQVBKw0oomAaS3sLy6hfwSpgLYIfQRBrIZVfQU1pZWspQqxEwXQKgoVWylt4ME5m/5k7A+I12Uz25v3mzeymLEb8lCPWL/4B/pYDd53OJ2Zqpd0u5To0Z5U5AMGpxrTTen16KbCeWJot+le3DsgHUQuAFAPMrwBAVLpAJ0Li2FOZA6yaELHKub9yADoRq7xygP3WjjsBR91TV5T+XusQQmx7a7I4O3/7BqBjFkQlLZAAUqRWAFpMwbXVj4EC5xZnXAzOyIdt+vEpYMUyaf/+2QtACDjCNSGSWqCrRRImw1qKX9+MFXBDVs9WZANQWNqLxLB0b7flqjk+6TpBPBCXYtinv+M9vBN1AOIpfZVO+I4a45yFpBmwAGhrTGi5sW5ukZUHLyJtfUyYViMpxfmPiBjXSQCsnP20SuHQSTBC+KrnvEj7B46hFNeTThB93DREqD1a3ARAEButs64hfK2RV3JsXrz3QO4Q6rvAqtaCyQKIVcPfMT9DAWxuHM4jWXO89yAvGQlgxWWs995cwP6Ly4PHEPiAAxS3AJhUgyFuxSgcgggCEAKfFGdSCOq4FYu5YM6AdCG177592S0YVjD3/aS/49ykOfu/AD6HLjBCTOKXAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame59 [
	"Private - Generated method"
	<script: 'self frame59 inspect'>
	^ self icons
		at: #frame59
		ifAbsentPut: [ Form fromBinaryStream: self frame59Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame59Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/59_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAdlJREFUWEftljFLA0EQhfcqBQVBKw0oQcE0lvYWllH/glXAOgj+BEGshVT+BTWlhdhaihBBEIWkUxAstFLewpNxM7u3m9x5jdfc3dzevm/ezFySmYqPrGJ98w9QqAP3nc4XSrraamXyOlTmwgAgOFObtVpv/VeD66nleTO4vrNAPohSAKQYYP4EAKLSBToREseawhxg1oTIy5zrCwegE3mZlwqQ8nErxYFKAPabu/YbcNQ9tUm596WOIcR2tqfN2fn7LwA3pkGMXAKZoQSQIhqUdGnkMaQgNkDWONbXPocSXKjP2RjXAIj3LFWUA8zWzU7eDx5fvAAUTQagsMwOWSGj9l7TCj70r4wUv7mdsG7I7FkKvnN80v3pFa8DEI+xVdoPcYr5ztE9oAEwq5Q5l2vllAS/hK71qcIrtQ2VUVrvBWDmtFPbiTV364y1FOd/AsR4nQsgxfEiuzbU7S6EL3vsEQXAJpGz7rrgOsDnnHdfj3D25fOkKQj1gjuKmpgGlgQQ2/3on7EAtjYPFyHWmOw98VuATeWhxWWs99FYwvqLy4PnEPiQAxTXALipC4a4FqNwCCIIQAicKc5NIejGtVieC2oPSBdi6+5bl1yCcQVT34/6OU7dNGX9N4mfMjDLn25SAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame60 [
	"Private - Generated method"
	<script: 'self frame60 inspect'>
	^ self icons
		at: #frame60
		ifAbsentPut: [ Form fromBinaryStream: self frame60Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame60Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/60_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAddJREFUWEftljFLA0EQhfcqBQUhVhpQxIBpLO0tLKP+BauAtQT8CYJYC6n8C2pKC7G1FCGCIApJpyBYaKW8hSfjZnZvN9x5IF6Tu8ncvG/ezm6SmYqvrGJ987cA7rrdTzi60m5n8j7kcmEOQHCmXrNar4MXg/up5TkzvLq1QD6IUgCkGGB+BQCi0gU6ERJHTmEOsGtC5HXO/MIB6ERe56UCpJwtpTjwD1CJA53Wjj0FD3sndlnd51IPIohtb02b07O3HwBuTIMYewhlhxJAimhQ0qXog4hibnE8o2tca6sfIw3OL83aGHMAxGcuVdABCsviKIqCLEbV4cOzF4CiSQAQ93UFgL3dlhW8H1waKX59M2HdkN1zKfjO0XHve1a8DmgALCptlfZDnGK+z6gZcK2Xwil73M2Vu8T7W8DO2Y0mSMt9YI36usoprVcBpDgS3EFDzB02dygpzn9FeIf3UQBcI+7tWAe4M3zdo04ugBTLG0INjPvdNyfc+/L7pF0QO4CYH01Me18F2Nw4WEByc7L/yLMAReWlxWWs/95cRP75xf5TCHwEgOIaAIu6YIhrMQqHIIIAhMAnxVkUgm5ci+W5EFyC2DUP5SUvQRGiKTXG/j+QIhLK/QJnfiwwEQ6vwwAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMBrownCow class >> frame61 [
	"Private - Generated method"
	<script: 'self frame61 inspect'>
	^ self icons
		at: #frame61
		ifAbsentPut: [ Form fromBinaryStream: self frame61Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMBrownCow class >> frame61Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Brown cow animations/61_Brown cow animations.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAdhJREFUWEftljFLA0EQhfcqBQVBKw0oomAaS3sLy6h/wSpgLYI/QRBrIZV/QU1pZWspQqxEwXQKgoVWylt48Jzs7t2RO6/xmlyG2X3fvNkdLnMNP1nD+u4foFIHHnq9b7R0rdvN9D3V5soAIDjTmvVa7y9vDu9TK/NueHPvgWIQtQCoGGD+BACi6gKdSIkjpzIHWDUh8ipnfuUAdCKv8loBygy3WhxoBOCws+dnwEn/3Bdl/9d6DSG2uzPtLi4/fgHYWAiikhYogIrUCkCLKbix/jVS4MLynI/BGX3YpsJzwIphIarTZ/j4GgUgBNdoq5ItoLBWh6qwgQKo+O3dhEO+Vs9WlAKAeMxWABzsd3zFp2d9L4gH4ipGUP3FOqxhG6IOhABYlfbVtiI1A3gWcs+AtV6FiwyZ1dZmME0rj45iVk47Qzux57bPyKU4vwkQ43sugIqHTjpi9rRbiFj1PC9q/8g11PHJ4VLEAebY+27XWvHkHMg7hHZzexVDYqFiSt2CIgeQ13EsgO2t40Vs1J4cPOkdV4BQXGODz/YS8q+uj55T4CMOUDwEwE0tGOKhGIVTEEkAQuCX4twUgjYeiuW5EDwD6kLRvsfySrdgXMGy6yv5ICkrqvk/pkUqMNDSe/AAAAAASUVORK5CYII='
]

{ #category : 'accessing' }
CMBrownCow class >> icons [
	^ icons ifNil: [ icons := Dictionary new ]
]

{ #category : 'animations' }
CMBrownCow class >> layingDown [
	<script: 'self layingDown inspect'>
	
	^ {
		self frame16 .
		self frame17 .
		self frame18 .
		self frame19 .
		self frame20 .
		self frame21 .
		self frame22
	}
]

{ #category : 'animations' }
CMBrownCow class >> loving [
	<script: 'self loving inspect'>
	
	^ {
		self frame56 .
		self frame57 .
		self frame58 .
		self frame59 .
		self frame60 .
		self frame61
	}
]

{ #category : 'animations' }
CMBrownCow class >> lying [
	<script: 'self lying inspect'>
	
	^ {
		self frame24 .
		self frame25 .
		self frame26
	}
]

{ #category : 'accessing - reset' }
CMBrownCow class >> resetIcons [
	<script>
	^ icons := nil
]

{ #category : 'animations' }
CMBrownCow class >> sleeping [
	<script: 'self sleeping inspect'>
	
	^ {
		self frame32 .
		self frame33 .
		self frame34 .
		self frame35
	}
]

{ #category : 'animations' }
CMBrownCow class >> sniffing [
	<script: 'self sniffing inspect'>
	
	^ {
		self frame40 .
		self frame41 .
		self frame42 .
		self frame43 .
		self frame44 .
		self frame45 .
		self frame46
	}
]

{ #category : 'animations' }
CMBrownCow class >> standing [
	<script: 'self standing inspect'>
	
	^ {
		self frame00 .
		self frame01 .
		self frame02
	}
]

{ #category : 'animations' }
CMBrownCow class >> walking [
	<script: 'self walking inspect'>
	
	^ {
		self frame08 .
		self frame09 .
		self frame10 .
		self frame11 .
		self frame12 .
		self frame13 .
		self frame14 .
		self frame15
	}
]

{ #category : 'see class side' }
CMBrownCow >> seeClassSide [
]
