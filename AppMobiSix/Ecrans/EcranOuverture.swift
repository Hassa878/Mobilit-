//
//  EcranOuverture.swift
//  AppMobiSix
//
//  Created by apprenant138 on 23/06/2026.
//

import SwiftUI

struct EcranOuverture: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("joliefond")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    
                    Image("logo")
                    
                        .resizable()
                        .frame(width: 350, height: 250)
                        .clipShape(Circle())
                        .padding(.top, 40)
                    
                    Spacer()
                    
                    NavigationLink(destination: EcranMap()) {
                        
                        Text("MON COMPTE")
                            .frame(width: 300, height: 30)
                            .padding()
                            .background(Color(red: 0.1, green: 0.2, blue: 0.5).opacity(0.7))                        .foregroundColor(.white)
                            .cornerRadius(30)
                            .bold()
                            .padding(.bottom)
                        
                    }
                    
                    .padding(.bottom)
                    
                    Button(action: {}) {
                        Text("CREER UN COMPTE")
                            .frame(width: 300, height: 30)
                            .padding()
                            .background(Color(red: 0.1, green: 0.2, blue: 0.5).opacity(0.7))
                            .foregroundColor(.white)
                            .cornerRadius(30)
                            .bold()
                        
                        
                        
                    }
                    Spacer()
                    
                }
                
            }
        }
    }
}
    #Preview {
        EcranOuverture()
    }

