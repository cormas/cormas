"
I check that `CMVersion` reads the versions of Cormas and gives the catalog line they use.
"
Class {
	#name : 'CMVersionTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests-Model',
	#package : 'Cormas-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
CMVersionTest >> testDevVersionCountsAsItsMinor [

	self assert: ((CMVersion fromString: '1.0-dev') isNoNewerThan:
			 (CMVersion fromString: '1.0.0')).
	self assert: ((CMVersion fromString: '1.0') isNoNewerThan:
			 (CMVersion fromString: '1.0.0-dev'))
]

{ #category : 'tests' }
CMVersionTest >> testIsNoNewerThanComparesMajorsAndMinors [

	self assert: ((CMVersion fromString: '1.1') isNoNewerThan:
			 (CMVersion fromString: '1.2.0')).
	self assert: ((CMVersion fromString: '1.2') isNoNewerThan:
			 (CMVersion fromString: '1.2.0')).
	self deny: ((CMVersion fromString: '1.3') isNoNewerThan:
			 (CMVersion fromString: '1.2.9')).
	self deny: ((CMVersion fromString: '2.0') isNoNewerThan:
			 (CMVersion fromString: '1.9.0')).
	self assert: ((CMVersion fromString: '1.9') isNoNewerThan:
			 (CMVersion fromString: '2.0.0'))
]

{ #category : 'tests' }
CMVersionTest >> testIsWithinTheMajorOfComparesMinorsOfTheSameMajor [

	| version |
	version := CMVersion fromString: '1.1.2'.
	self assert:
		((CMVersion fromString: '1.0-dev') isWithinTheMajorOf: version).
	self assert:
		((CMVersion fromString: '1.1') isWithinTheMajorOf: version).
	self deny:
		((CMVersion fromString: '1.2') isWithinTheMajorOf: version).
	self deny:
		((CMVersion fromString: '0.9') isWithinTheMajorOf: version).
	self deny:
		((CMVersion fromString: '2.0') isWithinTheMajorOf: version)
]

{ #category : 'tests' }
CMVersionTest >> testLineOfADevVersionIsDev [

	self assert: (CMVersion fromString: '1.0.0-dev') line equals: 'dev'
]

{ #category : 'tests' }
CMVersionTest >> testLineOfAReleaseIsItsMajor [

	self assert: (CMVersion fromString: '1.2.3') line equals: '1'
]

{ #category : 'tests' }
CMVersionTest >> testMajorMinorStringLeavesOutThePatch [

	self
		assert: (CMVersion fromString: '1.2.3') majorMinorString
		equals: '1.2'
]

{ #category : 'tests' }
CMVersionTest >> testMajorMinorStringOfADevVersionKeepsDev [

	self
		assert: (CMVersion fromString: '1.0.0-dev') majorMinorString
		equals: '1.0-dev'
]

{ #category : 'tests' }
CMVersionTest >> testPrintsAsItIsWritten [

	self
		assert: (CMVersion fromString: '1.0.0-dev') printString
		equals: '1.0.0-dev'.
	self
		assert: (CMVersion fromString: '2.1') printString
		equals: '2.1.0'
]

{ #category : 'tests' }
CMVersionTest >> testReadsADevVersion [

	| version |
	version := CMVersion fromString: '1.0.0-dev'.
	self assert: version isDev.
	self assert: version major equals: 1
]

{ #category : 'tests' }
CMVersionTest >> testReadsMajorMinorAndPatch [

	| version |
	version := CMVersion fromString: '2.3.4'.
	self assert: version major equals: 2.
	self assert: version minor equals: 3.
	self assert: version patch equals: 4.
	self deny: version isDev
]

{ #category : 'tests' }
CMVersionTest >> testRefusesWhatIsNotAVersion [

	#( 'one' '1' '1.x' '1.0.0-beta' '' ) do: [ :each |
		self should: [ CMVersion fromString: each ] raise: Error ]
]

{ #category : 'tests' }
CMVersionTest >> testShortVersionHasNoPatch [

	self assert: (CMVersion fromString: '1.2') patch equals: 0
]
