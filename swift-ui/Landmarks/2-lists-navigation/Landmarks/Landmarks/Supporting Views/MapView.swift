/*
 See LICENSE folder for this sample’s licensing information.

 Abstract:
 A view that hosts an `MKMapView`.
 */

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    func makeUIView(context _: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context _: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 34.011_286, longitude: -116.166_868
        )
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
