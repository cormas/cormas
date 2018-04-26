display liens
thisLevel: a to: b withGC: aGC
	
	| r o e |
	r := adaptor imageEtDico geometric bounds width / 2 floor.
	(a center - b center) rrr = 0 ifTrue: [^self].
	o := a center + ((b center - a center) unitVector * r).
	e := b center + ((a center - b center) unitVector * r).
	(a level = b level & a level) = level
		ifTrue:
			[aGC paint: (ColorValue perform: #black).
			aGC displayLineFrom: o to: e.
			^self].
	a level = level
		ifTrue:
			[aGC paint: (ColorValue perform: #red).
			aGC
				displayLineFrom: o
				to: o + ((e - o) unitVector * 10)].
	b level = level
		ifTrue:
			[aGC paint: (ColorValue perform: #red).
			aGC
				displayLineFrom: e
				to: e + ((o - e) unitVector * 10)]