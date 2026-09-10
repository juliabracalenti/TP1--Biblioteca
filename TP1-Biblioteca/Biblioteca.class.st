"
Es la clase que representa el dominio completo, por lo cual solo podrá crearse una única instancia.
Todo lo que se le pide al sistema se le pide a una instancia de Biblioteca: es la fachada del sistema. Coordina toda la interacción y lleva el registro de préstamos

*nombre: el de la biblioteca
*catalogo: lista material catalogado (Hay un solo ejemplar de cada material)
*lectores: lista socios/lectores
*prestamos: lista historial de prestamos (activos y no activos).
"
Class {
	#name : 'Biblioteca',
	#superclass : 'Object',
	#instVars : [
		'nombre',
		'datePort',
		'catalogo',
		'lectores',
		'prestamos'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}
