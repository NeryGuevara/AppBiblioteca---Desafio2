//
//  ViewController.swift
//  AppBiblioteca - Desafio2
//
//  Created by Felipe Nery Guevara Guevara on 20/01/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var topImage : UIImageView?
    var logo : UIImageView?
    var bienvenida : UILabel?
    var textCorreo: UITextField?
    var textContrasena: UITextField?
    var login: UIButton?
    var register: UIButton?
    
    var alerta = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray4
        
        initUI()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        textCorreo?.text = ""
        textContrasena?.text = ""
        
        super.viewDidAppear(animated)
        
        sesionActiva()
        
    }
    
    
    
    func initUI(){
        
        topImage = UIImageView(frame: CGRect(x: -20, y: 0, width: width*2, height: height/3))
        topImage?.image = UIImage(named: "libros")
        
        view.addSubview(topImage!)
        
        logo = UIImageView(frame: CGRect(x: width/4, y: height/6, width: width/2, height: width/2))
        logo?.image = UIImage(named: "logo")
        
        view.addSubview(logo!)
        
        bienvenida = UILabel(frame: CGRect(x: 0, y: 17*height/40, width: width, height: height/9))
        bienvenida?.text = "¡Bienvenido!"
        bienvenida?.font = .boldSystemFont(ofSize: 38)
        bienvenida?.textColor = .systemBlue
        bienvenida?.textAlignment = .center
        
        view.addSubview(bienvenida!)
        
        textCorreo = UITextField(frame: CGRect(x: width/8, y: 13*height/24, width: 3*width/4, height: height/18))
        textCorreo?.textAlignment = .center
        textCorreo?.placeholder = "Correo electrónico"
        textCorreo?.backgroundColor = .white
        textCorreo?.layer.cornerRadius = 10
        textCorreo?.layer.borderColor = UIColor.black.cgColor
        textCorreo?.layer.borderWidth = 1
        textCorreo?.keyboardType = .emailAddress
        
        view.addSubview(textCorreo!)
        
        textContrasena = UITextField(frame: CGRect(x: width/8, y: 45*height/73, width: 3*width/4, height: height/18))
        textContrasena?.backgroundColor = .white
        textContrasena?.textAlignment = .center
        textContrasena?.placeholder = "Contraseña"
        textContrasena?.layer.cornerRadius = 10
        textContrasena?.layer.borderColor = UIColor.black.cgColor
        textContrasena?.layer.borderWidth = 1
        
        textContrasena?.isSecureTextEntry = true
        
        view.addSubview(textContrasena!)
        
        login = UIButton(frame: CGRect(x: width/10, y: 184*height/263, width: 8*width/10, height: height/18))
        login?.backgroundColor = .systemBlue
        login?.setTitle("Iniciar sesión", for: .normal)
        login?.setTitleColor(.white, for: .normal)
        login?.titleLabel?.font = .boldSystemFont(ofSize: 24)
        login?.layer.cornerRadius = 10
        login?.layer.borderColor = UIColor.black.cgColor
        login?.layer.borderWidth = 1
        login?.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        
        view.addSubview(login!)
        
        register = UIButton(frame: CGRect(x: width/12, y: 720*height/947, width: 5*width/6, height: height/18))
        register?.setTitle("¿Eres nuevo? Regístrate aquí.", for: .normal)
        register?.setTitleColor(.systemBlue, for: .normal)
        register?.layer.cornerRadius = 10
        register?.layer.borderColor = UIColor.clear.cgColor
        register?.layer.borderWidth = 1
        register?.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        
        view.addSubview(register!)
        
        
    }
    
    @objc func loginAction(){
        if let mail = textCorreo?.text {
            if let contrasena = textContrasena?.text{
                iniciarSesion(correo: mail, pass: contrasena)
            }
        }
    }
    
    @objc func registerAction(){
        let registro = Registro()
        registro.modalPresentationStyle = .fullScreen
        present(registro, animated: true, completion: nil)
    }
    
    func iniciarSesion(correo: String, pass: String){
        Auth.auth().signIn(withEmail: correo, password: pass) { [self] user, error in
            if user != nil{
                print("Logueo")
                let homeUno = Home()
                homeUno.modalPresentationStyle = .fullScreen
                present(homeUno, animated: true, completion: nil)
            }else{
                if let error = error?.localizedDescription{
                    print("Error en Firebase:", error)
                    let alert = UIAlertController(title: "Error :(", message: error, preferredStyle: .alert)
                    let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                    alert.addAction(aceptar)
                    present(alert, animated: true, completion: nil)
                }else{
                    let alert = UIAlertController(title: "Error :(", message: "Error en el código fuente", preferredStyle: .alert)
                    let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                    alert.addAction(aceptar)
                    present(alert, animated: true, completion: nil)
                }
            }
        }
        
    }
    
    func sesionActiva(){
        Auth.auth().addStateDidChangeListener { [self] user, error in
            if error == nil{
                print("No estamos logueados")
                
            }else{
                print("Estamos logueados")
                let homeDos = Home()
                homeDos.modalPresentationStyle = .fullScreen
                present(homeDos, animated: true, completion: nil)
            }
        }
    }
    
    
    
}



