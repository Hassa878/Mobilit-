//
//  Alertes.swift
//  AppMobiSix
//
//  Created by apprenant138 on 22/06/2026.
//

import SwiftUI


struct Alertes: View {
    
    @State private var recherche : String = ""
    
    var alertesFiltrees: [Signaler] {
        if recherche.isEmpty {
            return alertes
        }

        return alertes.filter {
            $0.lieu.nomparking.lowercased().contains(recherche.lowercased())
            
        }
    }
    var body: some View {
        
        NavigationStack {
            
                    ZStack {
                        LinearGradient(
                            colors: [.blue,.white,.white, .white],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .ignoresSafeArea()
                        ScrollView {
                            VStack{
                                HStack {
                                    
                                    Spacer()
                                    Text ("Alerte vol")
                                        .bold()
                                        .padding(.leading, 86)
                                    
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
                                    
                                    TextField("Rechercher une alerte...", text: $recherche)
                                        .padding()
                                        .background(Color.gray.opacity(0.15))
                                        .cornerRadius(12)
                                        .padding(.horizontal)
                                    
                                        .overlay(
                                            Image(systemName: "magnifyingglass")
                                                .foregroundColor(.gray)
                                                .padding(.trailing, 30),
                                            alignment: .trailing
                                            
                                            
                                            
                                        )
                                    
                                }
                                    
                                VStack {
                                    ForEach(alertesFiltrees) { alerte in
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.blue, lineWidth: 4)
                                                .frame(width: 360, height: 200)
                                            
                                            
                                            
                                            HStack(alignment: .top) {
                                                
                                                VStack(alignment: .leading, spacing: 6) {
                                                    Image(alerte.utilisateur.photoVelo)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 135, height: 135)
                                                        .clipped()
                                                    
                                                    Text(alerte.date)
                                                        .font(.caption2)
                                                }
                                                
                                                VStack (alignment: .leading, spacing: 6){
                                                    Text("Alerte vol")
                                                        .font(.subheadline)
                                                        .bold()
                                                    
                                                    HStack{
                                                        Text(alerte.utilisateur.marqueVelo)
                                                        Text("-")
                                                        Text (alerte.utilisateur.typeVelo.rawValue)
                                                    }
                                                    
                                                    
                                                    Text(alerte.utilisateur.couleurVelo.rawValue)
                                                
                                                    Text(alerte.lieu.nomparking)
                                                    
                                                    
                                                    Text (alerte.lieu.adresse)
                                                    
                                                    Text(alerte.commentaire)              }
                                                .font(.caption)
                                                
                                            }
                                            .padding()
                                            
                                            .frame(width: 360, height: 200, alignment: .topLeading)
                                            
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                    
                }
            }
        }
    

        #Preview {
            Alertes()
        }
    
