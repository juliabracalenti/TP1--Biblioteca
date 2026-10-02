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
ManifestTP1Biblioteca class >> ruleClassNotReferencedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#FakeDateAdapter)) #'2026-10-02T20:01:29.146964-03:00') #(#(#RGClassDefinition #(#Libro)) #'2026-10-02T20:05:25.901034-03:00') )
]

{ #category : 'code-critics' }
ManifestTP1Biblioteca class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Biblioteca #abrirTranscript #false)) #'2026-10-02T20:00:19.377422-03:00') )
]

{ #category : 'code-critics' }
ManifestTP1Biblioteca class >> ruleExcessiveArgumentsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#'TP1-Biblioteca')) #'2026-10-02T20:01:41.467803-03:00') )
]

{ #category : 'code-critics' }
ManifestTP1Biblioteca class >> ruleReClassNotCategorizedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#DatePort)) #'2026-10-02T20:01:22.041431-03:00') #(#(#RGClassDefinition #(#FakeDateAdapter)) #'2026-10-02T20:01:32.002484-03:00') #(#(#RGPackageDefinition #(#'TP1-Biblioteca')) #'2026-10-02T20:02:13.249727-03:00') )
]

{ #category : 'code-critics' }
ManifestTP1Biblioteca class >> ruleTempsReadBeforeWrittenRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#Biblioteca)) #'2026-10-02T20:00:53.886705-03:00') #(#(#RGMethodDefinition #(#MaterialCatalogado #esDeAutor: #false)) #'2026-10-02T20:03:07.448303-03:00') )
]

{ #category : 'code-critics' }
ManifestTP1Biblioteca class >> ruleUsesWorldGlobalRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Biblioteca #abrirTranscript #false)) #'2026-10-02T20:00:21.463196-03:00') )
]
