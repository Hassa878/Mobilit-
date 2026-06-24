//
//  InfoPratique.swift
//  AppMobiSix
//
//  Created by apprenant138 on 22/06/2026.
//

import SwiftUI




struct InfosPratiques: View {
    //@State private var touche: Int = 0
    
    let infos = [
        InfoPratique(
            numero: "1",
            titre: "Pré-plainte en ligne",
            description: "Effectuer une pré-plainte en ligne avant de vous rendre au commissariat."),
        
        InfoPratique(
            numero: "2",
            titre: "Se rendre au commissariat",
            description: "Déposer plainte le plus vite possible pour signaler officiellement le vol."),
        
        InfoPratique(
            numero: "2",
            titre: " Documents nécessaires",
            description: "Pièce d'identité, facture du vélo, numéro de série et photos."),
        
        InfoPratique(
            numero: "3",
            titre: "Contacter son assurance",
            description: "Déclarez le vol dans les délais prévus par votre contrat afin de connaître vos possibilités d'indemnisation."),
        
        InfoPratique(
            numero: "4",
            titre: "Conseil",
            description: "Conservez toujours le numéro de série et des photos récentes de votre vélo.")]
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                LinearGradient(colors: [.blue, .white,.white,.white],startPoint: .top,endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack {
                    HStack {
                        
                        Text("Infos pratiques")
                            .padding(.leading, 130)
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
                    .bold()
                    
                    ScrollView {
                        VStack(spacing: 20) {
                        Text("Que faire en cas de vol ?")
                            .font(.title)
                            .bold()
                            .padding(.top)
                                    
                            ForEach(infos, id: \.self) { info in
                                HStack {
                                    Text(info.numero)
                                        .font(.title)
                                        .bold()
                                        .foregroundStyle(.cyan)
                                    Spacer()
                                        .frame(width : 20)
                                    VStack(alignment: .leading) {
                                        Text(info.titre)
                                            .font(.title3)
                                            .fontWeight(.heavy)
                                        
                                        Text(info.description)
                                            .font(.headline)
                                        
                                        if info.numero == "1" {
                                            Link("Accéder au site de pré-plainte",
                                                 destination:URL(string:"https://aab.plainte-en-ligne.masecurite.interieur.gouv.fr/accueil")!)
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .padding()
                                .frame(width: 350)
                                .background(.white)
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius:15)
                                        .stroke(Color.blue, lineWidth: 1)
                                )
                            }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        #Preview {
            InfosPratiques()
        }
