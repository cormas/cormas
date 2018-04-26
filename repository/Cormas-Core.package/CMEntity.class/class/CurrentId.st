- accessing
CurrentId
	"Getter accessor with default value = 0 "
	
	^CurrentId ifNil: [CurrentId := 0]