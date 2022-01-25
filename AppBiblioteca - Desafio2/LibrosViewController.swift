//
//  LibrosViewController.swift
//  AppBiblioteca - Desafio2
//
//  Created by Felipe Nery Guevara Guevara on 24/01/22.
//

import UIKit

class LibrosViewController: UIViewController {
    
    var width = UIScreen.main.bounds.width
    var heigth = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    func getData(){
        
        let lazosDeAmor = Libro(nombre: "Lazos de amor", imagen: "LazosDeAmor", autor: "Brian Weiss", categoria: "Ficción", descripcion: "Una maravillosa historia de amor entre dos seres perdidos que encontrarán definitivamente su destino.", detalles: "Detalles del libro Lazos de Amor", fotoAutor: "Brian", bio: "Brian Leslie Weiss es un psiquiatra estadounidense. Sus investigaciones incluyen la reencarnación, la regresión a vidas pasadas, la progresión a vidas futuras y la supervivencia del alma humana después de la muerte.")
        
        let muchasVidas = Libro(nombre: "Muchas vidas, muchos maestros", imagen: "MuchasVidas", autor: "Brian Weiss", categoria: "Autoayuda", descripcion: "La historia real de un psiquiatra, su joven paciente y la terapia de regresión que cambió sus vidas para siempre.", detalles: "Detalles del libro Muchas vidas, muchos maestros.", fotoAutor: "Brian", bio: "Brian Leslie Weiss es un psiquiatra estadounidense. Sus investigaciones incluyen la reencarnación, la regresión a vidas pasadas, la progresión a vidas futuras y la supervivencia del alma humana después de la muerte.")
        
        let muerte = Libro(nombre: "Muerte, morir, inmortalidad", imagen: "Muerte", autor: "Federico Ortiz Quezada", categoria: "Autoayuda", descripcion: "Un libro de aliento y alivio que muestra la enorme complejidad del fenómeno que llamamos muerte.", detalles: "Detalles del libro Muerte, morir, inmortalidad", fotoAutor: "Federico", bio: "Federico Ortiz Quezada (Ciudad de México, 1935) es Médico Cirujano (1959) por la Escuela Nacional de Medicina; realizó su posgrado en Urología en el Hospital General de la Ciudad de México y en la Universidad de Cornell en Nueva York.")
        
        let laOdisea = Libro(nombre: "La odisea", imagen: "LaOdisea", autor: "Homero", categoria: "Ficción", descripcion: "He aquí uno de los más grandes poemas épicos de todos los tiempos: Odisea. en él se narra el regreso del héroe, Odiseo, a su patria, Ítaca, después de la conquista de Troya.Compuesta como la Ilíada en hexámetros, recoge numerosos cuentos populares y leyen", detalles: "Detalles del libro La odisea", fotoAutor: "Homero", bio: "Homero es el autor de La Ilíada y La Odisea, los dos mayores poemas épicos griegos. No se sabe nada sobre Homero personalmente; ni siquiera se sabe con certeza si hay un único y verdadero autor de estas dos obras. Se cree que Homero era un jonio del siglo IX u VIII a.C. Aunque los historiadores discuten sobre el hombre, su impacto en la literatura, la historia y la filosofía es tan importante que es casi inconmensurable.")
        
        let elClub = Libro(nombre: "El club de los psicópatas", imagen: "ElClub", autor: "John Katzenbach", categoria: "Ficción", descripcion: "Alpha, Bravo, Charlie, Delta y Easy se hacen llamar los Muchachos de Jack, en honor a Jack el destripador. Entre ellos no se conocen más que por una plataforma en la Deep Web donde comparten su verdadera pasión: llegar a ser artistas del asesinato.", detalles: "Detalles del libro El club de los psicópatas", fotoAutor: "John", bio: "John Katzenbach es uno de los autores más importantes de novela negra en el mundo; muchas de sus novelas han sido adaptadas al cine y a la televisión. Posee también una larga trayectoria como periodista en temas judiciales.")
        
        let laHistoria = Libro(nombre: "La historia del loco", imagen: "LaHistoria", autor: "John Katzenbach", categoria: "Suspenso", descripcion: "Katzenbach se introduce en la agitada mente de Francis, demostrando un gran conocimiento del lado oscuro de la psique humana y ofreciéndonos un thriller tan tenso y adictivo como El Psicoanalista.", detalles: "Detalles del libro La historia del loco", fotoAutor: "John", bio: "John Katzenbach es uno de los autores más importantes de novela negra en el mundo; muchas de sus novelas han sido adaptadas al cine y a la televisión. Posee también una larga trayectoria como periodista en temas judiciales.")
        
        let laChica = Libro(nombre: "La chica del tren", imagen: "LaChica", autor: "Paula Hawkins", categoria: "Suspenso", descripcion: "Rachel toma siempre el tren de las 8.04 h. Algo sucede muy deprisa, pero es suficiente. ¿Y si Jess y Jason no son tan felices como ella cree? ¿Y si nada es lo que parece? ", detalles: "Detalles del libro La chica del tren", fotoAutor: "Paula", bio: <#T##String#>)
        
        let ficcion = Categoria(nombre: "Ficción", libros: [lazosDeAmor, laOdisea, elClub])
        
        let autoayuda = Categoria(nombre: "Autoayuda", libros: [muchasVidas, muerte])
        
        let suspenso = Categoria(nombre: "Suspenso", libros: [laHistoria])
        
        let brianWeiss = Autor(nombre: "Brian Weiss", libros: [muchasVidas, lazosDeAmor])
        
        let federicoOrtiz = Autor(nombre: "Federico Ortiz Quezada", libros: [muerte])
        
        let homero = Autor(nombre: "Homero", libros: [laOdisea])
        
        let johnKat = Autor(nombre: "John Katzenbach", libros: [elClub])
        
    }
    

}
