//
//  EcranMap.swift
//  AppMobiSix
//
//  Created by apprenant138 on 22/06/2026.
//

import SwiftUI
import MapKit

struct EcranMap: View {
    
    @State private var searchText = ""
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.863812, longitude: 2.448451),
                           span:
                            MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    )
    @State private var parkingSelectionne: Parking?
    var parkingsFiltres: [Parking] {
        if searchText.isEmpty {
            return parkings
        }
        
        return parkings.filter {
            $0.nomparking.localizedCaseInsensitiveContains(searchText)
        }
    }
    @State private var afficherProfil = false
    var body: some View {
        NavigationStack {
            ZStack {
                
                Map(position: $position) {
                    
                    ForEach(parkingsFiltres) { parking in
                        
                        Annotation(
                            parking.nomparking,
                            coordinate: CLLocationCoordinate2D(
                                latitude: parking.latitude,
                                longitude: parking.longitude
                            )
                        ) {
                            Button {
                                parkingSelectionne = parking
                            } label: {
                                Image(systemName: "bicycle.circle.fill")
                                    .font(.system(size: 30))
                                    .foregroundStyle(parking.signalementColor)
                            }
                        }
                    }
                    
                }
                .mapStyle(.standard(emphasis: .muted))
                .ignoresSafeArea()
                .allowsHitTesting(true)
                .overlay(alignment: .top) {
                    LinearGradient(
                        colors: [
                            Color.blue.opacity(0.7),
                            Color.clear
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 140)
                    .ignoresSafeArea(edges: .top)
                    .allowsHitTesting(false)
                }
                
                
                
                VStack {
                    
                    HStack {
                        
                        Text("EasyBike")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundStyle(.blue)
                        
                        Spacer()
                        
                        NavigationLink(destination: SignalerVol()) {
                            VStack(spacing: 2) {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .font(.system(size: 50))
                                    .foregroundStyle(.red)
                                   
                                
                                
                                Text("Signaler un vol")
                                    .font(.caption2)
                                    .foregroundStyle(.red).bold()
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.blue)
                            .bold()
                        
                        TextField(
                            "Rechercher un parking vélo",
                            text: $searchText
                        )
                        
                    }
                    .padding()
                    .background(.white)
                    .clipShape(Capsule())
                    .padding(.horizontal).shadow(
                        color: .blue.opacity(0.5),
                        radius: 15,
                        x: 0,
                        y: 0
                    )
                    
                    Spacer()
                }
                
                
                if let parkings = parkingSelectionne {
                    
                    VStack {
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            HStack {
                                Text(parkings.nomparking)
                                    .font(.title3)
                                    .bold()
                                
                                
                                Spacer()
                                
                                Button {
                                    parkingSelectionne = nil
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.title2)
                                        .foregroundStyle(.gray)
                                    
                                }
                            }
                            
                        }
                        .sheet(item: $parkingSelectionne) { parkings in
                            ZStack(alignment: .topTrailing) {
                                VStack(spacing: 20) {
                                    
                                    Image(parkings.imageLieu)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 250)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                    
                                    VStack(spacing: 10) {
                                        HStack {
                                            Image(systemName: "p.square.fill")
                                .foregroundColor(.blue)
                                                .font(.title)
                                        }
                                        VStack(alignment: .leading, spacing: 30) {
                                            Text(parkings.nomparking)
                                                .font(.title2)
                                                .bold()
                                                .foregroundStyle(.blue)
                                            
                                            
                                            Text("\(parkings.adresse)")
                                            Text("Type : \(parkings.type)")
                                            Text("Signalements : \(parkings.nombreSignalement)")
                                            Text("\(parkings.horaire)")
                                                .foregroundStyle(.green)
                                                .bold()
                                                .lineLimit(2)
                                            
                                            
                                            HStack {
                                                
                                                Circle()
                                                    .fill(parkings.signalementColor)
                                                    .frame(width: 12, height: 12)
                                                if parkings.signalementColor == .green {
                                                    Text("Sécurisé")
                                                } else if parkings.signalementColor == .orange {
                                                    Text("Moyennement sécurisé")
                                                } else {
                                                    Text("À risque")
                                                    
                                                }
                                                
                                            }
                                            
                                            
                                            .bold()
                                            
                                        }
                                        
                                        .padding(.horizontal)
                                        Spacer()
                                    }
                                    
                                }
                                
                            }
                            Button { //la petite croix en haut de l'image
                                parkingSelectionne = nil
                            } label: {
                                Text("Fermer")
                                    .font(.title2)
                                    .foregroundStyle(.blue)
                                    .padding()
                            }
                        }
                    }
                    Spacer()
                }
                
            }
        }
        
    }
}
    
    



    #Preview {
        EcranMap()
    }
    
    

