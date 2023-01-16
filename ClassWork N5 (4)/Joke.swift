//
//  Joke.swift
//  ClassWork N5 (4)
//
//  Created by Magdiel Altynbekov on 5/1/23.
//

import Foundation

struct Joke: Codable {
    var setup: String
    var punchline: String
}

class JokeModel {
    
    private var controller: JokeController?
    
    private let networkLayer = NetworkLayer()
    
    private var joke: Joke?
    
    init(controller: JokeController) {
        self.controller = controller
    }
    
    func getJoke() -> Joke {
        networkLayer.getJoke { fetchedJoke in
            self.joke = fetchedJoke
        }
        
        return joke ?? Joke(setup: "default", punchline: "default")
        
    }
}
