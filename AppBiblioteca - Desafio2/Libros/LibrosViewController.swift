//
//  LibrosViewController.swift
//  AppBiblioteca - Desafio2
//
//  Created by Felipe Nery Guevara Guevara on 24/01/22.
//

import UIKit

class LibrosViewController: UIViewController{
    
    var width = UIScreen.main.bounds.width
    var heigth = UIScreen.main.bounds.height
    
    var dataSource = MenuLibros(titulo: "", libros: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
        initUI()
        
    }
    
    func initUI(){
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 10, width: width, height: heigth))
        
        tableView.backgroundColor = .systemGray5
        tableView.layer.cornerRadius = 20
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
    }
    
    func getData(){
        
        let lazosDeAmor = Libro(nombre: "Lazos de amor", imagen: "LazosDeAmor", autor: "Brian Weiss", categoria: "Ficción", descripcion: "Una maravillosa historia de amor entre dos seres perdidos que encontrarán definitivamente su destino.", detalles: "Detalles del libro Lazos de Amor", fotoAutor: "Brian", bio: "Brian Leslie Weiss es un psiquiatra estadounidense. Sus investigaciones incluyen la reencarnación, la regresión a vidas pasadas, la progresión a vidas futuras y la supervivencia del alma humana después de la muerte.")
        
        let muchasVidas = Libro(nombre: "Muchas vidas, muchos maestros", imagen: "MuchasVidas", autor: "Brian Weiss", categoria: "Autoayuda", descripcion: "La historia real de un psiquiatra, su joven paciente y la terapia de regresión que cambió sus vidas para siempre.", detalles: "Detalles del libro Muchas vidas, muchos maestros.", fotoAutor: "Brian", bio: "Brian Leslie Weiss es un psiquiatra estadounidense. Sus investigaciones incluyen la reencarnación, la regresión a vidas pasadas, la progresión a vidas futuras y la supervivencia del alma humana después de la muerte.")
        
        let muerte = Libro(nombre: "Muerte, morir, inmortalidad", imagen: "Muerte", autor: "Federico Ortiz Quezada", categoria: "Autoayuda", descripcion: "Un libro de aliento y alivio que muestra la enorme complejidad del fenómeno que llamamos muerte.", detalles: "Detalles del libro Muerte, morir, inmortalidad", fotoAutor: "Federico", bio: "Federico Ortiz Quezada (Ciudad de México, 1935) es Médico Cirujano (1959) por la Escuela Nacional de Medicina; realizó su posgrado en Urología en el Hospital General de la Ciudad de México y en la Universidad de Cornell en Nueva York.")
        
        let laOdisea = Libro(nombre: "La odisea", imagen: "LaOdisea", autor: "Homero", categoria: "Ficción", descripcion: "He aquí uno de los más grandes poemas épicos de todos los tiempos: Odisea. en él se narra el regreso del héroe, Odiseo, a su patria, Ítaca, después de la conquista de Troya.Compuesta como la Ilíada en hexámetros, recoge numerosos cuentos populares y leyen", detalles: "Detalles del libro La odisea", fotoAutor: "Homero", bio: "Homero es el autor de La Ilíada y La Odisea, los dos mayores poemas épicos griegos. No se sabe nada sobre Homero personalmente; ni siquiera se sabe con certeza si hay un único y verdadero autor de estas dos obras. Se cree que Homero era un jonio del siglo IX u VIII a.C. Aunque los historiadores discuten sobre el hombre, su impacto en la literatura, la historia y la filosofía es tan importante que es casi inconmensurable.")
        
        let elClub = Libro(nombre: "El club de los psicópatas", imagen: "ElClub", autor: "John Katzenbach", categoria: "Ficción", descripcion: "Alpha, Bravo, Charlie, Delta y Easy se hacen llamar los Muchachos de Jack, en honor a Jack el destripador. Entre ellos no se conocen más que por una plataforma en la Deep Web donde comparten su verdadera pasión: llegar a ser artistas del asesinato.", detalles: "Detalles del libro El club de los psicópatas", fotoAutor: "John", bio: "John Katzenbach es uno de los autores más importantes de novela negra en el mundo; muchas de sus novelas han sido adaptadas al cine y a la televisión. Posee también una larga trayectoria como periodista en temas judiciales.")
        
        let laHistoria = Libro(nombre: "La historia del loco", imagen: "LaHistoria", autor: "John Katzenbach", categoria: "Suspenso", descripcion: "Katzenbach se introduce en la agitada mente de Francis, demostrando un gran conocimiento del lado oscuro de la psique humana y ofreciéndonos un thriller tan tenso y adictivo como El Psicoanalista.", detalles: "Detalles del libro La historia del loco", fotoAutor: "John", bio: "John Katzenbach es uno de los autores más importantes de novela negra en el mundo; muchas de sus novelas han sido adaptadas al cine y a la televisión. Posee también una larga trayectoria como periodista en temas judiciales.")
        
        let laChica = Libro(nombre: "La chica del tren", imagen: "LaChica", autor: "Paula Hawkins", categoria: "Suspenso", descripcion: "Rachel toma siempre el tren de las 8.04 h. Algo sucede muy deprisa, pero es suficiente. ¿Y si Jess y Jason no son tan felices como ella cree? ¿Y si nada es lo que parece? ", detalles: "Detalles del libro La chica del tren", fotoAutor: "Paula", bio: "Paula Hawkins trabajó como periodista durante quince años antes de dedicarse a la ficción. La chica del tren es su primer thriller. Ha sido un bestseller del New York Times, se ha publicado en todo el mundo y pronto se convertirá en una gran película. Hawkins vive en Londres. ")
        
        let it = Libro(nombre: "It", imagen: "It", autor: "Stephen King", categoria: "Horror", descripcion: "¿Quién o qué mutila y mata a los niños de un pequeño pueblo norteamericano? ¿Por qué llega cíclicamente el horror a Derry en forma de un payaso siniestro que va sembrando la destrucción a su paso?", detalles: "Detalles del libro de It", fotoAutor: "Stephen", bio: "Stephen Edwin King es un autor estadounidense de obras de terror contemporáneo, suspense, ciencia ficción y fantasía. Sus libros han vendido más de 350 millones de ejemplares y muchos de ellos han sido adaptados en largometrajes, películas para televisión y cómics.")
        
        let elInstituto = Libro(nombre: "El instituto", imagen: "ElInstituto", autor: "Stephen King", categoria: "Ficción", descripcion: "<SE RECLUTAN NIÑOS CON MENTES PRODIGIOSAS> La nueva e inquietante novela del maestro Stephen King.", detalles: "Detalles del libro El instituto", fotoAutor: "Stephen", bio: "Stephen Edwin King es un autor estadounidense de obras de terror contemporáneo, suspense, ciencia ficción y fantasía. Sus libros han vendido más de 350 millones de ejemplares y muchos de ellos han sido adaptados en largometrajes, películas para televisión y cómics.")
        
        let apocalipsis = Libro(nombre: "Apocalipsis", imagen: "Apocalipsis", autor: "Stephen King", categoria: "Horror", descripcion: "Stephen King en estado puro. Una de las novelas favoritas de los fans del maestro de la literatura de terror. De este libro se basó la serie The Stand", detalles: "Detalles del libro Apocalipsis", fotoAutor: "Stephen", bio: "Stephen Edwin King es un autor estadounidense de obras de terror contemporáneo, suspense, ciencia ficción y fantasía. Sus libros han vendido más de 350 millones de ejemplares y muchos de ellos han sido adaptados en largometrajes, películas para televisión y cómics.")
        
        let libros = MenuLibros(titulo: "Libros", libros: [lazosDeAmor, laHistoria, laOdisea, it, laChica, muerte, muchasVidas, elClub, elInstituto, apocalipsis])
        
        dataSource = libros
    }

}

extension LibrosViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        
        view.backgroundColor = .systemGray5
        
        let label = UILabel(frame: CGRect(x: 0, y: -2.5, width: width, height: 30))
        label.text = dataSource.titulo ?? ""
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: 30)
        
        view.addSubview(label)
        
        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.libros?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let libro = dataSource.libros?[indexPath.row]
        let cell = LibrosTableViewCell(libro: libro!)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Estoy en la sección \(indexPath.section) en la celda \(indexPath.row)")
        
        let libro = (dataSource.libros?[indexPath.row])!
        let vc = DetallesLibroViewController(libro: libro)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heigth/7
    }
    
}
