//
//  GalleryView.swift
//  Africa
//
//  Created by Noel Velasco on 3/1/22.
//

import SwiftUI

struct GalleryView: View {
    //MARK: Properties

  @State private var selectedAnimal: String = "lion"

  let animals: [Animal] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)

//  let gridlayout: [GridItem] = [
//    GridItem(.flexible()),
//    GridItem(.flexible()),
//    GridItem(.flexible())
//  ]

//  let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)

  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Double = 3.0

  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
  }

    //MARK: Body
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      //MARK: Grid
      VStack(alignment: .center, spacing: 30) {
        //MARK: Image

        Image(selectedAnimal)
          .resizable()
          .scaledToFit()
          .clipShape(Circle())
          .overlay(Circle().stroke(Color.white, lineWidth: 8))

        Slider(value: $gridColumn, in: 2...4, step: 1)
          .padding()
          .onChange(of: gridColumn, perform: { value in
            gridSwitch()
          })

        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
          ForEach(animals) { item in
            Image(item.image)
              .resizable()
              .scaledToFit()
              .clipShape(Circle())
              .overlay(Circle().stroke(Color.white, lineWidth: 1))
              .onTapGesture {
                selectedAnimal = item.image
                haptics.impactOccurred()
              }
          }//: Loop
        }//: Grid
        .animation(.easeIn)
        .onAppear(perform: {
          gridSwitch()
        })
      }//: Vstack
      .padding(.horizontal, 10)
      .padding(.vertical, 50)
    }//: Scroll
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(MotionAnimationView())
  }
}

  //MARK: Preview

struct GalleryView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView()
  }
}
