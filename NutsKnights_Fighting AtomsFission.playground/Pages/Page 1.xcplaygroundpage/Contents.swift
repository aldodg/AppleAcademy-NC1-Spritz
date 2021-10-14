import UIKit
import SwiftUI
import PlaygroundSupport
import AVFoundation
import Darwin

var player_1: AVAudioPlayer?

public func playSound_1() {
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
   
    
    var body : some View{
        ZStack{
        }
        .frame(width:400, height:600)
        .background(Image(uiImage:
                            #imageLiteral(resourceName: "locandina")))
        
        .onAppear(perform: playSound_1)
    }
    
    
}
PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
