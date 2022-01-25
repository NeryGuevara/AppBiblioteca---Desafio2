//
//  Registro.swift
//  AppBiblioteca - Desafio2
//
//  Created by Felipe Nery Guevara Guevara on 23/01/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class Registro: UIViewController {
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var topImage: UIImageView?
    var botonRegreso: UIButton?
    var mensaje: UILabel?
    var contenedor: UIView?
    var titulo: UILabel?
    var usuarioText: UITextField?
    var correoText: UITextField?
    var contrasenaText: UITextField?
    var contrasenaTextConfirm: UITextField?
    var botonRegistro: UIButton?
    
    var alerta = ""
    
    var ref: DatabaseReference?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference() //Conexión a la base de datos
        
        view.backgroundColor = .systemGray4
        
        initUI()
        
    }
    
    func initUI(){
        
        topImage = UIImageView(frame: CGRect(x: -20, y: -height/6, width: width*2, height: height/3))
        topImage?.image = UIImage(named: "libros")
        
        view.addSubview(topImage!)
        
        botonRegreso = UIButton(frame: CGRect(x: 0, y: height/12, width: width/2, height: height/12))
        botonRegreso?.backgroundColor = .clear
        botonRegreso?.titleLabel?.font = .boldSystemFont(ofSize: 30)
        botonRegreso?.setTitle("< Regresar", for: .normal)
        botonRegreso?.setTitleColor(.systemBlue, for: .normal)
        
        botonRegreso?.addTarget(self, action: #selector(regresoAction), for: .touchUpInside)
        
        view.addSubview(botonRegreso!)
        
        mensaje = UILabel(frame: CGRect(x: 20, y: height/6, width: width-40, height: height/18))
        mensaje?.text = "Estás a unos cuantos pasos de vivir la mejor experiencia"
        mensaje?.textColor = .systemBlue
        mensaje?.font = .systemFont(ofSize: 22)
        mensaje?.numberOfLines = 0
        mensaje?.textAlignment = .left
        mensaje?.adjustsFontSizeToFitWidth = true
        
        view.addSubview(mensaje!)
        
        contenedor = UIView(frame: CGRect(x: 20, y: height/4, width: width-40, height: height/2))
        contenedor?.backgroundColor = .white
        contenedor?.layer.cornerRadius = 20
        
        view.addSubview(contenedor!)
        
        titulo = UILabel(frame: CGRect(x: (width-40)/6, y: height/22, width: 2*(width-40)/3, height: height/22))
        titulo?.text = "Registra tu información"
        titulo?.textColor = .systemBlue
        titulo?.font = .boldSystemFont(ofSize: 40)
        titulo?.numberOfLines = 0
        titulo?.textAlignment = .center
        titulo?.adjustsFontSizeToFitWidth = true
        
        contenedor?.addSubview(titulo!)
        
        usuarioText = UITextField(frame: CGRect(x: (width-40)/20, y: 3*height/22, width: 18*(width-40)/20, height: height/22))
        usuarioText?.textAlignment = .center
        usuarioText?.placeholder = "Nombre de usuario"
        usuarioText?.backgroundColor = .white
        usuarioText?.layer.cornerRadius = 10
        usuarioText?.layer.borderColor = UIColor.black.cgColor
        usuarioText?.layer.borderWidth = 1
        
        contenedor?.addSubview(usuarioText!)
        
        correoText = UITextField(frame: CGRect(x: (width-40)/20, y: 5*height/22, width: 18*(width-40)/20, height: height/22))
        correoText?.textAlignment = .center
        correoText?.placeholder = "Correo electrónico"
        correoText?.backgroundColor = .white
        correoText?.layer.cornerRadius = 10
        correoText?.layer.borderColor = UIColor.black.cgColor
        correoText?.layer.borderWidth = 1
        correoText?.keyboardType = .emailAddress
        
        contenedor?.addSubview(correoText!)
        
        contrasenaText = UITextField(frame: CGRect(x: (width-40)/20, y: 7*height/22, width: 18*(width-40)/20, height: height/22))
        contrasenaText?.backgroundColor = .white
        contrasenaText?.textAlignment = .center
        contrasenaText?.placeholder = "Contraseña"
        contrasenaText?.layer.cornerRadius = 10
        contrasenaText?.layer.borderColor = UIColor.black.cgColor
        contrasenaText?.layer.borderWidth = 1
        
        contrasenaText?.isSecureTextEntry = true
        
        contenedor?.addSubview(contrasenaText!)
        
        contrasenaTextConfirm = UITextField(frame: CGRect(x: (width-40)/20, y: 9*height/22, width: 18*(width-40)/20, height: height/22))
        contrasenaTextConfirm?.backgroundColor = .white
        contrasenaTextConfirm?.textAlignment = .center
        contrasenaTextConfirm?.placeholder = "Confirma la contraseña"
        contrasenaTextConfirm?.layer.cornerRadius = 10
        contrasenaTextConfirm?.layer.borderColor = UIColor.black.cgColor
        contrasenaTextConfirm?.layer.borderWidth = 1
        
        contrasenaTextConfirm?.isSecureTextEntry = true
        
        contenedor?.addSubview(contrasenaTextConfirm!)
        
        botonRegistro = UIButton(frame: CGRect(x: width/10, y: 19*height/24, width: 8*width/10, height: height/18))
        botonRegistro?.backgroundColor = .systemBlue
        botonRegistro?.setTitle("Crear cuenta", for: .normal)
        botonRegistro?.setTitleColor(.white, for: .normal)
        botonRegistro?.titleLabel?.font = .boldSystemFont(ofSize: 24)
        botonRegistro?.layer.cornerRadius = 10
        botonRegistro?.layer.borderColor = UIColor.black.cgColor
        botonRegistro?.layer.borderWidth = 1
        botonRegistro?.addTarget(self, action: #selector(registroAction), for: .touchUpInside)
        
        view.addSubview(botonRegistro!)
    }
    
    @objc func regresoAction(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func registroAction(){
        var seguridadMinuscula = false
        var seguridadMayuscula = false
        var seguridadNumero = false
        var seguridadEspecial = false
        var seguridadCount = false
        
        print("Registro")
        if let nombre = usuarioText?.text{
            if nombre != ""{
                if let mail = correoText?.text {
                    if let contrasena = contrasenaText?.text{
                        if let contrasenaConfirmada = contrasenaTextConfirm?.text{
                            for i in contrasena{
                                switch i{
                                    case "a","b","c","d","e","f","g","h","i","j","k","l","m","n","ñ","o","p","q","r","s","t","u","v","w","x","y","z":
                                    seguridadMinuscula = true
                                    case "A","B","C","D","E","F","G","H","I","J","K","L","M","N","Ñ","O","P","Q","R","S","T","U","V","W","X","Y","Z":
                                    seguridadMayuscula = true
                                    case "1","2","3","4","5","6","7","8","9","0":
                                    seguridadNumero = true
                                    default:
                                    seguridadEspecial = true
                                }
                            }
                            if contrasena.count >= 8{
                                seguridadCount = true
                            }
                            if seguridadMinuscula && seguridadMayuscula && seguridadNumero && seguridadEspecial && seguridadCount{
                                if contrasena == contrasenaConfirmada{
                                        registroTerminado(nombre: nombre, correo: mail, pass: contrasena)
                                }else{
                                    alerta = "Las contraseñas no coinciden"
                                    let alert = UIAlertController(title: "Error :(", message: alerta, preferredStyle: .alert)
                                    let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                                    alert.addAction(aceptar)
                                    self.present(alert, animated: true, completion: nil)
                                }
                            }else{
                                alerta = "La contraseña debe contener al menos 8 carácteres entre los cuales debe haber al menos una minúscula, una mayúscula, un número y un carácter especial"
                                let alert = UIAlertController(title: "Error :(", message: alerta, preferredStyle: .alert)
                                let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                                alert.addAction(aceptar)
                                self.present(alert, animated: true, completion: nil)
                            }
                        }else{
                            alerta = "Introduce la confirmación de la contraseña"
                            let alert = UIAlertController(title: "Error :(", message: alerta, preferredStyle: .alert)
                            let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                            alert.addAction(aceptar)
                            self.present(alert, animated: true, completion: nil)
                        }
                    }else{
                        alerta = "La contraseña no está introducida"
                        let alert = UIAlertController(title: "Error :(", message: alerta, preferredStyle: .alert)
                        let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                        alert.addAction(aceptar)
                        self.present(alert, animated: true, completion: nil)
                    }
                }else{
                    alerta = "El correo no está introducido"
                    let alert = UIAlertController(title: "Error :(", message: alerta, preferredStyle: .alert)
                    let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                    alert.addAction(aceptar)
                    self.present(alert, animated: true, completion: nil)
                }
            }else{
                alerta = "El nombre de usuario no está introducido"
                let alert = UIAlertController(title: "Error :(", message: alerta, preferredStyle: .alert)
                let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                alert.addAction(aceptar)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func registroTerminado(nombre: String, correo: String, pass: String){
        Auth.auth().createUser(withEmail: correo, password: pass) { [self] user, error in
            if user != nil{
                print("Usuario creado")
                let campos = ["nombre": usuarioText?.text, "email": self.correoText?.text, "id": Auth.auth().currentUser?.uid]
                ref?.child("users").child(Auth.auth().currentUser!.uid).setValue(campos)
                
                self.dismiss(animated: true, completion: nil)
            }else{
                if let error = error?.localizedDescription{
                    print("Error en Firebase:", error)
                    let alert = UIAlertController(title: "Error :(", message: error, preferredStyle: .alert)
                    let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                    alert.addAction(aceptar)
                    self.present(alert, animated: true, completion: nil)
                }else{
                    let alert = UIAlertController(title: "Error :(", message: "Error en el código fuente", preferredStyle: .alert)
                    let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                    alert.addAction(aceptar)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
    }

}
