//
//  ContentView.swift
//  Hacker News
//
//  Created by Sergei Romanchuk on 02.07.2021.
//

import SwiftUI

// MARK: - News List
struct NewsFeedView: View {
    @ObservedObject private var networkManager: NetworkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: PostDetailsView(url: post.url ?? "")) {
                    PostView(post: post)
                }
            }
            .navigationTitle("Hacker News")
        }
        .onAppear {
            self.networkManager.request()
        }
    }
}

// MARK: - News Item
struct PostView: View {
    let post: PostModel
    
    var body: some View {
        HStack {
            Text("\(self.post.points ?? -1)")
            Text("\(self.post.title ?? "Empty")")
        }
    }
}



// MARK: - Preview
struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}
