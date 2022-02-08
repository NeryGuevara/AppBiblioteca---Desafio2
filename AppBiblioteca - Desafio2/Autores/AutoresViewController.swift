//
//  AutoresViewController.swift
//  AppBiblioteca - Desafio2
//
//  Created by Felipe Nery Guevara Guevara on 24/01/22.
//

import UIKit

var width = UIScreen.main.bounds.width
var heigth = UIScreen.main.bounds.height

struct Autores: Codable{
    let title: String
    let id: Int
}

class AutoresViewController: UIViewController {

    
    var dataSource = MenuAutores(titulo: "", autores: [])
    let tabla = UITableView(frame: CGRect(x: 0, y: 10, width: width, height: heigth))
    
    var autores = [Autores]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //getDataLibros()
        //getDataCategorias()
        getDataAutores()
        initUI()
        
    }
    
    func initUI(){
        
        tabla.backgroundColor = .systemGray4
        tabla.layer.cornerRadius = 20
        
        tabla.delegate = self
        tabla.dataSource = self
        
        view.addSubview(tabla)
        
    }
    
    func getDataAutores(){
        //Aquí va el API
        guard let AutoresURL = URL(string: "https://jsonplaceholder.typicode.com/todos/") else {return }
        
        let url = URLRequest(url: AutoresURL)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let response = response {
                print(response)
            }
            
            do{
                guard let dataSafe = data else {return }
                print(dataSafe)
                self.autores = try JSONDecoder().decode([Autores].self, from: dataSafe)
                DispatchQueue.main.async{
                    self.tabla.reloadData()
                }
            }catch let error as NSError{
                print("Error en la carga del JSON: ", error)
            }
            
        }.resume()
        
    }
    
}


extension AutoresViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        
        view.backgroundColor = .systemGray4
        
        let label = UILabel(frame: CGRect(x: 0, y: -2.5, width: width, height: 30))
        label.text = "Autores"
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: 30)
        
        view.addSubview(label)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let autor = autores[indexPath.row]
        let cell = AutoresTableViewCell(autor: autor)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heigth/7
    }
    
}
