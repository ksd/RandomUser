//
//  Detail.swift
//  RandomUser
//
//  Created by ksd on 13/10/2022.
//

import SwiftUI
import MapKit

struct Detail: View {
    let user: User
    
    private var userRegion: Binding<MKCoordinateRegion> {
        Binding {
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: Double(user.location.coordinates.latitude) ?? 56.12048385605613,
                    longitude: Double(user.location.coordinates.longitude) ?? 10.158898524003025),
                latitudinalMeters: 50,
                longitudinalMeters: 50)
        } set: {value in
            
        }

    }
    
    
    var body: some View {
        VStack{
            Text("\(user.name.first) \(user.name.last)")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            Map(coordinateRegion: userRegion, annotationItems: [user]) { user in
                MapMarker(
                    coordinate: userRegion.wrappedValue.center,
            tint: .red)
            }
        }
    }
}

struct Detail_Previews: PreviewProvider {
    
    static var previews: some View {
        Detail(user: User.demoUser)
    }
}
