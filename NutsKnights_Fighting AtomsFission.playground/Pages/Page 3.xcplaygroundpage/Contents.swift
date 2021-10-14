//: [Previous](@previous)
import UIKit
import SwiftUI
import PlaygroundSupport
import AVFoundation
import Darwin

var player_1: AVAudioPlayer?

public func playSound_1() {
    guard let path = Bundle.main.path(forResource: "3", ofType:"mp3") else {
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
    @State var bgcolor = Color.green
    @State var img="1"
    var body : some View{
        ZStack{
            VStack{
                Text("MAYBE NOT SO PEACEFUL...").font(Font.custom("ChalkboardSE-Regular", size: 15))
                    .foregroundColor(.black)
                    .font(.caption)
                    .frame(width: 320, height: 30)
                    .background(Color.yellow)
                    .cornerRadius(5)
            }
            .position(x:200, y:20)
            VStack{
                Image(uiImage:
                    #imageLiteral(resourceName: img))
                    .frame(width:400, height:600)

    
            }
            HStack{
                Button(action: {
                    if (Int(img) ?? 0) <= 5 && (Int(img) ?? 1) >= 1 {
                        img = String((Int(img) ?? 0) - 1)}
                }) {
                    Text("<< Previuos")
                        .foregroundColor(.white)
                        .position(x: 100, y: 550)
                        .font(Font.custom("ChalkboardSE-Regular", size: 20))
                        .frame(width: 200, height: 600)
                }
                Button(action: {
                    if  (Int(img) ?? 0) <= 4 && (Int(img) ?? 0) >= 0 {
                        img = String((Int(img) ?? 0) + 1)}
                }) {
                    Text("Next >>")
                        .foregroundColor(.white)
                        .position(x: 100, y: 550)
                        .font(Font.custom("ChalkboardSE-Regular", size: 20))
                        .frame(width: 200, height: 600)
                                           
                }
                }
                
            
        }
        .frame(width:400, height:600)
        .onAppear(perform: playSound_1)
//        .background(Color.cyan)
        .background(RadialGradient(gradient: Gradient(colors: [.white, .orange, .red]), center: .center, startRadius: 100, endRadius: 400))
//        .background(RadialGradient(gradient: Gradient(colors: [.white, .mint, .indigo, .mint, .indigo, .mint, .indigo]), center: .center, startRadius: 50, endRadius: 400))
    }
}
PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
