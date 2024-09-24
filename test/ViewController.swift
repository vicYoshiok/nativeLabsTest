import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var onMapBtn: UIButton!
    @IBOutlet weak var historyBtn: UIButton!
    @IBOutlet weak var getPlaceBtn: UIButton!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    var response: responseStruct?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func getPlaceFunc(_ sender: Any) {
        print("getPlaceFunc llamada")
        
        services.shared.getService { [weak self] response in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if let response = response {
                    // Asignar los valores a los labels
                    self.cityLabel.text = response.name
                    self.tempLabel.text = "Location \(response.coord.lat) , \(response.coord.lon)"
                    
                    //"Location: " + String(weather.coord.lat)+" , " + String(weather.coord.lon)
                    self.tempMaxLabel.text = " Temp max: \(response.main.tempMax)°"
                    self.tempMinLabel.text = "Temp min:\(response.main.tempMin)°"
                    self.feelsLikeLabel.text = "Feels like: \(response.main.feelsLike)°"
                    self.pressureLabel.text = "Pressure: \(response.main.pressure) hPa"
                    self.humidityLabel.text = " Humididy: \(response.main.humidity)%"
                    
                    print("datos cargados ")
                } else {
                    print("No se pudo obtener el JSON :c")
                    self.cityLabel.text = "Try Again."
                }
            }
        }
    }
}
