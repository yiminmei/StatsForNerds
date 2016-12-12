import UIKit
import MapKit
import CoreLocation


// this class gives user location and handles map
class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var Map: MKMapView!
    let locationmanager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationmanager.delegate = self;
        self.locationmanager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationmanager.requestWhenInUseAuthorization()
        self.locationmanager.startUpdatingLocation()
        self.Map.showsUserLocation = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2DMake( (location?.coordinate.latitude)!, (location?.coordinate.longitude)!)
        let region = MKCoordinateRegion(center: center , span: MKCoordinateSpan( latitudeDelta: 1, longitudeDelta: 1))
        self.Map.setRegion(region, animated: true)
        self.locationmanager.stopUpdatingLocation()
    }
    
    @IBAction func close(){
        dismiss(animated:true ,completion:nil);
    }
}
  //Disclaimer : alot of this code belongs to Vea Software
