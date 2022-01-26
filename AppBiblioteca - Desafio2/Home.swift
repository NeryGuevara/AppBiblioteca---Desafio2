//
//  Home.swift
//  
//
//  Created by Felipe Nery Guevara Guevara on 23/01/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class Home: UIViewController {
    
    var pantalla : UIScrollView?
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var topImage : UIImageView?
    var linea : UIView?
    var hola : UILabel?
    var nombre : UILabel?
    
    var botonCierre: UIButton?
    
    var labelMasPopulares : UILabel?
    var libro1 : UIButton?
    var libro1Imagen : UIImageView?
    var libro2: UIButton?
    var libro2Imagen: UIImageView?
    var libro3: UIButton?
    var libro3Imagen: UIImageView?
    
    var contenedorBotones : UIView?
    var librosBoton : UIButton?
    var categoriasBoton : UIButton?
    var autoresBoton : UIButton?
    
    var seccionesLabel : UILabel?
    var imagenSecciones : UIImageView?
    
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference() //Conexión a la base de datos
        
        view.backgroundColor = .systemGray4
        
        initUI()
        
    }
    
    
    func initUI(){
        
        pantalla = UIScrollView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        pantalla?.backgroundColor = .systemBackground
        
        //view.addSubview(pantalla!)
        
        
        topImage = UIImageView(frame: CGRect(x: -20, y: -height/6, width: width*2, height: height/3))
        topImage?.image = UIImage(named: "libros")
        
        view.addSubview(topImage!)
        
        hola = UILabel(frame: CGRect(x: 20, y: height/15, width: width/3, height: 40))
        hola?.text = "Hola"
        hola?.font = .boldSystemFont(ofSize: 40)
        hola?.textColor = UIColor.orange
        hola?.textAlignment = .left
        
        view.addSubview(hola!)
        
        nombre = UILabel(frame: CGRect(x: 20, y: height/15 + 40, width: width-40, height: 42))
        
        //let index = correo!.firstIndex(of: "@") ?? correo!.endIndex
        //soloNombre = String(correo![..<index])
        //nombre?.text = soloNombre.capitalized
        
        let userId = (Auth.auth().currentUser?.uid)!
        ref?.child("users").child(userId).observeSingleEvent(of: .value, with: { [self] (snatshop) in
            let value = snatshop.value as? NSDictionary
            
            nombre?.text = value!["nombre"] as? String
        })
        
        nombre?.font = .boldSystemFont(ofSize: 40)
        nombre?.textColor = UIColor.systemBlue
        nombre?.textAlignment = .left
        
        view.addSubview(nombre!)
        
        linea = UIView(frame: CGRect(x: width/2 - 20, y: 42, width: width/2, height: height/200))
        linea?.backgroundColor = .systemBlue
        
        nombre?.addSubview(linea!)
        
        botonCierre = UIButton(frame: CGRect(x: width/2, y: height/15, width: width/2, height: height/24))
        botonCierre?.setTitle("Cerrar la sesión", for: .normal)
        botonCierre?.titleLabel?.font = .boldSystemFont(ofSize: 18)
        botonCierre?.setTitleColor(.systemBlue, for: .normal)
        botonCierre?.backgroundColor = .clear
        botonCierre?.addTarget(self, action: #selector(cierreSesion), for: .touchUpInside)
        
        view.addSubview(botonCierre!)
        
        labelMasPopulares=UILabel(frame: CGRect(x: width/5, y: height/5+5, width: 3*width/5, height: height/16))
        labelMasPopulares?.text = "Más populares"
        labelMasPopulares?.font = .boldSystemFont(ofSize: 30)
        labelMasPopulares?.textColor = .orange
        labelMasPopulares?.textAlignment = .center
        labelMasPopulares?.adjustsFontSizeToFitWidth = true
        
        view.addSubview(labelMasPopulares!)
        
        libro1 = UIButton(frame: CGRect(x: 3*width/10, y: 11*height/40, width: 2*width/5, height: 3*width/5))
        libro1Imagen = UIImageView(frame: CGRect(x: 0, y: 0, width: 2*width/5, height: 3*width/5))
        libro1Imagen?.image = UIImage(named: "It")
        libro1?.addTarget(self, action: #selector(popularesAction), for: .touchUpInside)
        view.addSubview(libro1!)
        libro1?.addSubview(libro1Imagen!)
        
        libro2 = UIButton(frame: CGRect(x: width/20, y: 27*height/80, width: width/5, height: 3*width/10))
        libro2Imagen = UIImageView(frame: CGRect(x: 0, y: 0, width: width/5, height: 3*width/10))
        libro2Imagen?.image = UIImage(named: "ElInstituto")
        libro2?.addTarget(self, action: #selector(popularesAction), for: .touchUpInside)
        view.addSubview(libro2!)
        libro2?.addSubview(libro2Imagen!)
        
        libro1 = UIButton(frame: CGRect(x: 15*width/20, y: 27*height/80, width: width/5, height: 3*width/10))
        libro1Imagen = UIImageView(frame: CGRect(x: 0, y: 0, width: width/5, height: 3*width/10))
        libro1Imagen?.image = UIImage(named: "Apocalipsis")
        libro1?.addTarget(self, action: #selector(popularesAction), for: .touchUpInside)
        view.addSubview(libro1!)
        libro1?.addSubview(libro1Imagen!)
        
        contenedorBotones = UIView(frame: CGRect(x: width/20, y: 6*height/10, width: 9*width/10, height: height/16))
        contenedorBotones?.backgroundColor = .white
        contenedorBotones?.layer.cornerRadius = 10
        contenedorBotones?.layer.borderColor = UIColor.white.cgColor
        contenedorBotones?.layer.borderWidth = 8
        
        view.addSubview(contenedorBotones!)
        
        librosBoton = UIButton(frame: CGRect(x: 0, y: 0, width: 9*width/30, height: height/16))
        librosBoton?.backgroundColor = .white
        librosBoton?.setTitle("Libros", for: .normal)
        librosBoton?.titleLabel?.font = .systemFont(ofSize: 18)
        librosBoton?.setTitleColor(.systemBlue, for: .normal)
        librosBoton?.layer.cornerRadius = 10
        librosBoton?.layer.borderColor = UIColor.systemBlue.cgColor
        librosBoton?.layer.borderWidth = 1
        librosBoton?.addTarget(self, action: #selector(librosBotonAction), for: .touchUpInside)
        
        contenedorBotones?.addSubview(librosBoton!)
        
        categoriasBoton = UIButton(frame: CGRect(x: 9*width/30, y: 0, width: 9*width/30, height: height/16))
        categoriasBoton?.backgroundColor = .white
        categoriasBoton?.setTitle("Categorías", for: .normal)
        categoriasBoton?.titleLabel?.font = .systemFont(ofSize: 18)
        categoriasBoton?.setTitleColor(.systemBlue, for: .normal)
        categoriasBoton?.layer.cornerRadius = 10
        categoriasBoton?.layer.borderColor = UIColor.systemBlue.cgColor
        categoriasBoton?.layer.borderWidth = 1
        categoriasBoton?.addTarget(self, action: #selector(categoriasBotonAction), for: .touchUpInside)
        
        contenedorBotones?.addSubview(categoriasBoton!)
        
        autoresBoton = UIButton(frame: CGRect(x: 18*width/30, y: 0, width: 9*width/30, height: height/16))
        autoresBoton?.backgroundColor = .white
        autoresBoton?.setTitle("Autores", for: .normal)
        autoresBoton?.titleLabel?.font = .systemFont(ofSize: 18)
        autoresBoton?.setTitleColor(.systemBlue, for: .normal)
        autoresBoton?.layer.cornerRadius = 10
        autoresBoton?.layer.borderColor = UIColor.systemBlue.cgColor
        autoresBoton?.layer.borderWidth = 1
        autoresBoton?.addTarget(self, action: #selector(autoresBotonAction), for: .touchUpInside)
        
        contenedorBotones?.addSubview(autoresBoton!)
        
        seccionesLabel = UILabel(frame: CGRect(x: 20, y: 21*height/30, width: width/2 - 20, height: width/2 - 20))
        seccionesLabel?.text = "Descubre tu próximo contenido favorito en nuestras secciones!"
        seccionesLabel?.font = .boldSystemFont(ofSize: 40)
        seccionesLabel?.textColor = .systemBlue
        seccionesLabel?.numberOfLines = 0
        seccionesLabel?.textAlignment = .center
        seccionesLabel?.adjustsFontSizeToFitWidth = true
        
        view.addSubview(seccionesLabel!)
        
        imagenSecciones = UIImageView(frame: CGRect(x: width/2 + 10, y: 11*height/15, width: width/2 - 20, height: width/2 - 20))
        imagenSecciones?.image = UIImage(named: "Secciones")
        
        view.addSubview(imagenSecciones!)
        
    }
    
    @objc func cierreSesion(){
        let alerta = UIAlertController(title: "Cerrar sesión", message: "¿Seguro que desea cerrar sesión?", preferredStyle: .alert)
        let aceptar = UIAlertAction(title: "Aceptar", style: .default) { _ in
            try! Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
        }
        let cancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        alerta.addAction(aceptar)
        alerta.addAction(cancelar)
        present(alerta, animated: true, completion: nil)
    }
    
    @objc func librosBotonAction(){
        print("Tocamos el menú de libros")
        let librosViewController = LibrosViewController()
        present(librosViewController, animated: true, completion: nil)
    }
    
    @objc func popularesAction(){
        let popularesViewController = PopolaresViewController()
        present(popularesViewController, animated: true, completion: nil)
    }
    
    @objc func categoriasBotonAction(){
        let categoriasViewController = CategoriasViewController()
        present(categoriasViewController, animated: true)
    }
    
    @objc func autoresBotonAction(){
        let autoresViewController = AutoresViewController()
        present(autoresViewController, animated: true)
    }
    
    
}

