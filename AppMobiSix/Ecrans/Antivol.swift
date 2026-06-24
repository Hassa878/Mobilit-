//
//  Antivol.swift
//  AppMobiSix
//
//  Created by apprenant138 on 22/06/2026.
//

import SwiftUI

struct Antivols: View {
    var antivelo = [chaine, boa, u, cable, fixe, pliant]
        
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.blue, .white, .white, .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                ScrollView {
                    HStack {
                        Spacer()
                        Text("Listing Antivols")
                            .bold()
                            .padding(.leading, 115)
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
                        .padding(.horizontal)
                        
                    }
                    VStack(spacing: 10) {
                        
                        ForEach(antivelo, id: \.self) { secu in
                            NavigationLink(destination: AntivolDetail(antivol: secu)) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.blue, lineWidth: 1)
                                        .frame(width: 350, height: 125)
                                    
                                    
                                    HStack {
                                        Image(secu.image)
                                            .resizable()
                                            .frame(width: 115, height: 115)
                                        //                        .frame(width: 120, height: 120)
                                        
                                        
                                        VStack(alignment: .leading) {
                                            
                                            Text(secu.antivolType.rawValue)
                                                .bold()
                                                .font(.title2)
                                                .foregroundStyle(.black)
                                            
                                            Spacer()
                                            Text(secu.notation)
                                                .font(.title2)
                                                .foregroundStyle(.black)
                                            Spacer()
                                        }
                                        .padding(.all)
                                    }
                                }
                            }
                        }
                        //    .padding()
                    }
                }
            }
        }
        }
    }
        

    #Preview {
        Antivols()
    }
