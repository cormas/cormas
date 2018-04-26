+ utilities - mathematics
mode: aCollectionOfNumbers
	"Answer an array of the most frequent values of a set of numbers. 
aCollectionOfNumbers = < OrderedCollection> or <Array>
ex:		Cormas mode: #( 1 2 3 3 3 3 3) => #(3)
ex:		Cormas mode: #( 1 1 1 0 2 6 7 3 3 3) => #(1 3)"
	
	| bestFrequency winners count |
    bestFrequency := 0.
    winners := OrderedCollection new.
    aCollectionOfNumbers
        do:
            [:aNb |
            count := (aCollectionOfNumbers select: [:anElement | aNb = anElement]) size.
            bestFrequency = count ifTrue: [winners add: aNb].
            bestFrequency < count
                ifTrue:
                    [bestFrequency := count.
                    winners := OrderedCollection with: aNb]].
    ^winners asSet asArray