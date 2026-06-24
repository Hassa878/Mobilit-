//
//  SignalerVol.swift
//  AppMobiSix
//
//  Created by apprenant138 on 22/06/2026.
//

import SwiftUI

struct SignalerVol: View {
    
    //    @State private var touche: Int = 0
    
    @State private var photoAjoutee = false
    @State private var lieu = parkingMontreuil
    @State private var date : String = ""
    @State private var commentaire: String = ""
    @State private var typeAntivol: AntivolType = .u
    @State private var messageEnvoye = false
    
    
    var body: some View {
        
        
        ZStack {
            //NavigationStack {}
            // NavigationLink() { AlerteView}
            LinearGradient(colors: [.blue, .white, .white, .white],startPoint: .top,
                           endPoint: .bottom)
            
            .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("Signaler un vol")
                        .bold()
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 15) {            MenuButton(
                        icon: "camera",
                        text: photoAjoutee ? "Photo ajoutée" : "Ajouter une photo"
                    ) {
                        photoAjoutee.toggle()
                    }
                        
                        MenuButton(
                            icon: "mappin.and.ellipse",
                            text: "Lieu : parkingMontreuil"
                        ) {
                            lieu = parkingMontreuil
                        }
                        
                        MenuButton(
                            icon: "calendar",
                            text: date.isEmpty ? "Choisir la date" : date
                        ) {
                            date = "20/06/2026 14:30"
                        }
                        
                        
                        HStack {
                            Text("Type antivol")
                                .foregroundStyle(.black)
                            Spacer()
                            Picker("", selection: $typeAntivol) {
                                ForEach(AntivolType.allCases, id: \.self) { type in
                                    Text(type.rawValue).tag(type)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                        .padding(.horizontal, 15)
                        .frame(width: 370, height: 70)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                        
                        ZStack(alignment: .topLeading) {
                            TextEditor(text: $commentaire)
                                .frame(height: 160)
                                .scrollContentBackground(.hidden)
                                .background(.clear)
                                .padding(4)
                            
                            if commentaire.isEmpty {
                                Text("Ajouter un commentaire...")
                                    .foregroundStyle(.gray)
                                    .padding(.top, 12)
                                    .padding(.leading, 8)
                            }
                        }
                        .background(.white)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                        
                        Button {
                            messageEnvoye = true
                        } label: {
                            Text("Envoyer")
                                .frame(width: 350, height: 40)
                        }
                        .buttonStyle(.borderedProminent)
                        
                        if messageEnvoye {
                            Text("Signalement envoyé")
                                .foregroundStyle(.red)
                                .frame( maxWidth : .infinity, alignment: .center)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
        }
    }
    struct MenuButton: View {
        let icon: String
        let text: String
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                HStack {
                    Image(systemName: icon)
                    Text(text)
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.blue, lineWidth: 1)
                )
            }
        }
    }
}
    #Preview {
        SignalerVol()
    }
    
