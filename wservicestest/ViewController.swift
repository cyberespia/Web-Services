//
//  ViewController.swift
//  wservicestest
//
//  Created by Mario Burga on 2/27/19.
//  Copyright © 2019 mihost.com. All rights reserved.
//  ok

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        let myUrl = URL(string: "https://mihost.org/loginswift/4/");
        //
        //        var request = URLRequest(url:myUrl!)
        //
        //        request.httpMethod = "POST"// Compose a query string
        //
        //        let postString = "firstName=James&lastName=Bond";
        //
        //        request.httpBody = postString.data(using: String.Encoding.utf8);
        //
        //        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
        //
        //            if error != nil
        //            {
        //                print("error=\(error)")
        //                return
        //            }
        //
        //            // You can print out response object
        //            print("response = \(response)")
        //
        //            //Let's convert response sent from a server side script to a NSDictionary object:
        //            do {
        //                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
        //
        //                if let parseJSON = json {
        //
        //                    // Now we can access value of First Name by its key
        //                    let firstNameValue = parseJSON["firstName"] as? String
        //                    print("firstNameValue: \(firstNameValue)")
        //                }
        //            } catch {
        //                print(error)
        //            }
        //        }
        //        task.resume()
        
        
        
        
        
        
        
    }
    
    
    @IBAction func enviarB(_ sender: Any) {
        
        Callquery()
        
    }
    
    
    // enviar datos a server
    
    func Callquery()
    {
        
        
        let myUrl = URL(string: "https://mihost.org/loginswift/4/reporteapp.php");
        
        //Creamos la peticion o request - convertimos la constante myUrl a tipo URLRequest
        var peticion = URLRequest(url:myUrl!)
        
        // Definimos el método para el envio - en este caso POST
        peticion.httpMethod = "POST"
        
        // creando el parámetro post
        let postString = "coordenadas=(1,4)"
        
        // añadiendo los parámetros al cuerpo de solicitud
        peticion.httpBody = postString.data(using: String.Encoding.utf8)
        
        
        // let tareea = URLSession.shared.dataTask(with: peticion)
        // tareea.resume()
        
        
        
        
        let tarea = URLSession.shared.dataTask(with: peticion) { (datosRecibidos, respuesta, error) in
            if error == nil {
                
                //imprimimos en consola los datos recibidos en modo debug
                print("datos recibidos: \(String(describing: String(data: datosRecibidos!, encoding: .utf8))) ")
                
                //let datosString = NSString(data:datos!, encoding: String.Encoding.utf8.rawValue)
                
                //print(datosString!)
                //print(respuesta!)
                
                
                do {
                    let json = try JSONSerialization.jsonObject(with: datosRecibidos!) as? [String: String]
                    
                    if json != nil {
                        
                        let mensajeV = json!["mensaje"]!//constante
                        
                        let errorV = json!["error"]!//constante
                        print(mensajeV)
                        print(errorV)
                        
                    }
                    
                    
                    //print(json)
                    
                } catch {
                    print(error)
                }
                
                
                
                
            } else {
                
                print(error!)
            }
        }
        
        tarea.resume()
        
        // create the session
        //        URLSession.shared.dataTask(with:peticion, completionHandler: {(data, response, error) in
        //            if error != nil {
        //                print("There was error during datatask session")
        //                print(error!)
        //            } else {
        //                do {
        //                    guard let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] else { return }
        //                    print(json as Any)
        //
        //                    guard let errors = json?["errors"] as? [[String: Any]] else { return }
        //
        //                    if errors.count > 0 {
        //                        // show error
        //                        print("There is an error during parse JSON datatask")
        //                        return
        //                    } else {
        //                        // show confirmation
        //                        print("datatask with JSON format performed successfully")
        //                    }
        //                }
        //            }
        //
        //
        //
        //        }).resume()
    }
    //fin enviar datos a server
    
}

