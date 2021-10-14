//: [Previous](@previous)
import UIKit
import SwiftUI
import PlaygroundSupport
import AVFoundation
import Darwin

var player_1: AVAudioPlayer?
var player_2: AVAudioPlayer?

public func playSound_1() {
    guard let path = Bundle.main.path(forResource: "4", ofType:"mp3") else {
        return }
    let url = URL(fileURLWithPath: path)
    
    do {
        player_1 = try AVAudioPlayer(contentsOf: url)
        player_1?.play()
        
    } catch let error {
        print(error.localizedDescription)
    }
}

public func playSound_2() {
    guard let path = Bundle.main.path(forResource: "5espl", ofType:"mp3") else {
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
    @State var distance: CGFloat = 0
    @State var scale: CGFloat = 1
    @State var villain="jack"
    @State var opacity: CGFloat = 1
    @State var dur: CGFloat = 1
    @State var player : AVAudioPlayer?
    
    var body : some View{
        ZStack{
            VStack{
                Text("SOMETIMES THINGS CAN GET OUT OF HAND").font(Font.custom("ChalkboardSE-Regular", size: 15))
                    .foregroundColor(.black)
                    .font(.caption)
                    .frame(width: 360, height: 30)
                    .background(Color.yellow)
                    .cornerRadius(5)
            }
            .position(x:200, y:20)
            VStack{
                Image(uiImage:
                        #imageLiteral(resourceName: img))
                    .opacity(opacity)
                //                    .frame(width:400, height:600)
                
                
            }
            VStack{
                Button(action: {
                    if  (Int(img) ?? 0) <= 3 && (Int(img) ?? 0) >= 0 {
                        img = String((Int(img) ?? 0) + 1)
                        
                    }
                    else if (Int(img) ?? 0) == 4 {
                        distance = 0.9
                        scale = 0.5
                        img = String((Int(img) ?? 0) + 1)
                        villain = "jack1"
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
                            timer in villain = "explosion"
                            opacity=0
                            dur=0
                            distance = 1
                            scale=1
                            playSound_2()
                        }
                    }
                    else if (Int(img) ?? 0) == 5 {
                    }
                    
                    //                    else if (Int(img) ?? 0) == 6 {
                    //                        villain="explosion"
                    //                        distance=0.9
                    //                    }
                }) {
                    Image(uiImage:
                            #imageLiteral(resourceName: villain))
                    //                        .frame(width:400, height:600)
                        .position(x: 200, y: 900)
                        .offset(y:(-distance*800))
                        .scaleEffect(scale*0.4)
//                        .offset(y:(-distance*200))
                    .animation(.linear(duration: dur), value: distance)}
            }
            
            
        }
        .frame(width:400, height:600)
        //        .background(Color.cyan)
        .background(RadialGradient(gradient: Gradient(colors: [.white, .yellow, .orange, .red]), center: .center, startRadius: 50, endRadius: 400))
        .onAppear(perform: playSound_1)
        //        .background(RadialGradient(gradient: Gradient(colors: [.white, .mint, .indigo, .mint, .indigo, .mint, .indigo]), center: .center, startRadius: 50, endRadius: 400))
    }
    
    
}
PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
