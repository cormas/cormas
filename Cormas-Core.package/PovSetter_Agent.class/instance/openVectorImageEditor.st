editor
openVectorImageEditor
	
	| editor |
	"editor := VectorialImageEditor example."
	editor := VectorialImageEditor open.
	editor observer: self.
	editor loadCurrentImage