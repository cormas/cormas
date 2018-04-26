+ initialize-release
reset
	"super reset."
	"-> il ne faut pas faire un super reset sinon ca envoi un leave √† allOccupants"
	"on reprend donc du coup les appellent d''un reset en ometant le initOcc"
	
	request := nil.
	self resetFlag.
	theCSE := nil.
	includedEntities := nil.
	components := nil.
	type := #unknow.
	outline := nil