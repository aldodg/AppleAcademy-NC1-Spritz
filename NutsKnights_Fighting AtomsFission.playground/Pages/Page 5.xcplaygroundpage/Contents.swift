//: A UIKit based Playground for presenting user interface

//: [Previous](@previous)
import PlaygroundSupport
import SwiftUI
import Foundation
import UIKit
import Darwin
import AVFoundation

var player_1 : AVAudioPlayer?
var player_2 : AVAudioPlayer?

public func playSound_1() {
    guard let path = Bundle.main.path(forResource: "6", ofType:"mp3") else {
        return }
    let url = URL(fileURLWithPath: path)
    
    do {
        player_1 = try AVAudioPlayer(contentsOf: url)
        player_1?.play()
        //player_1?.setVolume(0, fadeDuration: 30)
        
    } catch let error {
        print(error.localizedDescription)
    }
}

public func playSound_2() {
    guard let path = Bundle.main.path(forResource: "1", ofType:"mp3") else {
        return }
    let url = URL(fileURLWithPath: path)
    
    do {
        player_1 = try AVAudioPlayer(contentsOf: url)
        player_1?.play()
    } catch let error {
        print(error.localizedDescription)
    }
}



struct ContentView : View {
    
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    @State var scale: CGFloat = 0
    @State var off_set = 1
    @State var moltiplicatore = 100
    @State var i = 1
    @State var isActive = false
    var body : some View{
        NavigationView{
            ZStack{
                VStack{
                    NavigationLink(destination: ContentView_2(), isActive: self.$isActive){
                        
                    }
                }
                VStack{
                    Text("THAT’S WHAT HAPPEN WHEN AMONG A GROUP\nTHERE IS NO TOLERANCE AND RESPECT.\nWE ARE ONE LARGE GROUP OF PEOPLE,\nDON’T BE THAT NEUTRON.\nBE A LITTLE KIND PARTICLE\nAND LIVE HAPPY WITH THE OTHERS!")
                        .font(.custom("ChalkboardSE-Regular", size: 15))
                        .frame(alignment: .center)
                        .foregroundColor(.white)
                        .position(x: 200, y: 230)
                }
                VStack{
                    Button(action: {
                        self.isActive = true
                        
                    }){
                        Text("Tap Anywhere")
                            .font(.custom("ChalkboardSE-Regular", size: 15))
                            .frame(width: 400, height: 600)
                            .position(x: 200, y: 500)
                            .foregroundColor(.white)
                    }
                }
            }
            .frame(width: 400, height: 600)
            .background(RadialGradient(gradient: Gradient(colors: [.black, .black,.blue]), center: .center, startRadius: 100, endRadius: 400))
            .onAppear(perform: playSound_1)
        }
    }
}

struct ContentView_2 : View{
    
    @State var scale: CGFloat = 0
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View{
        NavigationView{
            ZStack{
                VStack{
                    Text("Fighting Atoms’ Fission\n\nDirected by\n Francesco Maria Di Donna\n Alba Capasso\n Aldo Di Giovanni\n Dario Vigilante\n\nCasting\n\nNeutron 1: Peppino di Capri\nNeutron2: Jennifer Lopez\nProton 1: Ton Prot\nProton 2: Stacchio Pi\nGuest: Tina Palpa\nSpecial guest: Francesca Pocchia\n\nWith the participation of Gennaro Bullo playing\nUncle Jack\n\nPhotography\n Dario Vigilante\n\nEditing\n Francesco Maria Di Donna\n\nMusic\n Aldo Di Giovanni\n\nRunner\n Alba Capasso\n\nCameraman\n Steven Spielberg\n\nProduction\n BBC\n\nHairstylist\n Marco Cesarano\n\nMakeUp\n Marco Cesarano\n\nPsychologist\n Grazia Oriunto\n\nButler\n Winnie The Pooh\n\nScenography\n Tonio Cartonio\n\nMarketing Director\n Gigi D’Alessio\n\nConductor\n Beppe Vessicchio\n\nExecutive Productor\n Gianni Morandi\n\nArt Designer\n Massimo Boldi\n\nFilm Script\n John Falsetti\n\nThanks to the municipalities of Mondragone, Pompei, Portici and Napoli\n\nNo animals or people were harmed\nin the making of this playground. Except Aldo\n\nThis playground contains product placement\n\n\n\nThanks to Ada.")
                        .font(.custom("ChalkboardSE-Regular", size: 15))
                        .frame(alignment: .center)
                        .foregroundColor(.white)
                        .position(x: 200, y: 1500)
                        .offset(y: -100*scale)
                        .animation(.linear(duration: 3), value: scale)
                        .onReceive(timer) { _ in
                            scale = scale + 3
                        }
                }
            }
            .frame(width: 400, height: 2000, alignment: .center)
            .background(Color.black)
            .onAppear(perform: playSound_2)
        }
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.setLiveView(ContentView())

