import CoreLocation

class LocationManager: NSObject {
    static let shared: LocationManager = .init()
    
    let activityManager: MyActivityManager = .shared
    
    private let locationManager: CLLocationManager = .init()
    
    private override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.allowsBackgroundLocationUpdates = true
    }
    
    func start() {
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        Task {
            await activityManager.update(contentState: .init(locationText: location.description))
        }
    }
}
