//
//  MonDraft2.swift
//  AppMobiSix
//
//  Created by apprenant138 on 22/06/2026.
//

import SwiftUI

struct MonDraft2: View {

    @State var typeVeloSelectionne: TypeVelo = utilisateur1.typeVelo
    @State var couleurSelectionnee: CouleursVelo = utilisateur1.couleurVelo
    @State private var valider = false
    //@State var couleurVeloSaisie: string = utilisateur1.couleurVelo

    var body: some View {
        
            ZStack {
                LinearGradient(colors: [.blue, .white, .white,.white], startPoint: .top, endPoint: .bottom)
                
                    .ignoresSafeArea()
                ScrollView {
                VStack {
                    Circle().stroke(.black, lineWidth: 9)
                        .frame(width: 120, height: 120)
                        .overlay {
                            Image(utilisateur1.photoVelo)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                            
                        }
                    Spacer()
                    
                    Text("MES INFOS")
                        .foregroundColor(.black)
                        .bold()
                    
                        .padding()
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 20)
                        
                            .stroke(.blue, lineWidth: 2)
                            .frame(width: 280, height: 60)
                        
                        
                        Text(utilisateur1.nom)
                            .bold()
                            .padding()
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .padding()
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                        
                            .stroke(.blue, lineWidth: 2)
                            .frame(width: 280, height: 60)
                            .foregroundColor(.gray)
                        
                        Text(utilisateur1.email)
                            .bold()
                            .padding()
                            .foregroundColor(.gray)
                    }
                    Text("MON VELO")
                        .foregroundColor(.black)
                        .bold()
                        .padding()
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                        
                            .stroke(.blue, lineWidth: 2)
                            .frame(width: 280, height: 60)
                        HStack {
                            Text("Marque")
                                .bold()
                            Spacer()
                            Text(utilisateur1.marqueVelo)
                                .bold()
                                .foregroundColor(.blue)
                        }
                        .padding(.horizontal, 30)
                            .frame(width: 320)
                    }
                    .padding()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                        
                            .stroke(.blue, lineWidth: 2)
                            .frame(width: 280, height: 60)
                        HStack {
                            
                            Text("Couleurs")
                                .bold()
                                
                            Spacer()
                            
                        Picker("Couleur",
                            selection: $couleurSelectionnee) {
                            ForEach(CouleursVelo.allCases) { couleur in
                                Text(couleur.rawValue)
                                    .tag(couleur)
                                    .bold()
                            }
                          
                            }
                        }
                        .frame(width: 265)
                    }
                    
                    .padding()
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                            
                                .stroke(.blue, lineWidth: 2)
                                .frame(width: 280, height: 60)
                            HStack {
                                Text("Type")
                                    .bold()
                                    .foregroundStyle(.black)
                                Spacer()
                            Picker("Type de vélo", selection: $typeVeloSelectionne) {
                                ForEach(TypeVelo.allCases) { type in
                                    Text(type.rawValue)
                                        .tag(type)
                                        .bold()
                                }
                                
                                }
                            }
                            .pickerStyle(.menu)
                            .tint(.blue)
                            .frame(width: 265)
                        }
                        .padding()
                            
                        
                        .onChange(of: typeVeloSelectionne) { nouvelleValeur in
                            utilisateur1.typeVelo = nouvelleValeur
                        }
                        //Rajouter un rectangle "valider"??
                        
                        
                    }
                    .foregroundStyle(.white)
                    .padding()
                    
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 20)
                        
                            .stroke(.blue, lineWidth: 2)
                            .frame(width: 280, height: 60)
                        
                        Button {
                        }label: {
                            Text("Ajoutez un vélo")
                                .bold()
                                .padding()
                                .foregroundColor(.blue)
                        }
                        
                    }
                    
                    .padding()
                    ZStack {
                        
                        Button {
                            valider = true
                        } label: {
                            Text("Valider")
                                .frame(width: 350, height: 40)
                                .foregroundStyle(.white)
                        }
                        .alert("Compte mis à jour", isPresented: $valider) {
                            Button("OK", role: .cancel) {}
                        
                            }
                        }
                        .frame(width: 300, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.blue))
                        Spacer()
                    }
                }
            }
        }
    }


#Preview {
    MonDraft2()
}

