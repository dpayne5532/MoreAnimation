//
//  ContentView.swift
//  MoreAnimations
//
//  Created by Dan Payne on 1/19/22.
//

import SwiftUI



struct TitleText: View {
    var title = ""
    var body: some View {
        Text(title)
            .font(.largeTitle)
    }
    init(_ title: String) {
        self.title = title
    }
}


struct SubtitleText: View {
    var subtitle = ""
    var body: some View {
        Text(subtitle)
            .font(.title)
            .foregroundColor(.gray)
    }
    init(_ subtitle: String) {
        self.subtitle = subtitle
    }
}

struct BannerText: View {
    var text: String
    var backColor: Color
    var textColor: Color
    
    var body: some View {
        Text(text)
            .font(.title)
            .frame(maxWidth: .infinity)
            .padding()
            .background(backColor)
            .foregroundColor(textColor)
        
        
        
    }
    
    init(_ text: String, backColor: Color = Color.blue, textColor: Color = Color.primary) {
        self.text = text
        self.backColor = backColor
        self.textColor = textColor
    }
    
    
}





struct ContentView: View {
    @State private var change = false
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Example")
            SubtitleText("Parts of Animation")
            BannerText("There is just one thing missing. We want to tell SwiftUI to animate the change in the Y postiion of the circle")
       
    Text("With Animation")
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.blue)
                .hueRotation(Angle.degrees(change ? 170 : 0))
                .padding()
                
        
            
            Text("Without Animation")
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(change ? .orange : .blue)
                        .padding()
            
            Button("Change") {
                withAnimation(.easeInOut) {
                    self.change.toggle()
                }
            }.font(.title)
                       
        }
            
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
