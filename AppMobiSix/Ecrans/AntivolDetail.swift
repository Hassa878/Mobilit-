//
//  AntivolDetail.swift
//  AppMobiSix
//
//  Created by apprenant138 on 23/06/2026.
//

import SwiftUI

struct AntivolDetail: View {
    let antivol: Antivol
    var body: some View {
        ZStack {
           LinearGradient(colors: [.blue,.white,.white, .white], startPoint: .top, endPoint: .bottom
                            )
                            .ignoresSafeArea()
            VStack {
                Text(antivol.antivolType.rawValue)
                    .bold()
                    .font(.largeTitle)
                Image(antivol.image)
                    .resizable()
                    .frame(width: 250, height: 250)
                Text(antivol.marque)
                    .font(.title)
                Text(antivol.description)
                Text(antivol.niveauSecu)
                Text(antivol.prix)
                Link("Acheter ici", destination: URL(string: antivol.lien)!)
                    .foregroundColor(.blue)
            }
            .padding()
        }
    }
}
#Preview {
    Antivols()
}


