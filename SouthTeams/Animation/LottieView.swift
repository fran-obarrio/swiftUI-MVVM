//
//  LottieView.swift
//  SouthTeams
//
//  Created by Francisco Obarrio on 24/02/2023.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let animationName:String
    
    @Binding var play: Bool
    var animationView:LottieAnimationView
    
    init(animationName:String,
         play: Binding<Bool> = .constant(true)
    ) {
        self.animationName = animationName
        self.animationView = LottieAnimationView(name: animationName)
        self._play = play
    }
    class Coordinator: NSObject {
        @Binding var play: Bool
        let parent: LottieView
        init(parent: LottieView, play: Binding<Bool>) {
            self.parent = parent
            _play = play
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self, play: $play)
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if play {
            animationView.play { _ in
                play.toggle()
            }
        }
    }
}
