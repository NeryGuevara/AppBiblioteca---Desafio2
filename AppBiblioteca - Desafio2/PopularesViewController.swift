//
//  PopularesViewController.swift
//  AppBiblioteca - Desafio2
//
//  Created by Felipe Nery Guevara Guevara on 25/01/22.
//

import UIKit

class PopolaresViewController: UIViewController{
    
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
        
        let it = Libro(nombre: "It", imagen: "It", autor: "Stephen King", categoria: "Horror", descripcion: "¿Quién o qué mutila y mata a los niños de un pequeño pueblo norteamericano? ¿Por qué llega cíclicamente el horror a Derry en forma de un payaso siniestro que va sembrando la destrucción a su paso?", detalles: "Detalles del libro de It", fotoAutor: "Stephen", bio: "Stephen Edwin King es un autor estadounidense de obras de terror contemporáneo, suspense, ciencia ficción y fantasía. Sus libros han vendido más de 350 millones de ejemplares y muchos de ellos han sido adaptados en largometrajes, películas para televisión y cómics.")
        
        let elInstituto = Libro(nombre: "El instituto", imagen: "ElInstituto", autor: "Stephen King", categoria: "Ficción", descripcion: "<SE RECLUTAN NIÑOS CON MENTES PRODIGIOSAS> La nueva e inquietante novela del maestro Stephen King.", detalles: "Detalles del libro El instituto", fotoAutor: "Stephen", bio: "Stephen Edwin King es un autor estadounidense de obras de terror contemporáneo, suspense, ciencia ficción y fantasía. Sus libros han vendido más de 350 millones de ejemplares y muchos de ellos han sido adaptados en largometrajes, películas para televisión y cómics.")
        
        let apocalipsis = Libro(nombre: "Apocalipsis", imagen: "Apocalipsis", autor: "Stephen King", categoria: "Horror", descripcion: "Stephen King en estado puro. Una de las novelas favoritas de los fans del maestro de la literatura de terror. De este libro se basó la serie The Stand", detalles: "Detalles del libro Apocalipsis", fotoAutor: "Stephen", bio: "Stephen Edwin King es un autor estadounidense de obras de terror contemporáneo, suspense, ciencia ficción y fantasía. Sus libros han vendido más de 350 millones de ejemplares y muchos de ellos han sido adaptados en largometrajes, películas para televisión y cómics.")
        
        let libros = MenuLibros(titulo: "Más populares", libros: [it, elInstituto, apocalipsis])
        
        dataSource = libros
    }

}

extension PopolaresViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        
        view.backgroundColor = .systemGray5
        
        let label = UILabel(frame: CGRect(x: 0, y: -2.5, width: width, height: 30))
        label.text = dataSource.titulo ?? ""
        label.textAlignment = .center
        label.textColor = .orange
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
