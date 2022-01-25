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
        
        view.addSubview(pantalla!)
        
        
        topImage = UIImageView(frame: CGRect(x: -20, y: -height/6, width: width*2, height: height/3))
        topImage?.image = UIImage(named: "libros")
        
        pantalla?.addSubview(topImage!)
        
        hola = UILabel(frame: CGRect(x: 20, y: height/15, width: width/3, height: 40))
        hola?.text = "Hola"
        hola?.font = .boldSystemFont(ofSize: 40)
        hola?.textColor = UIColor.orange
        hola?.textAlignment = .left
        
        pantalla?.addSubview(hola!)
        
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
        
        botonCierre = UIButton(frame: CGRect(x: width/2, y: height/15 + 82 + height/200, width: width/2, height: height/24))
        botonCierre?.setTitle("Cerrar la sesión", for: .normal)
        botonCierre?.setTitleColor(.systemBlue, for: .normal)
        botonCierre?.backgroundColor = .clear
        botonCierre?.addTarget(self, action: #selector(cierreSesion), for: .touchUpInside)
        
        pantalla?.addSubview(botonCierre!)
        
        
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
    
    
}

