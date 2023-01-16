//
//  JokeController.swift
//  ClassWork N5 (4)
//
//  Created by Magdiel Altynbekov on 5/1/23.
//

import Foundation

class JokeController {
    
    private var model: JokeModel!
    
    private var view: ViewController?
    
    init(view: ViewController) {
        self.view = view
        self.model = JokeModel(controller: self)
    }
    
    
    func getJoke() -> Joke {
        let joke = model.getJoke()
        print(joke.setup)
        print(joke.punchline)
        return joke
    }
    
}
