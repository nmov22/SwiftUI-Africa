//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Noel Velasco on 3/1/22.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK: Properties
  let animal: Animal

    //MARK: Body
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {
        // Hero Image
        Image(animal.image)
          .resizable()
          .scaledToFit()

        //Title
        Text(animal.name.uppercased())
          .font(.largeTitle)
          .fontWeight(.heavy)
          .multilineTextAlignment(.center)
          .padding(.vertical, 8)
          .foregroundColor(.primary)
          .background(
            Color.accentColor
              .frame(height: 6)
              .offset(y: 24)
          )

        //Headline
        Text(animal.headline)
          .font(.headline)
          .multilineTextAlignment(.leading)
          .foregroundColor(.accentColor)
          .padding(.horizontal)

        //Gallery
        Group {
          HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
        }
        .padding(.horizontal)

        InsetGalleryView(animal: animal)

        //Facts
        Group {
          HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")

          InsetFactView(animal: animal)
        }
        .padding(.horizontal)

        //Description
        Group {
          HeadingView(headingImage: "info.circle", headingText: "All abount \(animal.name)")

          Text(animal.description)
            .multilineTextAlignment(.leading)
            .layoutPriority(1)
        }
        .padding(.horizontal)

        //Map
        Group {
          HeadingView(headingImage: "map", headingText: "National Parks")

          InsetMapView()
        }
        .padding(.horizontal)

        //Link
        Group {
          HeadingView(headingImage: "books.vertical", headingText: "Learn More")
        }
        .padding(.horizontal)

        ExternalWebLinkView(animal: animal)
      }// VStack
      .navigationBarTitle("Learn About \(animal.name)", displayMode: .inline)
    }// Scroll
  }
}

struct AnimalDetailView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")

  static var previews: some View {
    NavigationView {
      AnimalDetailView(animal: animals[0])
    }
    .previewDevice("iPhone 11 Pro")
  }
}
