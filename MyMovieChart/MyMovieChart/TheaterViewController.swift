//
//  TheaterViewController.swift
//  MyMovieChart
//
//  Created by JinsooMac on 11/19/18.
//  Copyright © 2018 jinsoo. All rights reserved.
//

import UIKit
import MapKit

class TheaterViewController: UIViewController {
    var param: NSDictionary!
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        self.navigationItem.title = self.param["상영관명"] as? String
        
        // 위도 경도를 추출하여 double
        let lat = (param?["위도"] as! NSString).doubleValue
        let lng = (param?["경도"] as! NSString).doubleValue
        
        // 위도와 경도를 인수로 하는 2D 위치 정보 객체 정의
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        
        // 지도에 표현될 거리 : 값의 단위는 m
        let regionRadius: CLLocationDistance = 100
        
        // 거리를 반영한 지역 정보를 조합한 지도 데이터 생성
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        self.map.setRegion(coordinateRegion, animated: true)
        
        let point = MKPointAnnotation( )
        point.coordinate = location
        
        self.map.addAnnotation(point)
    }
    
}
