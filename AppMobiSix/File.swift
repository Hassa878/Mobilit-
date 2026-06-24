//
//  File.swift
//  AppMobiSix
//
//  Created by apprenant138 on 22/06/2026.
//

import SwiftUI

struct Utilisateur: Identifiable, Hashable {
    var id = UUID()
    var nom: String
    var email: String
    var mdp: String
    var photoVelo: String
    var marqueVelo: String
    var typeVelo: TypeVelo
    var couleurVelo: CouleursVelo
}

enum TypeVelo: String, CaseIterable, Identifiable {
    case vtt = "VTT"
    case bmx = "BMX"
    case pliable = "Pliable"
    case clm = "CLM"
    case piste = "Piste"
    case couche = "Couché"
    case cross = "Cyclocross"
    case vae = "VAE"
    case route = "Route"
    case cargo = "Cargo"
    case cargoVae = "Cargo VAE"
    var id: String { self.rawValue }
}

enum CouleursVelo: String, CaseIterable, Identifiable {
    case noir = "Noir"
    case blanc = "Blanc"
    case gris = "Gris"
    case rouge = "Rouge"
    case bleu = "Bleu"
    case vert = "Vert"
    case jaune = "Jaune"
    case orange = "Orange"
    case rose = "Rose"
    case violet = "Violet"
    case marron = "Marron"
    case beige = "Beige"
    case argent = "Argent"
    case or = "Or"
    var id: String { self.rawValue }
}

struct Signaler: Identifiable, Hashable {
    var id = UUID()
    var date: String
    var commentaire: String
    var lieu: Parking
    var utilisateur: Utilisateur
    
}



struct Antivol: Identifiable, Hashable {
    var id = UUID()
    var image: String
    var antivolType: AntivolType
    var description: String
    var niveauSecu: String
    var marque: String
    var prix: String
    var lien: String
    var notation: String
}

enum AntivolType: String, CaseIterable {
    case u = "Antivol en U"
    case pliant = "Antivol pliant"
    case fixe = "Antivol fixe"
    case boa = "Antivol boa"
    case cable = "Antivol câble"
    case chaine = "Antivol chaîne"
    }

struct InfoPratique: Identifiable, Hashable {
    var id = UUID()
    let numero: String
    let titre: String
    let description: String
}

struct Parking : Identifiable, Hashable {
    var id = UUID()
    
    var nomparking: String
    var imageLieu: String
    var adresse: String
    var horaire: String
    
    var latitude: Double
    var longitude: Double
    
    var type: String
    var couvert: Bool
    
    var nombreSignalement: Int
    var signalementColor: Color
}

enum SignalementColor {
    case securise, moyen, danger
    
    var color: Color {
        switch self {
        case .securise:
            return .green
        case .moyen:
            return .orange
        case .danger:
            return  .red
        }
    }
}




var utilisateur1 = Utilisateur(nom: "BikeLover", email: "jaimeLeVelo@gmail.com", mdp: "1234", photoVelo: "velo1", marqueVelo: "Schwinn", typeVelo: .route, couleurVelo: .bleu)

var utilisateur2 = Utilisateur(nom: "VeloPro", email: "velopro@gmail.com", mdp: "5678", photoVelo: "velo2", marqueVelo: "Goot", typeVelo: .vtt, couleurVelo: .rose)

var utilisateur3 = Utilisateur(nom: "CycloMax", email: "cyclomax@gmail.com", mdp: "abcd", photoVelo: "velo3", marqueVelo: "Oggi", typeVelo: .vtt, couleurVelo: .orange)

var utilisateur4 = Utilisateur(nom: "BikeLover", email: "jaimeLeVelo@gmail.com", mdp: "1234", photoVelo: "velo4", marqueVelo: "Décathlon", typeVelo: .cross, couleurVelo: .bleu)

var utilisateur5 = Utilisateur(nom: "UrbanRider", email: "urbanrider@gmail.com", mdp: "velo2026", photoVelo: "velo5", marqueVelo: "Specialized", typeVelo: .cargo, couleurVelo: .noir)

let utilisateurs = [
    utilisateur1,
    utilisateur2,
    utilisateur3,
    utilisateur4,
    utilisateur5
]

var alert1 = Signaler (date: "2026-06-10", commentaire: "Le vélo est resté seulement 1h sur le parking. Le vélo était attaché à un arceau.", lieu: parkingMontreuil, utilisateur: utilisateur1)

var alert2 = Signaler (date: "2026-06-13", commentaire: "Le vélo était attaché dans un box fermé.", lieu: parkingCroixDeChavaux, utilisateur: utilisateur2)

var alert3 = Signaler (date: "2026-06-16", commentaire: "Le vélo était attaché à un arceau public devant une station de métro. Le cadenas a été forcé durant la nuit.", lieu: parkingMontreuil, utilisateur: utilisateur3)

var alert4 = Signaler (date: "2026-06-19", commentaire: "Le vélo était garé dans un parking extérieur non surveillé et peu fréquenté.Il n'y avait pas de caméras.", lieu: parkingMontreuil, utilisateur: utilisateur4)

var alert5 = Signaler( date: "2026-06-22", commentaire: "Le vélo était stationné dans un box vélo fermé au parking Croix de Chavaux.", lieu: parkingCroixDeChavaux, utilisateur: utilisateur5)

let alertes = [
    alert1,
    alert2,
    alert3,
    alert4,
    alert5
]

var chaine = Antivol(image: "chaîne", antivolType: .chaine, description: "Longueur 80cm. Serrure haut sécurité anticrochetage et anti perçage.", niveauSecu: "ART 2", marque: "Btwin", prix: "39,99 €", lien: "https://www.decathlon.fr/p/antivol-velo-chaine-900-m/345556/m8795827", notation: "3/5 ★★★☆️☆️")

var u = Antivol(image: "ant U", antivolType: .u, description: "Cylindre de haute sécurité à disque et double pêne dormant", niveauSecu: "ART 2", marque: "Kryptonite", prix: "69,90 €", lien: "https://www.decathlon.fr/p/antivol-velo-u-evolution-mini-7-avec-cable-kryptoflex/370607/m8957402", notation: "5/5 ★★★★★")

var pliant = Antivol(image: "pliant", antivolType: .pliant, description: "longueur de 90 cm et doté de maillons en acier trempé", niveauSecu: "ART 1", marque: "Trelock", prix: "102,26 €", lien: "https://www.amazon.fr/dp/B0DQVH4JZS/?smid=AJ13NRUKJ99I5&tag=idealofr-aw2-21&linkCode=asn&creative=6742&camp=1638&creativeASIN=B0DQVH4JZS&ascsubtag=2026-06-18_ecf55cdbf56d189f441dfd44524cd22ba5debcd766a677cc852955f4c641b7ea&th=1&psc=1", notation: "4/5 ★★★★☆️")

var cable = Antivol(image: "cable", antivolType: .cable, description: "Câble spiralé léger pour arrêts courts", niveauSecu: "ART 1", marque: "Ivera 7220", prix: "25,95 €", lien: "https://www.abus.com/fr/Particuliers/Antivols-pour-velos", notation: "2/5 ★★☆️☆️☆️")

var boa = Antivol(image: "boa", antivolType: .boa, description: "Longueur de 1,2 m. Le revêtement en vinyle transparent protège vos équipements contre les rayures", niveauSecu: "ART 1", marque: "Master lock", prix: "39,36 €", lien: "https://www.raja.fr/stockage-manutention-securite/equipements-generaux/cadenas-et-metre-rubans/cable-antivol_sku8115EURDPS.html?priceVAT=true&utm_campaign=FR-PLA-%20-Marque&utm_source=google&utm_medium=cpc&gad_source=1&gad_campaignid=16857735576&gbraid=0AAAAAD-3bd8Q-Bswg0k7plIwArH56Z3p9&gclid=Cj0KCQjwrs7RBhDuARIsAIVfBD2GWuOBbFeOp0vj5YXnc1yRCjCDF-cY4tXs4zFTRCgeN-Mhf8D1LwUaAuhQEALw_wcB", notation: "1/5 ★☆️☆️☆️☆️")

var fixe = Antivol(image: "fixe", antivolType: .fixe, description: "Boîtier soudé et cylindre haute sécurité avec plaque anti-perçage et codage de clé avancé", niveauSecu: "ART 2", marque: "AXA Atlas", prix: "43,00 €", lien: "https://www.decathlon.fr/p/mp/axa-atlas-large-antivol-a-anneau-72-5-mm-noir/dc938444-5d84-4d83-994c-df58e68e7e6b/c1?utm_source=google&utm_medium=sea", notation: "3/5 ★★★☆️☆️")

               


    
    



// Parking
var parkingMontreuil = Parking(
    nomparking: "Parking Montreuil Centre",
    imageLieu: "montreuilcentre",
    adresse: "1 Rue de Paris, 93100 Montreuil",
    horaire: "24/24",
    latitude: 48.843288,
    longitude: 2.432795,
    type: "Extérieur",
    couvert: false,
    nombreSignalement: 7,
    signalementColor: SignalementColor.danger.color
)

var parkingCroixDeChavaux = Parking(
    nomparking: "Croix-de-Chavaux",
    imageLieu: "Croixdechavaux",
    adresse: "3 Rue Parmentier, 93100 Montreuil",
    horaire: "7h-22h",
    latitude: 48.8579,
    longitude: 2.4430,
    type: "Box exterieur fermé",
    couvert: true,
    nombreSignalement: 3,
    signalementColor: SignalementColor.moyen.color
)

var parkingGrandAngle = Parking(
    nomparking: "Cyclopark Grand Angle",
    imageLieu: "Cyclopark",
    adresse: "3 Rue Franklin, 93100 Montreuil",
    horaire: "6h-23h",
    latitude: 48.864,
    longitude: 2.443,
    type: "Souterrain",
    couvert: true,
    nombreSignalement: 0,
    signalementColor: SignalementColor.securise.color
)


var parkings = [
    parkingMontreuil,
    parkingCroixDeChavaux,
    parkingGrandAngle
]





//let utilisateursExemple: [Utilisateur] = [
//    Utilisateur(
//        nom: "Jean Dupont",
//        email: "jean.dupont@gmail.com",
//        mdp: "JeanVelo2026!",
//        photoVelo: "velo_route_noir",
//        marqueVelo: "Moma",
//        typeVelo: .cross,
//        couleurVelo: "Noir mat"
//    ),
//    Utilisateur(
//        nom: "Claire Martin",
//        email: "claire.martin@yahoo.fr",
//        mdp: "ClaireBike75*",
//        photoVelo: "velo_vtt_vert",
//        marqueVelo: "Rockrider",
//        typeVelo: .vtt,
//        couleurVelo: "Vert forêt"
//    ),
//    Utilisateur(
//        nom: "Lucas Bernard",
//        email: "lucas.bernard@icloud.com",
//        mdp: "LuluBMX#29",
//        photoVelo: "velo_bmx_bleu",
//        marqueVelo: "WeThePeople",
//        typeVelo: .bmx,
//        couleurVelo: "Bleu électrique"
//    ),
//    Utilisateur(
//        nom: "Sophie Leroy",
//        email: "sophie.leroy@outlook.fr",
//        mdp: "SophieCargo12",
//        photoVelo: "velo_cargo_rouge",
//        marqueVelo: "Yuba",
//        typeVelo: .cargo,
//        couleurVelo: "Rouge brique"
//    ),
//    Utilisateur(
//        nom: "Nicolas Petit",
//        email: "npetit@proton.me",
//        mdp: "VAEParis2026",
//        photoVelo: "velo_vae_gris",
//        marqueVelo: "Nakamura",
//        typeVelo: .vae,
//        couleurVelo: "Gris anthracite"
//    ),
//    Utilisateur(
//        nom: "Emma Roche",
//        email: "emma.roche@gmail.com",
//        mdp: "RouteCafe88",
//        photoVelo: "velo_route_blanc",
//        marqueVelo: "Van Rysel",
//        typeVelo: .route,
//        couleurVelo: "Blanc perle"
//    )
//]
//
//let antivolsExemple: [Antivol] = [
//    Antivol(
//        image: "antivol_chaine_btwin_900",
//        antivolType: .chaine,
//        description: "Antivol vélo chaîne 900 M",
//        niveauSecu: "ART 2",
//        marque: "Btwin",
//        prix: "39,99 €",
//        lien: "https://www.decathlon.fr/p/antivol-velo-chaine-900-m/345556/m8795827"
//    ),
//    Antivol(
//        image: "antivol_u_kryptonite",
//        antivolType: .u,
//        description: "Evolution Mini-7 avec câble flex",
//        niveauSecu: "Sold Secure Gold",
//        marque: "Kryptonite",
//        prix: "54,95 €",
//        lien: "https://www.kryptonitelock.com"
//    ),
//    Antivol(
//        image: "antivol_pliant_abus_bordo",
//        antivolType: .pliant,
//        description: "Bordo Granit XPlus 6500",
//        niveauSecu: "Sold Secure Gold",
//        marque: "Abus",
//        prix: "129,95 €",
//        lien: "https://mobil.abus.com"
//    ),
//    Antivol(
//        image: "antivol_cable_axa",
//        antivolType: .cable,
//        description: "Câble spiralé léger pour arrêts courts",
//        niveauSecu: "Niveau 4/15",
//        marque: "AXA",
//        prix: "19,99 €",
//        lien: "https://www.axasecurity.com"
//    ),
//    Antivol(
//        image: "antivol_boa_texlock",
//        antivolType: .boa,
//        description: "Antivol textile souple pour vélo urbain",
//        niveauSecu: "Niveau moyen",
//        marque: "Tex-lock",
//        prix: "99,00 €",
//        lien: "https://tex-lock.com"
//    ),
//    Antivol(
//        image: "antivol_fixe_trelock",
//        antivolType: .fixe,
//        description: "Antivol de cadre pratique pour trajets quotidiens",
//        niveauSecu: "Niveau 10",
//        marque: "Trelock",
//        prix: "44,90 €",
//        lien: "https://www.trelock.com"
//    )
//]
//
//let parkingsExemple: [Parking] = [
//    Parking(
//        latitude: 48.843288,
//        longitude: 2.432795,
//        type: "Extérieur",
//        nombreSignalement: 0,
//        signalementColor: .securise
//    ),
//    Parking(
//        latitude: 48.856614,
//        longitude: 2.3522219,
//        type: "Arceau",
//        nombreSignalement: 1,
//        signalementColor: .securise
//    ),
//    Parking(
//        latitude: 48.85837,
//        longitude: 2.294481,
//        type: "Parking couvert",
//        nombreSignalement: 3,
//        signalementColor: .moyen
//    ),
//    Parking(
//        latitude: 48.873791,
//        longitude: 2.295028,
//        type: "Consigne sécurisée",
//        nombreSignalement: 2,
//        signalementColor: .securise
//    ),
//    Parking(
//        latitude: 48.884716,
//        longitude: 2.370014,
//        type: "Extérieur",
//        nombreSignalement: 6,
//        signalementColor: .danger
//    ),
//    Parking(
//        latitude: 48.82618,
//        longitude: 2.35707,
//        type: "Sous vidéo-surveillance",
//        nombreSignalement: 2,
//        signalementColor: .moyen
//    )
//]
//
//let signalementsExemple: [Signaler] = [
//    Signaler(
//        date: "2026-06-01 08:15",
//        commentaire: "Zone calme le matin, arceaux bien visibles.",
//        lieu: parkingsExemple[0]
//    ),
//    Signaler(
//        date: "2026-06-03 19:20",
//        commentaire: "Peu éclairé en soirée, prévoir un antivol solide.",
//        lieu: parkingsExemple[2]
//    ),
//    Signaler(
//        date: "2026-06-06 14:05",
//        commentaire: "Un vélo sans roue signalé à proximité cette semaine.",
//        lieu: parkingsExemple[4]
//    ),
//    Signaler(
//        date: "2026-06-10 07:50",
//        commentaire: "Parking pratique pour déposer un cargo avant l'école.",
//        lieu: parkingsExemple[3]
//    ),
//    Signaler(
//        date: "2026-06-12 21:10",
//        commentaire: "Passage fréquent mais ambiance moyenne après 20h.",
//        lieu: parkingsExemple[5]
//    )
//]
//struct Alert: Identifiable, Hashable {
//    var id = UUID()
//
//    var date: Signaler
//    var commentaire: Signaler
//    var lieu: Signaler
//    var photoVelo: Utilisateur
//    var marqueVelo: Utilisateur
//    var typeVelo: TypeVelo
//    var couleurVelo: Utilisateur
//}
//
//    var alert1 = Signaler (date: "2026-06-10", commentaire: "Le vélo était garé dans un parking extérieur non surveillé et peu fréquenté. Il n'y avait pas de caméras.", lieu: "1 Rue de Paris, Montreuil", photoVelo: "velo1", marqueVelo: "Scott Contessa 730", typeVelo: .vtt, couleurVelo: "Rose")
//
//    var alert2 = Signaler (date: "2026-06-11", commentaire: "Le vélo était attaché à un arceau situé devant une résidence.", lieu: "Avenue Daumesnil, Paris", photoVelo: "velo2", marqueVelo: "KTM X30", typeVelo: .vtt, couleurVelo: "Orange")
//
//    var alert3 = Signaler (date: "2026-06-16", commentaire: "Le vélo était attaché à un arceau public devant une station de métro. Le cadenas a été forcé durant la nuit.", lieu: "Rue de Belleville, Paris", photoVelo: "velo3", marqueVelo: "KSW Fat Bike", typeVelo: .vtt, couleurVelo: "Bleu")
//

// Utilisateur
