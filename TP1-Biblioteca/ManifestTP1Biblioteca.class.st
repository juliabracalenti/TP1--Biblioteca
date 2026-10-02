"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestTP1Biblioteca',
	#superclass : 'PackageManifest',
	#category : 'TP1-Biblioteca-Manifest',
	#package : 'TP1-Biblioteca',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestTP1Biblioteca class >> ruleTempsReadBeforeWrittenRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Biblioteca #identificarSocio: #false)) #'2026-10-02T10:26:59.132081-03:00') )
]
