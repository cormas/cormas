"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCormasUI,
	#superclass : #PackageManifest,
	#category : 'Cormas-UI-Core'
}

{ #category : #'code-critics' }
ManifestCormasUI class >> ruleRBSentNotImplementedRuleV1FalsePositive [
	^ #(#(#(#RGPackage #(#'Cormas-UI')) #'2017-09-22T14:27:39.111431-03:00') )
]
