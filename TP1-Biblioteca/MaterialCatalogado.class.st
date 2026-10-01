"
Representa todos los libros y revistas que son propiedad de la biblioteca que pueden estar relacionados con un préstamo 
"
Class {
	#name : 'MaterialCatalogado',
	#superclass : 'Object',
	#instVars : [
		'titulo',
		'autores',
		'editorial',
		'anioDeEdicion',
		'paginas',
		'descripcion'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'testing' }
MaterialCatalogado class >> isAbstract [ 
	^true.
]

{ #category : 'getter' }
MaterialCatalogado >> anioDeEdicion [ 
"getter año de edición"
^anioDeEdicion 
]

{ #category : 'accessing' }
MaterialCatalogado >> anioDeEdicion: unAnio [
"setter año de edición"
anioDeEdicion := unAnio .
]

{ #category : 'getter' }
MaterialCatalogado >> autorPrincipal [ 
"getter autorPrincipal"

^ autores ifNil: [  nil. ] ifNotNil: [autores at: 1 .]


]

{ #category : 'getter' }
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

{ #category : 'abstract' }
MaterialCatalogado >> codigo [ 
"devuelve el ISBN o el ISSN+num según corresponda"
^self subclassResponsibility

]

{ #category : 'getter' }
MaterialCatalogado >> descripcion [ 
 "getter descripcion"
^descripcion

]

{ #category : 'accessing' }
MaterialCatalogado >> descripcion: unString [ 
 "setter descripcion"
descripcion :=unString.

]

{ #category : 'getter' }
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
MaterialCatalogado >> esDeAutor: unnombre [ 
"Bool que dice si esta un unnombre entre los autores"
|estaAutor|
autores 
	ifNil: [estaAutor:=false.] 
	ifNotNil: [estaAutor:= autores anySatisfy: [:autor | autor = unnombre ]].
^estaAutor 


]

{ #category : 'getter' }
MaterialCatalogado >> paginas [ 
"getter paginas"
^paginas 

]

{ #category : 'accessing' }
MaterialCatalogado >> paginas: cantidadPaginas [
	"setter cantidad de paginas"
paginas:= cantidadPaginas .
]

{ #category : 'abstract' }
MaterialCatalogado >> plazoEnDias [ 
	"getter días de vencimiento de material para devolver"
^self subclassResponsibility 
]

{ #category : 'accessing' }
MaterialCatalogado >> plazoVencimiento [
	"getter días de vencimiento de material para devolver"
^self subclassResponsibility 
]

{ #category : 'accessing' }
MaterialCatalogado >> plazoVencimiento: unaCantidadDeDias [
^self subclassResponsibility 
]

{ #category : 'abstract' }
MaterialCatalogado >> tipo [ 
 "getter tipo"
^self subclassResponsibility

]

{ #category : 'abstract' }
MaterialCatalogado >> tipoDeIdentificador [ 
 "getter tipoDeIdentificador"
^self subclassResponsibility

]

{ #category : 'getter' }
MaterialCatalogado >> titulo [ 
"getter titulo"
^titulo 


]

{ #category : 'accessing' }
MaterialCatalogado >> titulo: unTitulo [
"setter titulo"
titulo :=unTitulo.
]
