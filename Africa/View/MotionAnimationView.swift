//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Noel Velasco on 3/2/22.
//

import SwiftUI

struct MotionAnimationView: View {
  //MARK: Properties
  @State private var randomCircle = Int.random(in: 12...16)
  @State private var animation = false

  //MARK: Functions

  // Random Coordinate
  func randomCoordinate(max: CGFloat) -> CGFloat {
    return CGFloat.random(in: 0...max)
  }

  // Random Size
  func randomSize() -> CGFloat {
    return CGFloat(Int.random(in: 10...300))
  }

  // Random Scale
  func randomScale() -> CGFloat {
    return CGFloat(Double.random(in: 0.1...2.0))
  }

  // Random Speed
  func randomSpeed() -> Double {
    return Double.random(in: 0.025...1.0)
  }

  // Random Delay
  func randomDelay() -> Double {
    return Double.random(in: 0...2)
  }

  //MARK: Body
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        ForEach(0...randomCircle, id: \.self) { item in
          Circle()
            .foregroundColor(.gray)
            .opacity(0.15)
            .frame(width: randomSize(), height: randomSize(), alignment: .center)
            .scaleEffect(animation ? randomScale() : 1)
            .position(x: randomCoordinate(max: geometry.size.width), y: randomCoordinate(max: geometry.size.height))
            .animation(
              Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                .repeatForever()
                .speed(randomSpeed())
                .delay(randomDelay())
            )
            .onAppear(perform: {
              animation = true
            })
        }
      }//: ZStack
      .drawingGroup()
    }//: Geometry
  }
}

struct MotionAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    MotionAnimationView()
  }
}
