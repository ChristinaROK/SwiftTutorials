//
//  VideoListView.swift
//  List-Starter
//
//  Created by ssj on 2021/06/03.
//

import SwiftUI

struct VideoListView: View {
    
    var videos: [Video] = VideoList.topTen
    
    var body: some View {
        NavigationView {
            List(videos, id: \.id) { video in
                Image(video.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(4)
                    .padding(.vertical, 4)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(video.title)
                        .fontWeight(.semibold)
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .minimumScaleFactor(0.5)
                    
                    Text(video.uploadDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Sean's Top 10") // modifier 위치 유의
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}

