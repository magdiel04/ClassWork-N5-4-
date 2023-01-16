//
//  NetworkManager.swift
//  ClassWork N5 (4)
//
//  Created by Magdiel Altynbekov on 16/1/23.
//

import Foundation

class NetworkLayer {
    
    func getJoke(completion: @escaping (Joke) -> Void ) {
            let url = URL(string: "https://official-joke-api.appspot.com/random_joke")
            let request = URLRequest(url: url!)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    
                    guard let data = data else {
                        print("no data")
                        return
                    }
                    
                    if let response = response as? HTTPURLResponse {
                        print(response.statusCode)
                    }
                    
                    guard error == nil else {
                        print(error!.localizedDescription)
                        return
                    }
                    
                    
                    do {
                        let joke = try JSONDecoder().decode(Joke.self, from: data)
                        completion(joke)
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    
//                    guard let data = data, let response = try? JSONDecoder().decode(Joke.self, from: data) else {
//                        completion(Joke(setup: "default", punchline: "default"))
//                        return
//                    }
//                    completion(response)
                }
            }
            task.resume()
        }
}
