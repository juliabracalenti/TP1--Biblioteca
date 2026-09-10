"
Representa a una persona que particularmente es socio de la biblioteca

*numero: numero de socio (único para cada lector)
*moroso: booleano que representa si el lector está penalizado actualmente (de ser true no se puede llevar libros)
"
Class {
	#name : 'Lector',
	#superclass : 'Object',
	#instVars : [
		'numero',
		'cuit',
		'nombre',
		'apellido',
		'moroso'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}
