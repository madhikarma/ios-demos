//
//  MapView.swift
//  Landmarks
//
//  Created by Shagun Beta on 13/11/2019.
//  Copyright © 2019 madhikarma. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: View, UIViewRepresentable {
    
    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 34.011286, longitude: -116.166868)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        MKMapView(frame: .zero)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
