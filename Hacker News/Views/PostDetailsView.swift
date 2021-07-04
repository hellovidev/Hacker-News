//
//  PostDetailsView.swift
//  Hacker News
//
//  Created by Sergei Romanchuk on 02.07.2021.
//

import SwiftUI
import WebKit

// MARK: - Post Details View
struct PostDetailsView: View {
    var url: String
    
    var body: some View {
        WebView(url: url)
    }
}

// MARK: - Preview
struct PostDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailsView(url: "https://example.com")
    }
}

// MARK: - WebView
struct WebView: UIViewRepresentable {
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: self.url) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}
