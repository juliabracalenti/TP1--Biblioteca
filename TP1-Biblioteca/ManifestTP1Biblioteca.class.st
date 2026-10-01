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
ManifestTP1Biblioteca class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'Biblioteca class' #abrirTranscript #true)) #'2026-10-01T14:45:02.70451-03:00') #(#(#RGMethodDefinition #(#Biblioteca #abrirTranscript #false)) #'2026-10-01T14:46:14.827419-03:00') )
]

{ #category : 'code-critics' }
ManifestTP1Biblioteca class >> ruleExcessiveArgumentsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#FakeDateAdapter #forzarDia:mes:anio:hora:minuto: #false)) #'2026-09-30T20:15:11.044134-03:00') #(#(#RGMethodDefinition #(#Libro #inicializarTodosLosAtributosisbn:titulo:autores:editorial:anio:paginas: #false)) #'2026-10-01T14:14:10.047633-03:00') #(#(#RGMethodDefinition #(#Revista #inicializarTodosLosAtributosissn:titulo:autores:editorial:anio:paginas:numero:mesDeEdicion: #false)) #'2026-10-01T14:19:55.166041-03:00') )
]

{ #category : 'code-critics' }
ManifestTP1Biblioteca class >> ruleInstVarInSubclassesRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#MaterialCatalogado)) #'2026-10-01T14:20:35.547297-03:00') )
]

{ #category : 'code-critics' }
ManifestTP1Biblioteca class >> ruleNotEliminationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Biblioteca #prestamosVigentes #false)) #'2026-09-30T20:06:09.331905-03:00') )
]

{ #category : 'code-critics' }
ManifestTP1Biblioteca class >> ruleReClassNotCategorizedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#FakeDateAdapter)) #'2026-09-30T19:56:33.893043-03:00') #(#(#RGClassDefinition #(#MaterialCatalogado)) #'2026-10-01T14:20:37.61231-03:00') )
]

{ #category : 'code-critics' }
ManifestTP1Biblioteca class >> ruleTempsReadBeforeWrittenRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Biblioteca #prestar:a: #false)) #'2026-09-30T20:08:32.883429-03:00') #(#(#RGMethodDefinition #(#Biblioteca #agregarLector: #false)) #'2026-10-01T13:16:24.017897-03:00') #(#(#RGMethodDefinition #(#Biblioteca #catalogar: #false)) #'2026-10-01T13:26:17.087531-03:00') )
]

{ #category : 'code-critics' }
ManifestTP1Biblioteca class >> ruleUsesWorldGlobalRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'Biblioteca class' #abrirTranscript #true)) #'2026-10-01T14:45:09.233619-03:00') )
]
