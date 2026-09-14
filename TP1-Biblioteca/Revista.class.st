"
Representa una revista (hereda de material catalogado)

*identificador: numero que identifica el ejemplar
el plazo de un préstamo de una revista es de 7 días sin excepción
"
Class {
	#name : 'Revista',
	#superclass : 'MaterialCatalogado',
	#instVars : [
		'plazoPrestamo',
		'numeroRevista',
		'mesEdicion'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'as yet unclassified' }
Revista >> plazoVencimiento [ 
	"getter días de vencimiento"
^plazoPrestamo 
]
