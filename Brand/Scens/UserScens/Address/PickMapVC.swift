//
//  PickMapVC.swift
//  Al_Ula
//
//  Created by nada dyaa on 5/12/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import GoogleMaps

class PickMapVC: UIViewController , CLLocationManagerDelegate , GMSMapViewDelegate , ButtonActionDelegate {
    private let locationManager = CLLocationManager()
    weak var delegate : DisplayViewControllerDelegate?
    var mapView = mapVieww()
    var tappedlat : Double!
    var tappedlen : Double!
    override func loadView() {
        super.loadView()
        view = mapView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.actionDelegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        mapView.mapview.delegate = self
        
    }
    init(delegate:DisplayViewControllerDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
         self.mapView.actionDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // 3
        guard status == .authorizedWhenInUse else {
            return
        }
        // 4
        locationManager.startUpdatingLocation()
        
        //5
        mapView.mapview.isMyLocationEnabled = true
        mapView.mapview.settings.myLocationButton = false
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//         mapView.mapview.isMyLocationEnabled = true
//        guard let location = locations.first else {
//            return
//        }
//
//        // 7
//        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude , longitude: location.coordinate.longitude, zoom: 10)
//        print("lat : \(location.coordinate.latitude)")
//        print("len : \(location.coordinate.longitude)")
//        mapView.mapview = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), camera: camera)
//        let currentLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//        let marker = GMSMarker(position: currentLocation)
//        marker.title = "Your Current Location"
//        marker.map = mapView.mapview
//        self.mapView.lat.text = "\(location.coordinate.latitude)"
//        self.mapView.lang.text = "\(location.coordinate.longitude)"
//        locationManager.stopUpdatingLocation()
//
//
         mapView.mapview.clear()
        mapView.mapview.isMyLocationEnabled = true
        if let location = locations.first {
            mapView.mapview.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
             let currentLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let marker2 = GMSMarker(position: currentLocation)
            marker2.title =  NSLocalizedString("Your Tapped Location", comment: "")
            marker2.map = mapView.mapview
            self.mapView.lat.text = "\(location.coordinate.latitude)"
            self.mapView.lang.text = "\(location.coordinate.longitude)"
            locationManager.stopUpdatingLocation()
        }
    }
   
    func dissmisController() {
         self.dismiss(animated: true, completion: nil)
    }
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
          mapView.clear()
        // self.mapView.mapview.clear()
        print("marwa : \(coordinate.latitude) and \(coordinate.longitude)")
        let TappedLocation = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        tappedlat = coordinate.latitude
        tappedlen = coordinate.longitude
        let marker2 = GMSMarker(position: TappedLocation)
        marker2.title = NSLocalizedString( "Your Tapped Location", comment: "")
        marker2.map = mapView
        locationManager.stopUpdatingLocation()
 
        self.mapView.lat.text = "\(tappedlat!)"
        self.mapView.lang.text = "\(tappedlen!)"
    }
    func saveButtonTapped() {
        if tappedlat != nil {
         self.delegate?.doSomethingWith(lat: tappedlat, len: tappedlen)
        self.dismiss(animated: true, completion: nil)
    }
        else{
            self.delegate?.doSomethingWith(lat: (locationManager.location?.coordinate.latitude)!, len: (locationManager.location?.coordinate.longitude)!)
            self.dismiss(animated: true, completion: nil)
        }
    }
    func applyBtnTapped() {
        locationManager.startUpdatingLocation()
    }
    
}


