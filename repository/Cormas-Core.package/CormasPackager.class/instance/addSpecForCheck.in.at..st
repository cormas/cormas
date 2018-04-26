interface opening
addSpecForCheck: aPackagingCheck in: aBuilder at: position
	"add dynamically a widget for aPackagingCheck"
	
	| aSpec layout |
	layout := (position extent: -20 @ 50) asOffsetLayout.
	layout rightFraction: 1.
	aSpec := ArbitraryComponentSpec
		named: aPackagingCheck name
		layout: layout.
	aSpec hasBorder: false.
	aSpec component: (PackagingCheckView model: aPackagingCheck).
	aBuilder add: aSpec