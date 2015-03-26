actions
removeClient
	"remove the selected client"
	
	self clients selection ifNotNil: [:s | self removeClient: s]