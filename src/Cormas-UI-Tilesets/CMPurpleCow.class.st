Class {
	#name : 'CMPurpleCow',
	#superclass : 'Object',
	#classVars : [
		'icons'
	],
	#category : 'Cormas-UI-Tilesets',
	#package : 'Cormas-UI-Tilesets'
}

{ #category : 'animations' }
CMPurpleCow class >> eating [
	<script: 'self eating inspect'>
	
	^ {
		self frame48 .
		self frame49 .
		self frame50 .
		self frame51
	}
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame00 [
	"Private - Generated method"
	<script: 'self frame00 inspect'>
	^ self icons
		at: #frame00
		ifAbsentPut: [ Form fromBinaryStream: self frame00Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame00Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/00_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZNJREFUWEftlqFOgzEUhTtHZhBYAhgslgcACXuCCZAYEtweYY4EgwSxJxhIeAAsFgMEi8AsOMjpcsjh7vZf+2/JTGv2/3ftPd89ve3WCSsenRXrhwpQHagOVAeqA0tzoN+7+sG1Phqfx5z2PXXlLwUAYtejvXDWf/4HYGMeRGsArVABVMSDUpfw3AqAgkiAqjFOTo9mCtw/eI8xzgEQ37lVWQCs1lan70+PW0kAihYDUFirQ1Wo6HLYi4Jrm69BxW9v7qMbWj23gmsuBuO/Xkk6APEcW639AGClXuXZPeABsKq2/6L0lDCH64C1vlT4+2PHZVTrkwCs3FrpNZzdZ8yh+OdLCBu701V8ngug4lioe0kA2+0WIlU91mcBsEn0rFs/CWG3huc91SM8+/p90Slo6gV7FD0xD6wIILf70T8LARwfDuO1tt7tvvEuQFIdXlxjX5PJNubfPQym93FizDhAcQ+ASS0Y4l6Mmk0QjQCEwCfFmRSCNu7F5rng9oC6kLvvqXnFW7CoYOn6rJ/j0qQl838BNMUDMHHAxi8AAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame01 [
	"Private - Generated method"
	<script: 'self frame01 inspect'>
	^ self icons
		at: #frame01
		ifAbsentPut: [ Form fromBinaryStream: self frame01Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame01Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/01_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZZJREFUWEftlrFOQjEUhstmWBxcDbq4svoAOipPwICjC4kbj8Bm4uKoA0+AjvgArq4uYlwdWAgb5i/5yfFw2tteSFh6F24Pbf/v/Oe00HB7fhp71ncFoDhQHCgOFAd25kC387DEtT4a9/2eehy68ncCALHHUdvddj/+AeiYBVEbQGYoAaSIBSVdwnstAApiA2SNp3dztZHg+cW3j3EOgDhmqZIAmK3OTo7f31pBAIpmA1BYZoeskNH9sOMFD46/XJU4AbjmbjBe90rQAYin2Crtf3569VDMVNvPUtD+aA9YAKxp3X9R8pRwD9MBbX2u8OLn1GSU1gcBmDnslFZaDSe7nHMp/vvp3NHZahXfKwGkuK4lAXTDaYhQ9lifBICJaBJ51rWfhNClYZOFekQ2X7QH8GVuE0pnUD5LzALLPoYpJ2BrgOvLob/WDpvNKe8CnnECWHEZm83nJ5j7Mhms7uPAs+EAxS0AbqrBELdi1IxBRAEIgU+Kc1MI6rgVq3LB7AHpQkrNY3OyS7CtYO76pJ/j3E1z5v8BAED9IdY5TBEAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame02 [
	"Private - Generated method"
	<script: 'self frame02 inspect'>
	^ self icons
		at: #frame02
		ifAbsentPut: [ Form fromBinaryStream: self frame02Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame02Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/02_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZpJREFUWEftlqFuQjEYhYtbMBOzC2BmZ/cAIIEnQGxyZskcj4BbMoMcgicAJDwAFjuzLdiJGTK35ZSc5efn7117IcH0mntvb9vzndO/hYo78VU5sb7LADmBnEBOICdwtAR63ecfHOvjyYOfU7+HjvyjAEBsOL52973VDoBusyBKA0iHEkCKWFAyJTyXAqAgJoBrXLd37T2DN80P38Y+AOI7lyoKgG61O/m+XNSCABRNBqCwdAdXcPQ06HrBs8s3J8VHLzOfhnTPpeCYx/7kr1aCCUA8JlYdPwDo1HJeWAO6sDQAXZX9FyV3CefYSYCu4UI6SxX+XjdMRhm9CcADBM51lFbB6XVGH4p/vjp3cbUdxecoAELgLteSALraNUTIPcZHAxDCAsA3Quil4X4P1Qj3vvyetAuKakFvRUvMAksCiK1+1M9BAJ3WwB9r59XqO7cidwYhrHbZ9rXZ1NF3Ou9vz+PAtZcAxS0ATqrB0G61UbMIohCAELhTnJNCULdbbf+lYNaATCF23UP9kpfgUMHU8VE/x6mTpvT/BUtqAzBmR50YAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame08 [
	"Private - Generated method"
	<script: 'self frame08 inspect'>
	^ self icons
		at: #frame08
		ifAbsentPut: [ Form fromBinaryStream: self frame08Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame08Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/08_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZxJREFUWEftlq9PAzEcxXt2BoEfGCwWD0iYmpwAiSHB7U+YI8EgQUxODSTgkeAICoJFYBYUkNfkjZde2+v9SGZ6Zr3r9/o+7/XHrTArvooV65sMkBPICeQEcgKdJjAaXPziaJ/OTwttx477zgAgeDndNiej5yWA3ocgWgPQKQQoSDEXiOkoTCsAusaAcH50fFAyurP3bvsUEFPEwiQAdekqwCWvx/u+F4CAvimJAlBYncERLzg7nwzs7dPLz/L59dWtTYPuKYzas/HcrpHKBCAeilRtMl6tBQCTQb+2VRzjBBPwAaj7Jv+kuEMqF6EbfRPh74/NEqMbvzcBOtcYfW654AinUVP889WY9S1j+FsJoOLcNjFx9rkQPveoTQLgYaF7PCUBbrXY2nAXYPIi1G0VEsCUoM4nEoNK3gWEiA3WGcDh/qS/1uu9uXs7JO7WfS0WG6y9uRv/n1yeAUoJQJx1gGB7ONy1zdnswUAAffqMEEhBAfBODCIKoMCE0cH1ma8/JQXvGtAUmpx4+k7tKWgrWPf9pM9x3UHr1P8BdnX+IZ+tm30AAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame09 [
	"Private - Generated method"
	<script: 'self frame09 inspect'>
	^ self icons
		at: #frame09
		ifAbsentPut: [ Form fromBinaryStream: self frame09Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame09Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/09_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZlJREFUWEftlqFSw1AQRV9sDQIPGCyWDwAJ/YIKkBhmcP2EOmYwSBD9ghYJH1BZHIOCwSIwHRQwNzM33NlsXl6SztQkpkl3s/fsfW9fm4UNX9mG9UMP0DvQO9A70DuwVgdGw5tfHO3T2WWm97Hjfm0AELydHoSL0XMBoM9VEJ0B2CkEKEgxC0R3FKYTALtGQXR+dn5SavTw6D2PKSCWiIlJANqlVUCXvBZPOy4AAb0liQJQWDtDR7zQ2fVkmD8uX36K7+/vHnI32D2FkXs1nuV7pNYBiFdZqm3SXs0FAJ1BXO9VHHUqHfAAtPs2/6Q4IbWb0FrfRvj7Y6/EaO13HWDnaqPXLTcc4dRqin++hrC9HwI/awFUnGMTE2fMQnjdIzcJgIeFzniKAxy12N6wG7DxJtTxskJYEsQ9kRhU7TlgR5EQXlHE6GDqlLgAp8eT4kjbGgze7IxrcS/2tVrtMmf+OP4/uRyqEoCKIx8A+p4WZ5wQcMDGkRODqAVQCK94SrwRAApaF1LX08trvARdxNq8m/Rz3KZw6jt/hvb0IWz78XkAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame10 [
	"Private - Generated method"
	<script: 'self frame10 inspect'>
	^ self icons
		at: #frame10
		ifAbsentPut: [ Form fromBinaryStream: self frame10Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame10Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/10_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAaBJREFUWEftliFPA0EQhbeO1CCwBDBYLB6QUFVZARJDgutPqCPBIIuorCpIwGOxGCBYBKbBQWab1zymM9u9yyU1e+r2dnfeN292tm2FFT+tFeuHAlAcKA4UB4oDjTnQ61z/yrU+mlzEmHrsXfmNAIjYzWgvnPde/gHobxZEbQDOkAFYxIJil+S9FgAEJYBkLc/p2fFCgvuHH/Eb1ggQxihVFgCy1dnx+PlxywWAaGUACHN2kpVkdDXoRMG1zbfA4rfD++gGZ49SYM9lfzI/K64DIp5jq7ZfAJCplXn2GbAAkFXdf1HcJYhhOqCtryr887ljMrL1LgAy11ZaB07XWdZA/Os1hI3d2S68LwVgcdnItQSAPu0awste9mcB4JBwr2s/AaFLg373zgh6n+crd4FuM+2MzFtCHlTyIvJaERAclL9VgTABTo4G8Vpbb7ffIcJ3gghY/Y81Mv89nW7LmruH/uw+dp4FAIgDoNs9iFvH46d5CAQXQBbFAsxjnIJIArALOiiCwyVvfpkLyRKkrMudq1yC3MBNrcv6OW5KzIrzB3vZATCHo+zWAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame11 [
	"Private - Generated method"
	<script: 'self frame11 inspect'>
	^ self icons
		at: #frame11
		ifAbsentPut: [ Form fromBinaryStream: self frame11Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame11Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/11_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAatJREFUWEftliFPA0EQhbeO1CCwpGCwWDwgaVVlBUgMCa4/oY6kBllEZVWLhPpaLAYIFoFpcJB3zSPTuZnj9rikZs+0uzc775u3s9s2woafxob1QwJIDiQHkgPJgVoc6HWG37jSx9OrLJ8eF133/waA2O34MFz2ntYA9JwHUQlAVigBpIgFJV1ibDQABZEAVeM5vzjLFXh08pbNMQZAHHOrMC4FwIqpwmQcLx5bLgBFKwFQWFZ4N7oPN4NOJri1+xKkON4hVlbPreCa6/70t1cKHYC4Zy1t1fYDQLqDOFl5VA9YAKysyr8oeUrkerMHtPUxwl/v+yaftt49Baxc2ymzct8BJm2m+MdzCDsHqxX8XgpAimOx7nbM6Y6XEF71WFcagI0iz7v2VDrAd7IxrT2QZ//PHkCAbkJ9xKwt4RxiPUEN515E3h1gHU0kJWAshHsKut3jMJnMc9cshKzz/7lc7m03m68ERBzmZg/91Z3sPDmA9umghUQAwAMIKcjElhjiMI9PiFOzCMIEsBJZia05q9AoACSAC0W2xbyL3oKY5HXElvo5rkPIy/EDi3cSMOzKNuIAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame12 [
	"Private - Generated method"
	<script: 'self frame12 inspect'>
	^ self icons
		at: #frame12
		ifAbsentPut: [ Form fromBinaryStream: self frame12Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame12Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/12_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAa5JREFUWEftVqFOA0EQ3SYVpAaBJYDBYgkWkFBVWQESQ4LrJ9SR1CBBVFYVJOCxWAwQgkNQcSFBQN41jzymu8fucUnNrbrdnZn35u3MtA0359WYM76rCdQK1ArUCtQKVKJAtz34wkgfjo/zeHZfNO7/TQBgZ8MNd9S9/0XAnoVIlCKgGSoBBfGRUpVom0yAgAiArLEODvdmEtzcec7PaANC3POpsI8iwIyJwmDc392sBAkQtBQBAmuGF+dX7rTfzgEXlh+dguMOtpo9n4I+J73xT60UKgDwkLSU1coPAqoO7DTzpBrwEWBmZf5FaZeov7cGrPQpwB8va15+VvpgFzBzK6dG5buDmMpM8LcH55bWpx78jiKg4HC21Y4zW/FKIpQ9/KIJsFC0362mqgDvtDB9b6C9/2cNwCC1CG07hgAtuWARdjrbbjS69U45BGHP81tbEneVEEBQJYHAujgncP6eZauLrdaTPbu87k1ncmDNKLC/28/nKoLRxwblOW0ATh+fbRGJIAElbIGKMqJtNplsfTabr7BNIgAHqlAEFHuX/ASxgauyi/o5rgrMF+cbSeANMPV1ufsAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame13 [
	"Private - Generated method"
	<script: 'self frame13 inspect'>
	^ self icons
		at: #frame13
		ifAbsentPut: [ Form fromBinaryStream: self frame13Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame13Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/13_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAaNJREFUWEftlqFOQ0EQRbeO1FRgScFgsXwASOgXVIDEkOD6CXUkGCSIfkFBwgdgsRggWASmqYPc11xyme4su68vqXnPtPt2du6Zu7PbdsKan86a9UML0DrQOtA60DrQiAPDwdU3rvTJ9LzKZ8ep635lAIhdT/bC2fD5D4B950HUAtAKFUBFYlDqEmOLASiIBKgaz8np0VKB+wfv1TvGAIhjbhXGWQCsmCpMxvHTY98FoGgtAAprhbc39+FyPKgEN7Zeg4pjDrFaPbeCay5G099eSToAcc9a2mrtB4C6gzitvKgHYgCsrM6/KD0luj7aA9b6EuH5x06Uz1rvngJWbu3UrNx3gKnNFP98CWFzd7GC37MAVByLbbfjne14hfCqx7psADaKnnfrqTrAOW3M2B7o2f+3BxCQ04Sx84+12D5P0MK5F5F3DDUBhPQo8h5YGeD4cNzvdbtvvAcoZOm/ZrNtG4c1iMcc4u8eRos72XmWHIA4Ym1iJozlQax1QuNTEC4AIfCZElcggtj4IgAkpAsp63LnircgN3FTcVk/x02JxfL8ALMvATCP+WSpAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame14 [
	"Private - Generated method"
	<script: 'self frame14 inspect'>
	^ self icons
		at: #frame14
		ifAbsentPut: [ Form fromBinaryStream: self frame14Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame14Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/14_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZNJREFUWEftVi1PA0EQ3TpSg8CSgsFi8YCEqsoKkBgSXH9CHQkGWURlVUECHovFAMEiMA0O8rZ5ZJjO9HYvl9Tsqru5nXkfM7ttK6x4tVaMHwqB4kBxoDhQHGjMgX736gfX+nh6Hmvqd+/Kb4QAwK7Hu+Gs//yPgI5ZJGoTkAolAQlikZIu4bkWAQKiAFRjnZweLQjcO3iPMe4BIb6zVUkEqFark+9PDx2XAEGzCRBYqoMqKLocdiPg2uZrkOA3o7vohlTPVjDnYjD9mxXXAYCn2KrtBwEqtZQnz4BFgKrq/ouSp4Q1TAe09bnA3x/bJkdpvUuAyrWV1sDpPmMPwT9fQtjYmWfxuZKABEei7CUJ6GnXJDz1yE8iwCGRZ137SRK6NTzv3ozw7MvvWadg2SyQFFpnAXmksgikTn8OCfcU8A5AsdQlc75msy3k3d4P5vexsxYIHB8OO+vt9ptVDPFebz+WmkweA0EYRwyLcWIuI2ESQCKKWsVy41UumC2AC6m2V+3LbkFVwaa/J/0cNw0q6/0C8Q0AMCT+W2kAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame15 [
	"Private - Generated method"
	<script: 'self frame15 inspect'>
	^ self icons
		at: #frame15
		ifAbsentPut: [ Form fromBinaryStream: self frame15Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame15Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/15_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZpJREFUWEftlq1PQzEUxfvsDAI/MFgsHpAwNTkBEkOC258wR4JBgpicGkjAI8ERFASLwCwoIKfJWe6777al+8hMa7bX9vX8zultt8qtuFUr1ncFoCRQEigJlAQWmkCvc/GLq304Pq3k99h1vzAACF4Ot91J73kKIJ9DEHMD0CkEKEgxDcR0JMxcAHSNBeH86PigYXRn792PSUBsEScmAaRDK0a4ZHu8b5sABLS2JAhAYekKbmSDs/NBx3c9vfxMh66vbn0adE9hzD3rj32NRBOAeChObZHxyvkAYDIYl9+lONYyE7AAtPtZ/knxhESLUEc/q/D3x2aDUcffSIDOZYQhpyw4AsqoKf756tz6lnP8jAJIcR6ZlDjHNYTlHnOTALwo5PlOQVgnI/SOLkCzCHNOgBTClmDrLJFYwdZOQUg8p+JzIYIAWCin6XvgazLZwPs3d/367aUWrQEc7g/aa63WG+ZwAc5Hf7e76x9Howc/rvsIAXj5fgyiARBzbcHJvhD8vwEgjhRyok/NzdqC1GLLGE/+HC9DVK75BwhA/CFsWOqUAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame16 [
	"Private - Generated method"
	<script: 'self frame16 inspect'>
	^ self icons
		at: #frame16
		ifAbsentPut: [ Form fromBinaryStream: self frame16Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame16Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/16_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZZJREFUWEftlqFOA0EURaeO1CCwpGCwWD4AJPQLKkBiSHD9hDoSDBJEv6AgywdgsRggWASmwUHuNre5nb55nd1sUjNjdndm9t3z7pt92U7Y8OhsWD8UgOJAcaA4UBxozYFB//YPbX08uapixs+plt8YQAVwfzc+DJeD1yUAa04hcd8IgIIIAFEMimmmChC/Q6daAzi/OF1x+ej4s5pTSD7XArDqezPqh63d94Xoy3MvCUBROPL7tR+uh5NFqVwHKMzsHu6flkQIoeLYg/2aPUuB/SrungGIe7ZqVjEABDlgP5/1kHI96UAOQN2/qWyA2HramSuIOlsjtt8sATNHLdVKT1xtpvj3Wwg7B/O3eL8WQMX5bVvCrLk6Q4hU9oiTBcBOpY1DIeLPLYbwnOK3r3tqHUKKWQ5oUOuwpcAaAXhlwRrOj5Wt9Z4JcHYyqtradrf7oU3I6gtWUAD8zGZ7WHucDuf9ODFWAChuAWgMqzvqHAHWQbgAhMBVA6bm4Zi113PBLYFnXe5a7RLkBm5rX6P/gbbEEecfcroLMJLQ1YMAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame17 [
	"Private - Generated method"
	<script: 'self frame17 inspect'>
	^ self icons
		at: #frame17
		ifAbsentPut: [ Form fromBinaryStream: self frame17Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame17Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/17_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAYtJREFUWEftlqFOA0EURaeO1CCwpMVgsXwASNovqCgSQ4LrJ9SRYJAg+gUFCR+AxdYUgkVgGhzkLrnL7eub6W7YpAmZMd1OZ949c997s22FDY/WhvVDBsgOZAeyA9mB7MD/cWDQv/rCm3UyPS8OZb/H3rqVHPCC6RyerycH4WzwvATgzSkknpMAFBmenhQHuL25Lw+C4BgQxaCYnlQBCMk9dCoKgA0U1qCHR6+FqAWIrbWQjQFcjvtha3desj09dlbSDFgOQn++7YWL0bRMleuAtV4DaUBCqDjSBDe4h8L4xHoVd2uA1iMQbY5VMINbAN1n08XcM+aSAyrOwmryT6t2SRSAbaJVayF4Yi81WIs8e8Pan2xDrwsgaIvNdgXF32ch7Oz/YPC5EQAE9BzQKo+lrTJA73hc9NR2u/2il1CqKAGlF5UHYQvQTQHFPQDMeReOFQPIx2LR5fzdw+j3QjCLV+4BBSAEPhkQrqzrDBXH2loA2GAh1gmmfk+JJ7vgL6J19lZ6HdcJWHftN/CP9CGtc9JgAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame18 [
	"Private - Generated method"
	<script: 'self frame18 inspect'>
	^ self icons
		at: #frame18
		ifAbsentPut: [ Form fromBinaryStream: self frame18Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame18Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/18_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAX9JREFUWEftlqFuAkEQhvcspqIeampreYBWAk+AKLKGBHePgGtSU1kET0CR9AFqa6sg2AoMqYP8R/5kGHZ2ucs1JM2uWo7d+7/5Z3b2MnfhkV1Y3yWA5EByIDmQHPg/DvR7LzvcK9PZsAhK/7bunFocgNjr9M499b+OAPQzH0TtAFLkTwFoMQUfB52TANv3q+IZnJGDacKzSg7QcvnSz4+mCUAIOMI5IWoBkOKTt7mDGzJ6pqIygLYbUTyPe0U0o3xWCHIAgEK+yLEPe85ygMJSQOdVisU+71gLZg3Is4t5qLBCYr/rG+/fMnIuOKoBisJGDAIwaksUkdEJiv98O3d9e9jBeRSAHQzCOpe+ipdghLCiZ71I+81jyFT48quPm4YIpUaLB/uA76zz5YSwUiNbcqwwvX2g+zBuXjUaS12EoVrQvWCz3bYg/r7ID+3QGCcAEMdaH0AsGtkLCBCDMAEIca6oXCfFSwNgA12oIq73lE5BHaJl3lHpMiojEFu7B3YM0yGK/kQ8AAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame19 [
	"Private - Generated method"
	<script: 'self frame19 inspect'>
	^ self icons
		at: #frame19
		ifAbsentPut: [ Form fromBinaryStream: self frame19Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame19Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/19_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAXtJREFUWEftlqFuAkEURQdHMBW1BDC1tf2AVgJfgABZ06RuPwHXpKayFXwBIOEDsFgMbbCIGlLX5u7mNq+PN2VmswlmRu0sM3PPvfNmh5o7c6udWd8lgJRASiAlkBJICVSWwKD//I2LbTJ9yNfUfd+lVwkAxF4m1+5+sP4DoN9ZEKUBpEMJIEUsKJkSnksBUBALwDXacNQ9Mnhz+5G/4xgAsc+tCgKgW+1O9lfLlheAotEAFJbu4AqOnsb9XLDe3Dop/vY6z9OQ7rkVnPOYTX9rxZsAxENi1fEDgE4t58E1YAHQVdn/kfKUcA0zAR19rPDXrmMyyui9AHSuo7QKTu8zxlB8v3Hu8qqYxeeTAFIcE+VeEkBXu4bwucf8IAAWiTzrOk9C6K3heffVCM++/N2sgd7duHXRaLzrU/BfLeij+Hk4tCE0W2TF18jTjgAgjrEWQGj1o34IcArCC0CIUFE5TopHA2ACUygjrudEb0EVojFrBF1GMQvGjv0BDz7ZIU0o97kAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame20 [
	"Private - Generated method"
	<script: 'self frame20 inspect'>
	^ self icons
		at: #frame20
		ifAbsentPut: [ Form fromBinaryStream: self frame20Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame20Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/20_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZNJREFUWEftlq1uAkEUhQfXrKnANlBTi+0DUEl5ghVF1jTB8Qi4JhgkCJ6AVpYHwGJrWlJbUUPqSs6SQy6XO7s7GxKSZkbtzs7c891z52dr7sytdmZ9FwGiA9GB6EB04P84kHZHf7hXZvOnLCn97rtzTuIAxMazlntMVwcAus+CqAwgM5QAUsSCki7huRIABREAWaM99DpHCd6211kfxwCI7yxVMAAzZzCqLhcNLwBFKwNQFIFo6/OwmwleXH04KT6dvGZuyOz1nP5gvl8ruQ5QWNqrbdX2A0C6A/tl5qXXAMTz6lrlV07uEs73OmABMPsi8d+va3OItD4XQFuvhVlzXWcEpfj3u3P1m50Mn0sBMHNdS99q1xC+7DG/EECKc8VbXmoHOIb73Vci7n35/WANWKdbUb0tZ+CeJWbFMhfh/d2wcZkkn3oXwG7rwNGBAfCz2TTR//I22B2HnnYEAHGMtQDQj+By7/Nd9xGgCMILQAgNzsAAxDcpZPUFA2ACXShb/7xxwSU4hWhIjODbMCR4mbFbETnwIQGMp7IAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame21 [
	"Private - Generated method"
	<script: 'self frame21 inspect'>
	^ self icons
		at: #frame21
		ifAbsentPut: [ Form fromBinaryStream: self frame21Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame21Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/21_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZZJREFUWEftlq1OA0EUhaeO1CCwpGCwWB4AJPQJKkBiSHB9hDoSDBJEn6Ag2wfAYjFAsAhMg4OcbQ45vTvTnZ1OUjOrdufnnu+euXPbjtvw09mwvisAxYHiQHGgOJDNgUH/9hdtfTy5qmLa71DLzwIAsbvxobscvCwB2DEfRDKAZqgAKuKDUpfwngRAQQRA1njOL05rCR4df1RjXAMgfvOo1gag6vOsFwSgaBYAWn8z6leCW7tvTsUf7p8qNzR7HgX3XA8n/7US5QBFIahZMGW1HwBc48u8VQ1QWAWYWco/Kb0l3B90AOKrCmsVwM/nvndarU8CYPY8c3vOCErxr1fndg4WMnyPBrDWq+222i1EKHuARAHQeltM6ql1gHO876Hj4d3X+aUaUHGt+JiCs1fRJ+aLUwPgNdFuZzf6mo6ugXtJAAxydjLqbXe7775bgDVsNny3/QDz3/P5HsYfp8NFPw48tWsIcaz1ASBwSEzXK0ATRBCAEArOrHSuaaw1ADbQhZjia1rT+giaAuaej/oxyi2q8f4AySH9IfGm/iEAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame22 [
	"Private - Generated method"
	<script: 'self frame22 inspect'>
	^ self icons
		at: #frame22
		ifAbsentPut: [ Form fromBinaryStream: self frame22Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame22Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/22_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZVJREFUWEftVrFOQkEQPDpDQ2Fr0IbW1g/QUvkCCi1pSOz4BDoSG0st+AK01A+wtbVRY2tBQ+g088iQZdm99+5BQnOv4d2yNzM7u3fQCHt+GnvmD1lAdiA7kB3IDuzMgV737g/X+mQ6KDD12rvydyIAZPeT09Dvva8J0DFLRG0BskIpQJJYoqRLeK8lgIQAQNV4rm8uNwo8O/8uYsyBIK7ZqmQBrJxgZH17bbsCSFpbAEkBRFvHo25BeHD0GST548Nz4YasXu+5HU5XsxJ1gMTSXm2rth8CpDuwX1ZeeQZAHutrnX9S8pRwv+uAJYDVl5Evfk7MFGl9VIC2XhOz57rPACX570cIh50lDd8rCWDlupfetGsRXvXYXypAknPiLS+1A8zhefdaxLMvv1+bAet2K+u35Qzcs8gsrOQhtC4cDby1gKuLUbvVbH5ZxxDg8uxzrWOz+fwYsaeX4fI+dp4NB0DOXCmCRADWcS9GnJiIqAAAgAyfrEiK03EvN0kAQKULVYfQy0tuwbaEqfuTf45TCcry/wHy1wUw3ob3uwAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame24 [
	"Private - Generated method"
	<script: 'self frame24 inspect'>
	^ self icons
		at: #frame24
		ifAbsentPut: [ Form fromBinaryStream: self frame24Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame24Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/24_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAXtJREFUWEftlqFuAkEURQdHMBW1BDC1tf2AVgJfgABZ06RuPwHXpKayFXwBIOEDsFgMbbCIGlLX5u7mNq+PN2VmswlmRu0sM3PPvfNmh5o7c6udWd8lgJRASiAlkBJICVSWwKD//I2LbTJ9yNfUfd+lVwkAxF4m1+5+sP4DoN9ZEKUBpEMJIEUsKJkSnksBUBALwDXacNQ9Mnhz+5G/4xgAsc+tCgKgW+1O9lfLlheAotEAFJbu4AqOnsb9XLDe3Dop/vY6z9OQ7rkVnPOYTX9rxZsAxENi1fEDgE4t58E1YAHQVdn/kfKUcA0zAR19rPDXrmMyyui9AHSuo7QKTu8zxlB8v3Hu8qqYxeeTAFIcE+VeEkBXu4bwucf8IAAWiTzrOk9C6K3heffVCM++/N2sgd7duHXRaLzrU/BfLeij+Hk4tCE0W2TF18jTjgAgjrEWQGj1o34IcArCC0CIUFE5TopHA2ACUygjrudEb0EVojFrBF1GMQvGjv0BDz7ZIU0o97kAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame25 [
	"Private - Generated method"
	<script: 'self frame25 inspect'>
	^ self icons
		at: #frame25
		ifAbsentPut: [ Form fromBinaryStream: self frame25Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame25Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/25_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAX1JREFUWEftlqFOA0EYhLeO1CCwpGCwtTxAK0ufoAIkhgTXR6gjwSBb0SdoK+EBsFgMECwC0+Agc800w9/du93LJTW76vayu/P988/22nJ7Hq0967sMkB3IDmQHsgPZgcYcGA3vf/Fhmy9uijPtPPTRawQAYg/zrrsevfwDsO98ELUBtEIFUBEflLqE51oAFMQBqBrj8mqwU+B576N4xzUA4pytigJgtbY6nT8/dYIAFE0GoLBWh6pQ0d1kWAgeHL+5KnECcM/teLHNStABiMfYqvbPpqsCipVa+9kK2l+aAR8Ae1r3f6TeEp7hdcBanyr883nqZVTrgwCsHHaqlb7Aacq5luJfr84dnW128bkSQMVtLwlgA2chQtVjfxQAFiIketetn4SwrWHIQhnR8JVm4KI/6Ry22+/2FpRlQZ1B+77X6xOILB/Hm1+jwNgJIcSx1gcQm34FqIIIAhAiVlTXsXq+K3PBew3pQh1xuye5BU2IppwR9TFKOTB17R/nBNMhvTl9RgAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame26 [
	"Private - Generated method"
	<script: 'self frame26 inspect'>
	^ self icons
		at: #frame26
		ifAbsentPut: [ Form fromBinaryStream: self frame26Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame26Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/26_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAX9JREFUWEftlqFuAkEURQdHMAgsoTW1tXwAlYUvQLQS06RuPwHXpKaSCr6AIuEDsNiaQmorMATX5u7mNo/Hm3ZmswlmxrCzOzP33Dtvdqm5M7famfVdAkgJpARSAimBlEBlCQwHz9/4sE1nD/mauu/76FUCALGX6bUbDddHAPqeBVEaQDqUAFLEgpIp4boUAAWxAFyj3d3fnhjs9rb5PY4BEPvcqiAAutXuZH+17HgBKBoNQGHpDq7g6Gk8yAXr7Q8nxV8n8zwN6Z5bwTmP2ey3VrwJQDwkVh0/AOjUcv5nDejC0gB0VfZ/pDwlXOMoAbqGC+ksVvjweWkyyuhNAL5A4FxHaRWc3meMofjXu3Otq2IWr4MACIFfuZcE0NWuIXzuMT8YgBAWAJ4RQm8Nz7uvRnj25XPzFPRvxp1mo7GJKUJ9FHf7/QWE3hZZ8TbytBMAiGOsBRBa/agfAvwH4QUgRKioHCfFowEwgSmUEddzoregCtGYNYI+RjELxo79ASXj2SEP5nT9AAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame32 [
	"Private - Generated method"
	<script: 'self frame32 inspect'>
	^ self icons
		at: #frame32
		ifAbsentPut: [ Form fromBinaryStream: self frame32Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame32Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/32_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAXFJREFUWEftlqFuAkEQhheLqagHTG1tH6CVhSdAgKwhwfEI55rUVLaCJ6CV5QGwWBQEW4EhdTT/Xf5kGGaud+0mJM2uutub2f+fb+durxHOPBpn1g/JQCKQCCQCiUAi8H8I9HtPB5ys09koL0rfe6duFAIQe55eh4f+8siAnrNMRDcgRaIZIM6yn5fB8P7k8c3tJp8DGTm4TZgrJUBhuTgWxYKoTo7FvOUaoAnmyK1yDUDcq0ob+Ek8mgGJ9DHr5RWPJ7NAo68v7/mcpEP87AfkIYfbYBLQ6CksGcuFq/7YMqe0B4ge1eh9phCRW8YQ87XtmJ5k5Qw4IiDFNUotznvdlBT/XIVweVVE8bqSASQAET8uVikWATamVz37ReJ3X8PuXda6aDbX+i3wkGMhmGITej2hxU0DEMcDy0DVZoOR3X7fZvzbx6T4Ihnj5C2gAZqoKirjpDjmaxlAgjTxGwMyp0zc7YG/itbJj3Ia1hHUsd/H/cUh5p9OcgAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame33 [
	"Private - Generated method"
	<script: 'self frame33 inspect'>
	^ self icons
		at: #frame33
		ifAbsentPut: [ Form fromBinaryStream: self frame33Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame33Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/33_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAXpJREFUWEftVq1OA0EQ3toaBL5gsFgeACT0CSpAYkjq+gh1JBhkEX2CgoQHwGJREGxFTVPX5rvmSz7mdu72mmtqdlU7mdnvZ2Z3rxMOvDoHxg+ZQHYgO5AdyA5kB1pzYNB/WuNhm84eij3tf+/Ra4UAwJ6n5+F+8PWPgI3FSLROQEH2SoAWE/D27rok8OLyt4jBGV1sE2JJDlgwFEKdrs+PnkuAJFijraokQGBVB1XYQAnUge9EAOCerSDwOO4XioejWWDey+StiCk52s95QB1q2AbXgRgB9lT7altR9Y1JMrUzYK1X4JSP2NXfaTRNlTOh5ACVw05PHXuuU85cgs+/Qzg+28Lwdy0BBY9NOmJ24CwJTz3nRe0vHUO9Pnm7xby0DjDHnndba8Hde+Dmatw76nZ/7CmomgV1Bu1bLJcnAHh9H21vI2eVZgDgyI0RSBlA5CiBOhIuAZJIBdU8qmesyoXoPUAXdgG3NY1b0AZokz2SHqMmGzbN3QCgQc0hEJ/o7gAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame34 [
	"Private - Generated method"
	<script: 'self frame34 inspect'>
	^ self icons
		at: #frame34
		ifAbsentPut: [ Form fromBinaryStream: self frame34Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame34Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/34_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAXBJREFUWEftlqFuQjEUhotbMAjsAhjsLA+wycETIEBiSOZ4BNwSDHITPAEg4QGwWAwQLAJDcFv+S35yKKcFtiY3Ib2Gctpz/v98bblkTMpPJmV9Ew1EApFAJBAJRAKPQ6Be6/3gzToYtpOm7O+ut24QAhDrD15Mqz4/M2DHNBPBDUiRYAaIU+sAyDHfaL5fTFde10mMZLRt8RJggiyOoiiI7lgc49m04DQg10lDGDsN+LqSBlDkmngwAxLpZ7eWdPz0vDwZ+P4aJzHSoTBjMI68j87wdFhVAjZ6CkvGKMZHCvr+5DKHV1XdAqJHN67CRK4ZQ9HDpqT6kJ1zwRkBKW6jZIK93/ahpPh2YUy+fMzi+CYDSODVuocAD6are9S9aoBdVt+6hVw2u7Lvtgs5bwIPoescyL1XtwBBiONTM+A7YHIORnb7fZGx0aRz/EVSnotbQAM0cauoXCfFEb/LgKTwF3E7xyeOtUFeRv8xmrqBX0nI0CGXvEmPAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame35 [
	"Private - Generated method"
	<script: 'self frame35 inspect'>
	^ self icons
		at: #frame35
		ifAbsentPut: [ Form fromBinaryStream: self frame35Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame35Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/35_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAXRJREFUWEftVrFOAkEUXDpDQ2Fr0IaW1g+QEvkCCi1tTOj4BDoSG0sp+AKg1A+wtbVRY2thQ+wkc2Quw95bbjlIaHarZfe9mXnzdm+puSOP2pH5XRKQHEgOJAeSA8mB5MDBHOj3Hv7xtE9n9xmm/zv07B9EAMgep21313/bEOCvWSKiBLAaCwAVqwCN2VsAiW9uuznu5dVXVqk/NIZ7iMWgM1Zbgg4gOAQKQFRHcMxfX5oFURSgcSoI850EaEUUAJAy8p0F+NZrJQQbj3pZxSdnH7mAydMiW1NxbBfPA/IGw1l+WAsO0HqAKZD6i4pJ5hNu+5dNMbyqhRYoeQjYt9t3B3l/3xemDq2cARsO6Cnl1bKQKMI6EyT/eXfutLXO5rxUAMmuO6Nmo17/9G+BVS1zeDNC1SMuSgDIEWwJ2NZf7Om5sGK192YLsEgBFFFGau3/Lpfnuj5/Hq6/SMYwvwMqooqAWPLCLdiXrEp+1GNUBTg2ZwVXxcUhF8jHIAAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame40 [
	"Private - Generated method"
	<script: 'self frame40 inspect'>
	^ self icons
		at: #frame40
		ifAbsentPut: [ Form fromBinaryStream: self frame40Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame40Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/40_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAYdJREFUWEftVaFOQ0EQvDpSg8ASisFi+QCQ0C+oAIkhwfUT6khqKkH0CwoSPgBbiwGCRWAaHGSumWa63bv3mr6k5s70dd/ezOzs7btW2PJqbZk/FAHFgeJAcaA4UBxozIFed/iHi208uYmY9n/q0mtEAMhG4+Nw3ZsuCbAxT0QtAawmd3WTTHM8UeoSnrMCSHx5db7APTn9jJUCHAvPWJrDZORqju5hq5ICQJ4CVQEke305WDGIAihiYwFa0d2gGwl39t+Dkj/cP0U3NJet4J7b/mRxVlwHrPVaCcuk9dZ+CGClXuWVZ4DWWyD1lxV7wnIHVaeEeUsOKDkStJJUrz0Rv1+Hrg61PimAFnG2PSTrgB5Kkn+/hbB3NN/N50oBSuZNQc5yikhVD+yNBeT6i3c4N7nF2dccdwouzgZxqHfb7Q9+Cyy4F9fYz2zWAcbjc3/+NUqsFQEk9wQQ1ApD3IuRMyciK4Ai8EtygoLQxr1YlQvZFlT1vM77tVtQB7TJnFrXcZOEFusf3AH1IY+m0NEAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame41 [
	"Private - Generated method"
	<script: 'self frame41 inspect'>
	^ self icons
		at: #frame41
		ifAbsentPut: [ Form fromBinaryStream: self frame41Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame41Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/41_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAXZJREFUWEftlqFSAzEURbOOqUFgmYLBYvkAkNAvqACJYQbXT6hjBoME0S8oyPIBWCwGGCwC08HB3IXbubx9yaZFrEnMpkneuyf3JbutQset6lg/FIDiQHGgOFAcKA4UB7IcGA4uv1Kf7cn0rOIa9LHW/o7FJwGY5PjkcBG/t//ayHU6fAxXk92ApwLYMQ8iCgBxFWYwASCGRhE+VcSDwjwh0V8KQMWRHI0gubCMIYQLYK23ttNy3e3Dfb/hsMZpjJaqAUDrb67vanu9hgQX40E9tbb5HFQccXDDuqUx56Ppogx/AFSc9bUAEENyWo95td+C250nz4BeHfRjDnDH3o1IXVe1nutWOoRtf+U/37bdJWr9SgAxYbWd4u9PIWzs/ESwnw1wdDCuj/R6r/fC+kJEmzeOksV2j9gsAIp7AB/z+VZsHLBtpdEXULQECkAxPCnOQArquDeG9bezUfP9/ZvIPYQWom1nqfmUOOKyvob/AWiL7RzgGxS/4yFTzcs1AAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame42 [
	"Private - Generated method"
	<script: 'self frame42 inspect'>
	^ self icons
		at: #frame42
		ifAbsentPut: [ Form fromBinaryStream: self frame42Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame42Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/42_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAXFJREFUWEftlaFOA0EQhreO1CCwpGCwWB4AJO0TVBSJIcHxCHUkGCSIPkFT2weora0pDRaBaepK/iP/5Wc6A3dFnNk1vdvO7P/tP7N7rdTwaDWsnzJAdiA7kB3IDmQHsgOVHOj3nrbRZ3s0vqu0RpT/azKFBzfXZf7F5ap8nk076fVlUrzvCxICQFyFqWoBOG9BCP8XWC0AFacwXXgenafb/rx0AgB2ziuDC2Ct94QhhgGXsHuKqYgHZcu1A0DruahHDXEsjqEgNpbgjNEcluYHgIpjMSbowmq5nY8ACFoJgBaxhpEDj8Ne8dfB8TIBSpsRZdHdsxTMuX8Yl72ydxPSVvaBAqhzXrn0ZNQCiC4Tr0kj5+yxdAG6V8PC08N2+413Ac85F9Z52yub91OXVa1nwA4AxT2Az/X6JAIjBMU/FikdnX3L8Lk2AMXwS3GSwx2dxzsgot0jthIAAtWFqO7ePKGiHO9a/teXrA5cFNs4wBe7690h3P97YwAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame43 [
	"Private - Generated method"
	<script: 'self frame43 inspect'>
	^ self icons
		at: #frame43
		ifAbsentPut: [ Form fromBinaryStream: self frame43Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame43Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/43_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAXFJREFUWEftlaFuAkEURQfXYCpqG6ipre0HtLLlCxAgMSR1fAKuCQbZCr6A1PYDsLU1QLCIGoKjuUvu5nb6HuyCWDNj2B3ee/fMfTOztVDxqFWsHxJAciA5kBxIDiQHkgOFHGi3Rjvvsz2Z9gvV8PIPJlO4033K8+8flvnz7LMR3t8+svdTQVwAiKswVWMAzscghD8GVgpAxSlMF8aTu9Brf+VOACCes9pgAsTWW8IQw4BLWD3FVMSCitv1D4DWs6hFDXEUx1CQOJbgjNEctuYPgIqjGBO0sFoez3sABC0EQIvYQ8+B12Er++vieh4ApZsRbdHVsxXMeRlM871y8iakrdwHCqDOWe3Sk1EKwLtMrE3qxepJQYwJ8Pw4zDy9rNcXvAt4zllY5629sl3dmAxqvwlAcQvgZ7NpemAKQfH1dwhXt3sOPpcCoBh+Kc5lwR2dxzshvNUj/igAgtQFr5fWPKEO5cRX81lfsjJwXmzlAL9XF90hRGRRPwAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame44 [
	"Private - Generated method"
	<script: 'self frame44 inspect'>
	^ self icons
		at: #frame44
		ifAbsentPut: [ Form fromBinaryStream: self frame44Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame44Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/44_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAXRJREFUWEftlaFOA0EURWdtTQWe1mCxfADItl9QUSSGBNdPqCPBIEH0Cwqy/YDaWhQNFoFpcJC7cMnl7ZudbbJJzYzZ6ey8d8/cea9bhAOP4sD6IQNkB7ID2YHsQHYgO9DIgfHo7qvusz1fXBfcgzn22t+x+FoAJplcDv7iz863lVxX4024n58GPBXArnkQUQCIqzCDUwAq0jqAiuO0Oupg7V66hHjXAWu9PTUtV4D16rjisAWGIxh6VRUAWv/48FzeqzcsgIojDm5QXOsjCaDiEPYAIAaR29moZLuZLkpBDguusJgjDjG8hn8OaOtgHnOAEDHIWMuxFpI1wD62heV1gCf2+dZ3GfTk3LB3G3qZ1XaKv7+EcHTys5vzxgDDi1lZ0t1O55UuQMRrO13HlcVOz3pR+902pLgH8LHb9WLrgI3dPdeteBKAYnhSnMkoqOveGvY/LafV/+/fRG4NqAupU6Xe14m7DqQStv2+0ee4bVHN9w2QSdwhhaaX1wAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame45 [
	"Private - Generated method"
	<script: 'self frame45 inspect'>
	^ self icons
		at: #frame45
		ifAbsentPut: [ Form fromBinaryStream: self frame45Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame45Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/45_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAYRJREFUWEftVaFOA1EQfLU1CDxgsFg+gEroF1SAxJDg+gl1JJhKEP2CgoQPwGJRECwC0+Agc82Q6d7uuytcUvPW9Lq3uzM7u+9eL23YehvGT4VAUaAoUBQoChQFOlNgNLz+xsU2m19UNe3/6NLrhADAprODdD56XiFgfR6JVgTYTe7qJpjG/JsAgU/Pjn/rHh69Vc/oVk1j6I9iOSbEhQoAPCoKcHSn9vS4UxOIBEiYOTqqtQhoR0pAwW9v7hOI21gl3UjASq+dsJurybDq+HI8rwBpIKDkLDDykMMx1BSg9LaQlRvvYXYUuUXl3oQ7oOBRcTtrqw7yvt73XB7aOQNWFNCPB8+2V4kkvJ0g+MdLStv7y2w+NxJQMO8UeN0yh7OOuue+qPx/Ooa5GXMvohgLHhI4GUyqQ73V779yw21xz6++z8ViFzXuHsbLL1dgtVNAcI8Ai1pi8Hs+YuZIZAmQBH4JzqIAtH7P16SC+yVUFXLytXm39gjaFO0yptV13CWgrfUDlpzyIatvFHkAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame46 [
	"Private - Generated method"
	<script: 'self frame46 inspect'>
	^ self icons
		at: #frame46
		ifAbsentPut: [ Form fromBinaryStream: self frame46Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame46Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/46_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAZNJREFUWEftVqFOA0EQ3doaBB4wWCwfABL6BRUgMSS4fkIdCQYJol/QIuEDsFgUBIvANDjI2+Ylj7nZvdv0SM2uuetkZt6bN7PTG4QNn8GG8UMlUBWoClQFqgK9KTAe3fxgrc/mlzGn/Z1a+b0QANjt7CBcjF/+ELA2j0TvBBTkXwlQYgKenZ80Cjw8eo82KKOHbYKtkwIWDIGoTs/z006SAEkwRluVJUBgrQ5VIYESUPD7u4cAf62erSgiAPCUrCBwPR3Fiq8m8wjIAwJKTskyDjFsQ1IBjwCr0r7aVuS+sDgLrTNgpVfgLp9w3x97rptWToeGAqzcSukNnO0zfAj++RrC9v4qiu+tBBTcm3TY7LRbEqnqOS8qf+Ma6vrkdvO0JAnbGnvfbawFz+6BtiG0ye1V9MC8YopuQZcBhA/mZy0Cp8fTuNa2hsM33nEk1ePZ1fa1XO7Cf/E4We3jxGkoQHCPAJNaYrB7NmLmSGQJkASeBGdSAFq7Z2tTwZ0BVaFr31N+xS1YF7A0vtPfcWnSEv9f4Zn9IWFT1xMAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame48 [
	"Private - Generated method"
	<script: 'self frame48 inspect'>
	^ self icons
		at: #frame48
		ifAbsentPut: [ Form fromBinaryStream: self frame48Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame48Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/48_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAbtJREFUWEftliFPA0EQhbeO1JAUSwBTgcEikCAQ0F9QARISmuAqkIg6kgqQIPoLChJ+ABaDqAGCIoEE0yBISt417zI3nb3uHk1qbk17c7v7vnkzu23FzXlU5qzvSoDSgdKB0oHSgZk50Gx0R7jWe/1Wsqd+9l35MwGA2FVvwx01nzIAOmZBFAaQGUoAKWJBSZfwvRAABbEBssY4ONybSHBz+y2JcQ6A+MxSBQEwW52dfH58WPECUDQagMIyO2SFjC46jURwYfnFSfGb67vEDZk9S8E1p+1+2iteByAeYqu2HwDM1Mo8uAcsAGZV9F+UPCXcw3RAWx8r/PO+ZjJK670AzFxbaTWcrjPmUPxz4NxSfbyK36cCSHEslLUkgO52DeHLHusBUNv9cN3j89T5TAmsy8XykhC6NDzvvh7ZOvlNXj0PvlKIqFOQ1wv6KPKiIUzr8my0Xq9lxPEuCiC0+9E/GgBrASHt9wLs73SSa22xWn3lXYBN5bDiMvY9HK5i/u19e3wfe8aEAxS3ALipBkPcilEzDyIXgBD4pDg3haCOW7FpLpg9IF0IrbtvXnQJ/isYuz7o5zh205j5f5CLEzD4NnjLAAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame49 [
	"Private - Generated method"
	<script: 'self frame49 inspect'>
	^ self icons
		at: #frame49
		ifAbsentPut: [ Form fromBinaryStream: self frame49Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame49Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/49_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAb5JREFUWEftlqFOgzEUhTtHZkiGJYCZwGARSBAI2BNMgISEJbgJJGKOZAIkiD3BQMIDYDGIGSAoEkgwC4Jk5HQ5y113W9p/S2Zas/33b3u+e3p7t5KZ8yjNWd9kgOxAdiA7kB2YmQP1WnuAtt7pNuye7rOv5c8EAGJXnQ1zVH8aA3BjGkRhAJmhBJAiGpR0Cd8LAVAQGyBrjIPDvYkEN7ffbIxzAMRnHlUUALN1s5PPjw8rXgCKJgNQWGaHrJDRRatmBReWX4wUv7m+s27I7HkUXHPa7I5qxesAxGNsde0HADPVMo+uAQ2AWU3zL0reFG8RutYXEf55X1M5pf0qADN3rdQKToIhM1pP8c+eMUvV4Up+DwJIcSySZ0kAt9o1CF/22AMAld0P0z4+t/U3VoRac9F8JIR2NLzzvjrZOvm1r557XxYi6RaEasG9imw0EqRxeTZYr1ZG4t4ixAvfNYy5AagfDQBrAUH7vQD7Oy3b1hbL5Vf2AmwqhxaXse9+fxXzb++bw37sGRNHQHENgJu6YIhrMWqGIIIAhMAnxbkpBN24FvvPBbUIpQsxZx6ak3wE0wqmro/6OU7dNGX+H81MEzBRWR56AAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame50 [
	"Private - Generated method"
	<script: 'self frame50 inspect'>
	^ self icons
		at: #frame50
		ifAbsentPut: [ Form fromBinaryStream: self frame50Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame50Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/50_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAcNJREFUWEftliFPQzEUhTtHZkiGJYCZwGARSBAI2C+YAAkJS3ATSMQcyQRIEPsFAwk/AItBzABBkUCCWRAkI6fjLJf77ivttmTm1Wyvr+35zrltt5KbcSvNWN8VAEUCRQJFAkUCU0ugXmsPcK13ug2/pn7Ou/KnAgCxi86aO6g//AHQfRbE2ADSoQSQIhaUTAnfxwKgIBaAa7S9/Z2MwfXNF9/HMQDiM0sVBUC32p18vr9bygWgaDIAhaU7uIKjs1bNC84tPjkpfnV549OQ7lkKzjludkd7JTcBiMfEquMHAJ1K5yxD9B6wAOhq3H9R8pRwDTMBHf2kwhJYQ2QA6FxHaW24ENjX64oZlKx/5hhKcbyUteRqerfrzYZxFH/vObdQHc7k938BuEnkWddWCKETQLyAznOPdQBQ2X5z7cNTn37SKQhFTiiULtQ2jr7968feh4dIAojd/YDgTSfnNM5PBqvVykg8N4HdrZa/1ubL5WfeBdqZ1S/7Pvv9Zaxxfdsc3se/DRCM3wSguAXARTUY+q0+imoICZQpgQQgBD4pzskQ1P1Wn5VCEAAvNURs7a1xIffBUzCJaMrcqJ/jlAVTx/4AY4gTMLjYNZcAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame51 [
	"Private - Generated method"
	<script: 'self frame51 inspect'>
	^ self icons
		at: #frame51
		ifAbsentPut: [ Form fromBinaryStream: self frame51Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame51Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/51_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAcNJREFUWEftliFPA0EQhbeO1JAUSwBTgcEikCAQ0F9QARISmuAqkIg6kgqQIPoLChJ+ABaDqAGCIoEE0yBISt427zKdzh67bZOaO9Pe3O6+772d27bk5nyV5qzvCoAigSKBIoEigZklUK+1BzjWO92GX1Pfh478mQBA7Kqz4Y7qTyMAumZBTAwgHUoAKWJByZTwfSIACmIBuMZ1cLg3ZnBz+83XOAZAvOdWRQHQrXYn7x8fVoIAFE0GoLB0B1dwdNGqecGF5RcnxW+u73wa0j23gnNOm92sV4IJQDwmVh0/AOhUOuc2RPeABUBXk/6Lkm8J1zAT0NFPK0yxKAA611FaDRcC+3lfM0OSe28mIMUxQO4lJ+huZ1NyLMU/e84tVYez+D0KgE0i33VthxAyAcQLiJB7rAGAyu6Hax+fZ1uf9Bbk9QKgsG1519bJr3/83PvKIJIAYrsfIDzpOKdxeTZYr1ZGxPHMBNjfafljbbFcfuVZoN1ZdVn77vdXscbtfXN4HjvnACHjNwEobgFwUQ2GulWjsITQKY4lIAEIgU+KcwEI6rpV0yn8C4ABGiJ2761xee6DPTCNYOrcqJ/j1EVTxv8BKDcTMA5lR08AAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame56 [
	"Private - Generated method"
	<script: 'self frame56 inspect'>
	^ self icons
		at: #frame56
		ifAbsentPut: [ Form fromBinaryStream: self frame56Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame56Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/56_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAActJREFUWEftlaFOA0EQhvccqWkCEgIYgsPyAFRCn6ACTBMMCa6PUEeCIamhok9QkPAAWBzBAAEJSU2DK/mv+ckwnb3bbbfUdM315nb3/+af2W3mFjyyBeu7JcDSgeQOPHU6o91mM+OzrMmTAkC0ur7qBh9fjk/AFEHMBYCCAPlXAAhLF8rEMT+pA8w8tP5zAyhrPPk9mQON+uUIG/f6Z/me+t0HlQQAYle9PXfaePwDoGMWxNQAMkMJIEUsKOnS1D1AQWyArDGOTw4nEtw/eMtjnAMgvrNUQQ4wW52dfH+43/QCUDQagMIyO2SFjC7a9VxwZePFSfHu9W3uhsyepeCa81b/t1e8DkA8xFZtPwCYqZV5cA9YAMwq5pzLufKUMG46oK2PFf5+3zYZpfVeAGaurbQaTtcZcyj++ezc2s54FX+XAkhxLJS1JIDudg3hyx7rgwDYJPKsaz8JoUvD8+7rEZ59+T3qFBT1gj6KlpgFFgUQ2v3on5kAjmrt/FqrViqvvAuwqRxWXMYGw+EW5t/ctcb3sWdMOEBxC4CbajDErRg1iyAKAQiBJ8W5KQR13IqVuWD2gHQhtO6+edElmFUwdn3Q33HspjHzfwDxeScwfOaVJwAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame57 [
	"Private - Generated method"
	<script: 'self frame57 inspect'>
	^ self icons
		at: #frame57
		ifAbsentPut: [ Form fromBinaryStream: self frame57Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame57Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/57_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAeJJREFUWEftlbFKA0EQhjedxCKglSgqiNjZ+gBaap4ghTYBG8Euj5BOsBHSaJEniJba2NkKFmKjonYKaYKd8m/4wziZvds1FwLiNcnO7e7//TOzeyU34ac0YX1XGMB9q/VFM2v1ekmPQ0YLAYBYZX5moNF9/XAYT6/M+djb9Z0DlAUxFgAtBKC/DQDHugzMQpZ7zCmkBBSzeiGUeq4pFICZkKch75gXDpAnqN//AxSWgVr12N+E7c6B31OPx3oTQuykve72a7c/AHSs0JtQOpQAUsSCkln69T1AQWwA13h297aHDG5sPvsY5wCIY5YqqgfoVruT45urxSAARZMBKCzdwRUcHTWrXnBq4dFJ8bPTC58N6Z6l4JrDRmfQK8EMQDwmrTr9AKBTy3l0D1gAdJV623G+PCWZ3wKd+lThz5dlk1GmPghA5zqVVsPpOmMOxd8fnJtd7a/i/1wAKY6FspYE0N2uIULusT4KgE0iz7rOJyF0aXjeQz3Csy/fJ52CrF7QR9ESs8CSAGK7H/0zEsDOVtNfa5Vy+Yl3ATaVjxWXsW6vt4T555eN/n0ceIYyQHELgJtqMMStGDWzIDIBCIFfinNTCOq4FcvLgtkDMguxdQ/NSy7BqIKp66M+x6mbpsz/BrGdNTCr7na+AAAAAElFTkSuQmCC'
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame58 [
	"Private - Generated method"
	<script: 'self frame58 inspect'>
	^ self icons
		at: #frame58
		ifAbsentPut: [ Form fromBinaryStream: self frame58Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame58Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/58_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAeFJREFUWEftlbFKA0EQhjdtLAJaiaCCiJ2tD6Cl5glSaBOwEezyCOkEGyGNFnmCaKmNna1gIVaK2imkCXbKv+GHcW729tbcGRC3yd5kb/9v/pndq7kpj9qU9d0/wN9y4L7X+0RPrbXbNTnP67PSHIBgY2HWaw1f3h3mMyvz7vX6zgOFICoBkGKA+RUAiEoX6ESeONaU5gCzJkQsc64vHYBOxDIvHaDVPPYnoD848Enp50qbEGIn/XW337r9BqBjFkQpJZAAUqRSAFpMwd297UyCG5tPPgZn5GCZfnwKmLHc9OZqMQhACDjCOSEKlUBni024GeZS/Oz0wsENmT1LkQxAYWkvNoalR92mz+awM/CCGBCXYlinn/Ee3ok6APEidZVOhI4a4+yFQj1gAdDWmNDH87K5RGaeexFp62PCtBqbUvztwbm51bEM54UAmDnraaXCppNghAhlz36R9meOoRTXnU4Qfdw0RF55tLgJgCAWWmddQ4RKI6/kWL8E74HUJtR3gZWtBZMEEMuG/6N/JgLY2er6e7VRrz/KS0YCWHEZG45GS1h/ftkZfxACI+MAxS0AbqrBELdi1MyDyAUgBH4pzk0hqONWLOaC2QPShaJ1D61LLsGkgqnvF/ocp26asv4LG58yMKIhAQgAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame59 [
	"Private - Generated method"
	<script: 'self frame59 inspect'>
	^ self icons
		at: #frame59
		ifAbsentPut: [ Form fromBinaryStream: self frame59Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame59Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/59_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAd5JREFUWEftVb1KA0EQ3nQSi4BWoqggYmfrA2ipeYIU2gRsBLs8QjrBRkijRZ4gWmpjZytYiI2K2imkCXbKt+GTcTO7t5vceY3b3N1kdr+fmdlUTMmrUjK++SeQqwP3nc4XSrrWbFbke6jMuREAYG1+xmL1Xz8M3qdX5szb9Z0l5CNRCAEJBjJ/QgCg0gU6EQJHTm4OUDVJZClnfu4E6ESW8kIJpFxuhThQCoFG/djeAd3egRXlfhc6hgA76a6b/cbtLwJuTCMxdgmkQklAgmikpEtjjyEBcQBUY+3ubY8I3Nh8tjHmgBC/WaooB6jWVSe/b64WvQQImkyAwFIdVEHRUbtuAacWHo0EPzu9sG5I9SwF9xy2ej+94nUA4DG2SvsBTjDfM7oHNAJUlTLnMldOSfAmdK1PBf58WVY5Suu9BKicdmonseZunZFL8PcHY2ZXh7v5nklAgmMjuzbU7S4Jn3qcEUWATSJn3XXBdYC/c959PcLZl78nTUGoF9xR1MA0YkkEYrsf/TMRgZ2ttr3WatXqE+8CHCqXFpex/mCwhPzzy9bwPvasEQcIrhHgoS4xxLUYMUMkggRIAk+C81AAunEtluWC2gPShdi6+/KSSzApYOr+qL/j1ENT8r8BtpA0MKG/POkAAAAASUVORK5CYII='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame60 [
	"Private - Generated method"
	<script: 'self frame60 inspect'>
	^ self icons
		at: #frame60
		ifAbsentPut: [ Form fromBinaryStream: self frame60Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame60Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/60_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAd1JREFUWEftlrFKA0EQhjedxCKglSgqiNjZ+gBaap4ghTYBG8Euj5BOsBHSaJEniJba2NkKFmKjonYKaYKd4d/wy7iZ3dsNdx6I1+RuMjf/N//OblIxJV+VkvXN3wK473S+4Ohas1mR9yGXc3MAgrX5GavVf/0wuJ9emTNv13cWyAdRCIAUA8yvAEBUukAnQuLIyc0Bdk2IrM6ZnzsAncjqvFCAlLOlEAf+AUpxoFE/tqdgt3dgl9V9LvQggthJd93sN25/ALgxDWLiIZQdSgApokFJl6IPIoq5xfGMrnHt7m2PNbix+WxjzAEQn7lUQQcoLIujKAqyGFVvrha9ABRNAoC4rysAHLXrVnBq4dFI8bPTC+uG7J5LwXcOW73vWfE6oAGwqLRV2g9xivk+o2bAtV4Kp+xxN1fuEu9vATtnN5ogLfeBfb4sq5zSehVAiiPBHTTE3GFzh5Li7w/GzK6OZHgfBcA14t6OdYA7w9c96mQCSLGsIdTAuN99c8K9L79P2gWxA4j50cS091WAna22PVVq1eoTzwIUlZcWl7H+YLCE/PPL1ug49FxjABTXAFjUBUNci1EzBBEEIAQ+Kc6iEHTjWizLheASxK55KC95CfIQTakx8f+BFJFQ7hCDPC4w5rJjGQAAAABJRU5ErkJggg=='
]

{ #category : 'accessing - icons' }
CMPurpleCow class >> frame61 [
	"Private - Generated method"
	<script: 'self frame61 inspect'>
	^ self icons
		at: #frame61
		ifAbsentPut: [ Form fromBinaryStream: self frame61Contents base64Decoded asByteArray readStream ]
]

{ #category : 'private - contents' }
CMPurpleCow class >> frame61Contents [
	"Private - Method generated with the content of the file File @ /Users/zaitsev/Downloads/Purple cow animation sprites/61_Purple cow animation sprites.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAd9JREFUWEftljFLA0EQhTdtLAJaiaCCiJ2tP0BLzS9IoU3ARrDLT0gn2AhptMgviJba2NkKFmKlqJ1CmmCnvA0PnpPdvTtyZxq3yTnM7vvmze5gzc141Was7/4BSnXgsdf7Rks32u2afqfaXBoABBtL815r+Pbp8D23tujebx88UAyiEgAVA8yfAEBUXaATKXHklOYAqyZEVuXMLx2ATmRVXilAkeFWiQMzAWg1T/0M6A+OfFH270qfIcTO+pvusHX/C8DGQhCltEABVKRSAFpMwf2D3YkCt7ZffAzO6GKbcs8BK4aNqE7X3c1yFIAQ3KOtSraAwlodqsIBCqDiF+dXDvlaPVtRCADiMVsBcNJt+oqPOwMviAVxFSOo/mIf9rANUQdCAKxK+2pbkZoBvAuZd8Bar8J5hszX62owTSuPjmJWTjtDJ7Hnts/IpfjHk3ML6+Pd/M4EUPHQTUfM3nYLEaue90Xtn3iGOj45XPI4wBz73u1eK56cA1mX0B5un2JILFRMoVeQ5wLyOU4FsLfT9WOtUa8/6xtXgFBcY8PRaAX5l9ed8TyOrAkHKB4C4KEWDPFQjJopiCQAIfBLcR4KQRsPxbJcCN4BdSFv32N5hVswrWDR/aX8Q1JUVPN/AGNzLjAu84ZUAAAAAElFTkSuQmCC'
]

{ #category : 'accessing' }
CMPurpleCow class >> icons [
	^ icons ifNil: [ icons := Dictionary new ]
]

{ #category : 'InspectorExtensions' }
CMPurpleCow class >> inspectionIcons [
	<inspectorPresentationOrder: 0 title: 'icons'>
	<script: 'self inspect'>
	^ SpTablePresenter new
		  addColumn: (SpImageTableColumn title: 'Icon' evaluated: #value);
		  addColumn: (SpStringTableColumn title: 'Name' evaluated: #key);
		  items:
			  ((self class selectorsInCategory: 'accessing - icons') sorted
				   collect: [ :each | each -> (self perform: each) ]);
		  yourself
]

{ #category : 'animations' }
CMPurpleCow class >> layingDown [
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
CMPurpleCow class >> loving [
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
CMPurpleCow class >> lying [
	<script: 'self lying inspect'>
	
	^ {
		self frame24 .
		self frame25 .
		self frame26
	}
]

{ #category : 'accessing - reset' }
CMPurpleCow class >> resetIcons [
	<script>
	^ icons := nil
]

{ #category : 'animations' }
CMPurpleCow class >> sleeping [
	<script: 'self sleeping inspect'>
	
	^ {
		self frame32 .
		self frame33 .
		self frame34 .
		self frame35
	}
]

{ #category : 'animations' }
CMPurpleCow class >> sniffing [
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
CMPurpleCow class >> standing [
	<script: 'self standing inspect'>
	
	^ {
		self frame00 .
		self frame01 .
		self frame02
	}
]

{ #category : 'animations' }
CMPurpleCow class >> walking [
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
