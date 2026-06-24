//
//  ContentView.swift
//  AppMobiSix
//
//  Created by apprenant138 on 22/06/2026.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        TabView {
            EcranMap()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                   
                }
            
            Alertes()
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("Alertes")
                    
                }
            
            
            
            Antivols()
                .tabItem {
                    Image(systemName: "lock.shield")
                    Text("Antivol")
                   
                }
            InfosPratiques()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("Infos")
                    
                        
                }
            MonDraft2()
                .tabItem {
                    Image(systemName: "bicycle.circle.fill")
                    Text("Profil")
                    
                        
                }
           
        }
        .tint(.blue)
    }
}
#Preview {
    ContentView()
}
