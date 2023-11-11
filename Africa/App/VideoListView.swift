//
//  VideoListView.swift
//  Africa
//
//  Created by Noel Velasco on 3/1/22.
//

import SwiftUI

struct VideoListView: View {

  //MARK: Properties
  @State var videos: [Video] = Bundle.main.decode("videos.json")

  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

  //MARK: Body
  var body: some View {
    NavigationView {
      List {
        ForEach(videos) { item in
          NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
            VideoListItemView(video: item)
              .padding(.vertical, 8)
          }
        }//: Loop
      }//: List
      .listStyle(InsetGroupedListStyle())
      .navigationBarTitle("Videos", displayMode: .inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {
            // Shuffle Videos
            videos.shuffle()
            hapticImpact.impactOccurred()
          }) {
            Image(systemName: "arrow.2.squarepath")
          }
        }
      }
    }//: Navigation
  }
}

//MARK: Preview
struct VideoListView_Previews: PreviewProvider {
  static var previews: some View {
    VideoListView()
  }
}
