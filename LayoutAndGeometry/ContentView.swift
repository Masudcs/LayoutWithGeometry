//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Md. Masud Rana on 3/12/23.
//

import SwiftUI

struct OuterView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
                   HStack(spacing: 0) {
                       ForEach(1..<20) { num in
                           GeometryReader { geo in
                               Text("Number \(num)")
                                   .font(.largeTitle)
                                   .padding()
                                   .background(.red)
                                   .rotation3DEffect(.degrees(-geo.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
                                   .frame(width: 200, height: 200)
                           }
                           .frame(width: 200, height: 200)
                       }
                   }
               }
    }
}

struct InnerView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0 ..< 50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    OuterView()
                } label: {
                    Text("Using Geo with scroll")
                }
                
                NavigationLink {
                    InnerView()
                } label: {
                    Text("Using GeometryReader")
                }
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
