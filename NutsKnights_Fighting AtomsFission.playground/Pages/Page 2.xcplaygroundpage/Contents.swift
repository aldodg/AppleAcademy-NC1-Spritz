//: [Previous](@previous)
import UIKit
import SwiftUI
import PlaygroundSupport
import AVFoundation
import Darwin

var player_1: AVAudioPlayer?

public func playSound_1() {
    guard let path = Bundle.main.path(forResource: "2", ofType:"mp3") else {
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
    @State var angle=0.0
    @State var img = "page1_01"
    @State var img2 = "page1_02"
    var body : some View{
        ZStack{
            VStack{
                Text("ONCE UPON A TIME, THERE WAS A PEACEFUL COMMUNITY…").font(Font.custom("ChalkboardSE-Regular", size: 15))
                    .foregroundColor(.black)
                    .font(.caption)
                    .frame(width: 320, height: 60)
                    .background(Color.yellow)
                    .cornerRadius(5)
                
                Text("…OF URANIUM-235 NUCLEUS").font(Font.custom("ChalkboardSE-Regular", size: 15))
                    .foregroundColor(.black)
                    .font(.caption)
                    .frame(width: 320, height: 30)
                    .background(Color.yellow)
                    .cornerRadius(5)
            }
            .position(x:200, y:55)
            VStack{
                Image(uiImage:
                    #imageLiteral(resourceName: img))
                    .resizable()
                    .frame(width:400, height:600)
                    .rotationEffect(.degrees(angle))
                    .animation(.linear(duration: 1))

    
            }
            VStack{
                Image(uiImage:
                    #imageLiteral(resourceName: img2))
                    .resizable()
                    .frame(width:400, height:600)
                    .rotationEffect(.degrees(-angle/2+4.0))
                    .animation(.linear(duration: 1))

    
            }
            VStack{
                
                Button(action: {
                    let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//                    if  img == "page1_01" {
//                        img = "page1_02"}
//                    else {
//                        img = "page1_01"}}
                        if  angle == 0.0 {
                            angle = 5.0}
                        else {
                            angle = 0.0}}
                }) {
                    Text("Tap Anywhere to let the atoms shake!").font(Font.custom("ChalkboardSE-Regular", size: 15))
                .foregroundColor(.white)
                .font(.subheadline)
                .position(x: 200, y: 550)
                .frame(width:400, height:600, alignment:Alignment.center)
                //.background(bgcolor)
                //.cornerRadius(20)
                }
                
            }
            
        }
        .frame(width:400, height:600)
        .onAppear(perform: playSound_1)
        .background(RadialGradient(gradient: Gradient(colors: [.mint, .indigo, .mint, .indigo]), center: .center, startRadius: 50, endRadius: 400))
    }
}
PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
