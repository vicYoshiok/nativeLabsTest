//
//  mapsViewController.swift
//  test
//
//  Created by Victor Garcia on 20/09/24.
//
import UIKit
import MapKit

class mapsViewController: UIViewController {

    @IBOutlet  var mapView: MKMapView!
    var coord: Coord?
    

      override func viewDidLoad() {
          let currentData = services.shared.historial.first
          
          super.viewDidLoad()
          mapView.mapType = .standard
          let lat = Double((currentData?.coord.lat)!)
          let lon = Double((currentData?.coord.lon)!)
          let locationCoordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
          let region = MKCoordinateRegion(center: locationCoordinate, span: MKCoordinateSpan(latitudeDelta: 8, longitudeDelta: 1))
          let annotation = MKPointAnnotation()
          annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
          annotation.title = currentData?.name
          annotation.coordinate = locationCoordinate
          mapView.addAnnotation(annotation)
          mapView.setRegion(region, animated: true)
        }
    
}
