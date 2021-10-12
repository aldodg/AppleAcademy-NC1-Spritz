//: A UIKit based Playground for presenting user interface

//: [Previous](@previous)
import PlaygroundSupport
import SwiftUI
import Foundation

struct ContentView : View {
    @State var scale_image = 0.3
    @State var showDetails  = false
    @State var bgColor = Color.green
    @State var cr:CGFloat = 12
    
    var body : some View{
        NavigationView{
            ZStack{
                VStack{
                    Text("Fighting Atoms' fission")
                        .padding()
                        .foregroundColor(.red)
                        .position(x: 200, y: 50)
                        .font(.largeTitle)
                    
                    Image(uiImage: #imageLiteral(resourceName: "07.png"))
                        .scaleEffect(scale_image)
                        .position(x: 200, y: 300)
                    Button(action: {
                        //Qui andrà il codice per switchare tra
                        // le varie VIEW
                        
                    }) {
                        Text("Tap Anywhere")
                            .foregroundColor(.blue)
                            .position(x: 200, y: 500)
                            .font(.subheadline)
                            .frame(width: 400, height: 600, alignment: .bottom)
                        //                        .animation(.basic(duration: 2, curve: .easeInOUt))
                    }
                    
                    .foregroundColor(.clear)
                }
            }
            .frame(width: 400, height: 600)
        }
    }
}

struct ContentView_2 : View{
    var body: some View{
        NavigationView{
            
        }
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
