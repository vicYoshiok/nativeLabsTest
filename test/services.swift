//
//  services.swift
//  test
//
//  Created by Victor Garcia on 20/09/24.
//


 import Alamofire
 import Foundation
 import UIKit

public  class services {
     static let shared = services()
     var historial: [responseStruct] = []

     private init() {
         if let data = UserDefaults.standard.data(forKey: "historyData") {
             let decoder = JSONDecoder()
             if let decodedHistorial = try? decoder.decode([responseStruct].self, from: data) {
                 historial = decodedHistorial
             } else {
                 print("Error al decodificar el historial desde UserDefaults.")
             }
         }
     }

     func getService(completion: @escaping (responseStruct?) -> Void) {
         print("get services ")
         let url = "https://open-weather13.p.rapidapi.com/city/landon/EN"
         
         // Encabezados y host de la petición de datos
         let headers: HTTPHeaders = [
             "x-rapidapi-key": "5ac7480a7emsh4d06ddee60d90c1p117014jsn625c5abc6ada",
             "x-rapidapi-host": "open-weather13.p.rapidapi.com"
         ]
         
         // Realizar la petición con Alamofire
         AF.request(url, headers: headers).responseJSON { response in
             switch response.result {
             case .success(let value):
                 print("Response JSON: \(value)")
                 
                 // Convertir el JSON a Data para guardarlo en el struct
                 if let jsonData = try? JSONSerialization.data(withJSONObject: value, options: []) {
                     if let weatherData = self.saveWeatherData(from: jsonData) {
                         print("El JSON se logró convertir!")
                         
                         // Agregar la respuesta del servicio al historial
                         self.historial.append(weatherData)
//guardar en el historial
                         let encoder = JSONEncoder()
                         if let encodedData = try? encoder.encode(self.historial) {
                             UserDefaults.standard.set(encodedData, forKey: "historyData")
                         } else {
                             print("error al codificar el historial")
                         }
                         
                         completion(weatherData)
                     } else {
                         print("eallo al convertir el JSON. :C")
                         completion(nil)
                     }
                 } else {
                     print("Error al convertir :C")
                 }
                 
             case .failure(let error):
                 print("Error: \(error.localizedDescription)")
                 completion(nil)
             }
         }
     }
     
     private func saveWeatherData(from jsonData: Data) -> responseStruct? {
         let decoder = JSONDecoder()
         do {
             // Mapeamos el contenido del JSON a la estructura responseStruct
             let weatherData = try decoder.decode(responseStruct.self, from: jsonData)
             return weatherData
         } catch {
             print("Error \(error)")
             return nil
         }
     }
 }

 
 
