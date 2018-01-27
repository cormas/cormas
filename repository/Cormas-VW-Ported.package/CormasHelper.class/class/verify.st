unit tests
verify
	"
	self verify
	"
	
	self
		assert: 'abc' cormasHelper isTypeString
		equals: true.
	self
		assert: 'abc' cormasHelper isTypeArray
		equals: false.
	self
		assert: #(#abc) cormasHelper isTypeArray
		equals: true.
	self
		assert: #abc cormasHelper isTypeString
		equals: true.
	self
		assert: 123 cormasHelper isTypeNumber
		equals: true.
	self
		assert: 123 cormasHelper isTypeString
		equals: false.
	self
		assert: 'abc' cormasHelper nullValue
		equals: ''.
	self
		assert: #abc cormasHelper nullValue
		equals: #?.
	self
		assert: true cormasHelper nullValue
		equals: false.
	self
		assert: 123 cormasHelper nullValue
		equals: 0.
	Dialog warn: 'all tests success'