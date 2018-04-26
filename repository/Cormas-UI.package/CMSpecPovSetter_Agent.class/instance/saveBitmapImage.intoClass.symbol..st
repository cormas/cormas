saving&removing pov symbols
saveBitmapImage: aPOV intoClass: aClass symbol: aSymbol
	"Dans le cas d'image Bitmap, l'image est sauvegard√©e au niveau de la classe de l'entit√© /// protocol 'images - bitmap'
(dans le cas d'un VectorialPOV, la sauveagrde se fait au niveau du fichier ev, dans le cas on inscrit l'ensemble des attributs de l'image).
Par contre l'attribut position du POV, m√™me pour un POV d type Bitmap image,est sauvegard√© adans le fichier ev "
	
	| image s class imageName |
	aPOV isBitmapPOV
		ifTrue:
			[image := aPOV bitmap figure image.
			class := aClass class.
			imageName := aSymbol , 'BitmapImage'.
			s := WriteStream on: (String new: image bits size // 8).
			s
				nextPutAll: imageName;
				cr.
			s
				tab;
				crtab;
				nextPutAll: '<resource: #image>';
				crtab;
				nextPut: $^.
			s nextPutAll: image minimalStorageString.
			class
				compile: s contents
				classified: 'pov symbols']