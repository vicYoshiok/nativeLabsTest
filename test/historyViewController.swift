//
//  historyViewController.swift
//  test
//
//  Created by Victor Garcia on 23/09/24.
//

import UIKit
import Foundation
class historyViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    // Array para almacenar el historial
    var weatherHistory: [responseStruct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // obtener el historial del singleton
        weatherHistory = services.shared.historial
        print(weatherHistory.count)
        
        // recargar la tabla con los datos
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    // MARK: - delegado del table view
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        castear la celda del table view a una timpo weatherCell para poder llenar los labels
        let currentcell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! weatherCell
        
        // configurar la celda con la información del historial
        let weather = weatherHistory[indexPath.row]
        currentcell.city.text = weather.name
        currentcell.coord.text = "Location: " + String(weather.coord.lat)+" , " + String(weather.coord.lon)
        currentcell.temp.text = "Temp: " + String(weather.main.temp) + "ºF"
        currentcell.maxMinTemp.text  = "Max: \(weather.main.tempMax) ) , Min:\(weather.main.tempMin) ºF"
        currentcell.feelsLike.text = "Feels Like: \(weather.main.feelsLike) ºF"
        return currentcell
    }
}


