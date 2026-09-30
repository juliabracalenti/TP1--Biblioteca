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
	^ #(#(#(#RGClassDefinition #(#FakeDateAdapter)) #'2026-09-30T19:56:21.186593-03:00') )
]

{ #category : 'code-critics' }
ManifestTP1Biblioteca class >> ruleExcessiveArgumentsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#FakeDateAdapter #forzarDia:mes:anio:hora:minuto: #false)) #'2026-09-30T20:15:11.044134-03:00') )
]

{ #category : 'code-critics' }
ManifestTP1Biblioteca class >> ruleNotEliminationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Biblioteca #prestamosVigentes #false)) #'2026-09-30T20:06:09.331905-03:00') )
]

{ #category : 'code-critics' }
ManifestTP1Biblioteca class >> ruleReClassNotCategorizedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#FakeDateAdapter)) #'2026-09-30T19:56:33.893043-03:00') )
]

{ #category : 'code-critics' }
ManifestTP1Biblioteca class >> ruleTempsReadBeforeWrittenRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Biblioteca #prestar:a: #false)) #'2026-09-30T20:08:32.883429-03:00') )
]
