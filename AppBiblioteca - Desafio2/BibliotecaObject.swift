//
//  BibliotecaObject.swift
//  AppBiblioteca - Desafio2
//
//  Created by Felipe Nery Guevara Guevara on 24/01/22.
//

import Foundation
import UIKit

class MenuLibros{
    
    var titulo: String?
    var libros : [Libro]?
    
    init(titulo: String, libros: [Libro]){
        self.titulo = titulo
        self.libros = libros
    }
    
}

class Libro{
    
    var nombre: String?
    var imagen: String?
    var autor: String?
    var categoria: String?
    var descripcion: String?
    var detalles: String?
    var fotoAutor: String?
    var bio: String?
    
    init(nombre: String, imagen: String, autor: String, categoria: String, descripcion: String, detalles: String, fotoAutor: String, bio: String){
        self.nombre = nombre
        self.imagen = imagen
        self.autor = autor
        self.categoria = categoria
        self.descripcion = descripcion
        self.detalles = detalles
        self.fotoAutor = fotoAutor
        self.bio = bio
    }
    
}


class MenuCategorias{
    
    var titulo: String?
    var categorias: [Categoria]?
    
    init(titulo: String, categorias: [Categoria]){
        self.titulo = titulo
        self.categorias = categorias
    }
    
}

class Categoria{
    
    var nombre: String?
    var libros: [Libro]?
    
    init(nombre: String, libros: [Libro]){
        self.nombre = nombre
        self.libros = libros
    }
    
}

class MenuAutores{
    
    var titulo: String?
    var autores: [Autor]?
    
    init(titulo: String, autores: [Autor]){
        self.titulo = titulo
        self.autores = autores
    }
    
}

class Autor{
    
    var nombre: String?
    var libros: [Libro]?
    
    init(nombre: String, libros: [Libro]){
        self.nombre = nombre
        self.libros = libros
    }
    
}


