private - irregular polygons creation
setImagesPolygons: aCollec
	"Les coordonnees originales des polygones sont stockees dans outline"
	"Calcul des coordonnees ajustees a la fenetre de la grille spatiale"
	"Ces coordonnees relatives sont stockees dans image"
	"Les coordonnees initiales du centre du polygone sont remplacees par celles du centre relatif"
	
	| Rw Rh vhWidth vhHeight coordonneesRecalibrees newPoint polyline newX newY entity Ratio rectangleTotal |
	aCollec isEmpty ifTrue: [^nil].
	entity := aCollec first class.	"Si on n'a pas trace des contours min et max de ce type d'entite, 
on a bien du les fabriquer a partir des contours d'autres entites..."
	rectangleTotal := entity bounds.
	rectangleTotal isNil ifTrue: [self halt].
	vhWidth := self bounds width - 5.	"10"
	vhHeight := self bounds height - 5.	"10"
	Rw := vhWidth / rectangleTotal width.
	Rh := vhHeight / rectangleTotal height.
	Ratio := Rh min: Rw.
	aCollec
		do:
			[:b | 
			coordonneesRecalibrees := OrderedCollection new.
			b outline
				do:
					[:unPoint | 
					newX := ((unPoint x - rectangleTotal origin x) * Ratio) rounded + 5.
					newY := vhHeight
						- ((unPoint y - rectangleTotal origin y) * Ratio) rounded + 5.
					newPoint := newX @ newY.
					coordonneesRecalibrees add: newPoint].
			polyline := Polyline vertices: coordonneesRecalibrees.
			self
				entityFiguresAt: b
				put: polyline asFiller	"b center isNil ifFalse: [b center x: ((b center x - entity bounds origin x) * Ratio) rounded + 5.
			b center y: vhHeight - ((b center y - entity bounds origin y) * Ratio) rounded + 5]"]