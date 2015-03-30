display liens
oneLevel: a to: b withGC: aGC
	
	| r o e |
	r := 1.	"(adaptor imageEtDico geometric bounds width / 2 floor)"
	(b center - a center) rrr = 0 ifTrue: [^self].
	o := a center + ((b center - a center) unitVector * r).
	e := b center + ((a center - b center) unitVector * r).
	aGC paint: (ColorValue perform: #black).
	aGC displayLineFrom: o to: e