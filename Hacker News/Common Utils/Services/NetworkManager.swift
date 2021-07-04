//
//  MetworkManager.swift
//  Hacker News
//
//  Created by Sergei Romanchuk on 02.07.2021.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts: Array<PostModel> = [PostModel]()
    
    func request() {
        if let url = URL(string: K.API.generalURL.rawValue) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results =  try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits!
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
}
