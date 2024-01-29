//
//  ContentView.swift
//  _CalumpongKristinaHW2
//
//  Created by Kristina Calumpong on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            
        VStack {
            Spacer()
            
            Image("profile-pic")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250.0, height: 250.0)
            
            Text("Kristina Calumpong")
                .font(.title)
                .foregroundStyle(.white)
            
            Text("In the heart of a tranquil island, within the walls of my secluded palace, I am Kristina —a harmonious fusion of girl and hamster. My brown hair, cascading in soft waves, complements the endearing hamster features that define my unique charm. Standing at 5'4, my brown eyes reflect the warmth of the island sunrise, and my smile, like the first light of day, exudes an infectious joy. I thrive as a living testament to the enchanting wonders that unfold in the most secluded corners of the world.")
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .font(.body)
                .foregroundStyle(.white)
            
            Spacer()
               
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color.black)
        
    }
}

#Preview {
    ContentView()
}
