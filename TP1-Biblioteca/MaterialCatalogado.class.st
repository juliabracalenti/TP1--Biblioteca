"
Representa todos los libros y revistas que son propiedad de la biblioteca que pueden estar relacionados con un préstamo 
"
Class {
	#name : 'MaterialCatalogado',
	#superclass : 'Object',
	#instVars : [
		'identificador',
		'titulo',
		'autores',
		'editorial',
		'anioDeEdicion',
		'paginas'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'accessing' }
MaterialCatalogado >> plazoVencimiento [
	"getter días de vencimiento de material para devolver"
^self subclassResponsibility 
]
