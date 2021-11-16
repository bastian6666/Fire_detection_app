//
//  MapViewController.swift
//  Fire
//
//  Created by Sebastian Sanchez Bernal on 15/11/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func Return(_ sender: Any) {
    }
    
    
    @IBAction func Detect(_ sender: Any) {
    }
    
    @IBAction func Change(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            mapView.mapType = .standard
            
        } else{
            
            mapView.mapType = .satellite
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        class Peatlands: NSObject, MKAnnotation {
          let title: String?
          let locationName: String?
          let coordinate: CLLocationCoordinate2D

          init(
            title: String?,
            locationName: String?,
            coordinate: CLLocationCoordinate2D
          ) {
            self.title = title
            self.locationName = locationName
       
            self.coordinate = coordinate

            super.init()
          }

          var subtitle: String? {
            return locationName
          }
        }

        
        let peatlands = CLLocation(latitude: -2.814625, longitude: 104.825116)
        let regionRadius: CLLocationDistance = 30000.0
        let region = MKCoordinateRegion(center: peatlands.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(region, animated: true)
        mapView.delegate = self
        let example = Peatlands(
          title: "South Sumatra Peatlands",
          locationName: "The fires of 1997-98 burned 1.5–2.1 million hectares on peat soils in South Sumatra. Carbon emissions from these fires on peatlands were equivalent to 40% of annual global fossil fuel emissions.",
          coordinate: CLLocationCoordinate2D(latitude: -2.814625, longitude: 104.825116))
        mapView.addAnnotation(example)
    }
    

}

extension MapViewController:MKMapViewDelegate{
    
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("Rendering...")
    }
}
