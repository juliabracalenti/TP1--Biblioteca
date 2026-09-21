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

{ #category : 'testing' }
MaterialCatalogado class >> isAbstract [
	^true.
]

{ #category : 'accessing' }
MaterialCatalogado >> anioDeEdicion [
"getter año de edición"
^anioDeEdicion 
]

{ #category : 'accessing' }
MaterialCatalogado >> anioDeEdicion: unAnio [
"setter año de edición"
anioDeEdicion := unAnio .
]

{ #category : 'accessing' }
MaterialCatalogado >> autores [
"getter autores copia"
	|autorescopia|
autorescopia:=autores.
^autorescopia 
]

{ #category : 'accessing' }
MaterialCatalogado >> autores: unAutor [
"setter autores"

autores ifNil: [ autores:= OrderedCollection new. ].
autores add: unAutor. 
]

{ #category : 'accessing' }
MaterialCatalogado >> editorial [
"getter editorial"
^editorial 
]

{ #category : 'accessing' }
MaterialCatalogado >> editorial: unaEditorial [

"setter editorial"
editorial:=unaEditorial .
]

{ #category : 'accessing' }
MaterialCatalogado >> identificador [
"devuelve el ISBN o el ISSN+num según corresponda"
^identificador 
]

{ #category : 'accessing' }
MaterialCatalogado >> identificador: unIdentificador [
 "setter identificador"
identificador :=unIdentificador .
]

{ #category : 'accessing' }
MaterialCatalogado >> paginas [
"getter paginas"
^paginas 
]

{ #category : 'accessing' }
MaterialCatalogado >> paginas: cantidadPaginas [
	"setter cantidad de paginas"
paginas:= cantidadPaginas .
]

{ #category : 'as yet unclassified' }
MaterialCatalogado >> plazoVencimiento [
	"getter días de vencimiento de material para devolver"
^self subclassResponsibility 
]

{ #category : 'accessing' }
MaterialCatalogado >> titulo [
"getter titulo"
^titulo 
]

{ #category : 'accessing' }
MaterialCatalogado >> titulo: unTitulo [
"setter titulo"
titulo :=unTitulo.
]
