//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Sebastien REMY on 17/10/2022.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct Watermark: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    func watermaked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!").modifier(Title())
            Text("Hello Seb")
                .titleStyle()
                .watermaked(with: "Nice day")
            Spacer()
            Color.blue
                .frame(width: 300, height: 200)
                .watermaked(with: "Hacking with swift")
        }
        .onAppear {
            print(type(of: self.body))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
