"
Representa a un libro (hereda de material catalogado)

*identificador: numero que identifica el ejemplar
*el plazo de préstamo es de 15 días sin excpeción
"
Class {
	#name : 'Libro',
	#superclass : 'MaterialCatalogado',
	#instVars : [
		'plazoPrestamo'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'as yet unclassified' }
Libro >> plazoVencimiento [ 
	"getter días de vencimiento"
^plazoPrestamo 
]
