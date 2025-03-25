//
//  Model.swift
//  CricketDafa
//
//  Created by D K on 25.03.2025.
//

import Foundation


class TrainingStep: Identifiable {
    var id = UUID()
    var stepNumber: Int
    var description: String
    
    init(stepNumber: Int, description: String) {
        self.stepNumber = stepNumber
        self.description = description
    }
}

class Training: Identifiable {
    var id = UUID()
    var title: String
    var shortDescription: String
    var longDescription: String
    var image: String
    var steps: [TrainingStep]?
    
    init(id: UUID = UUID(), title: String, shortDescription: String, longDescription: String, image: String, steps: [TrainingStep]? = nil) {
        self.id = id
        self.title = title
        self.shortDescription = shortDescription
        self.longDescription = longDescription
        self.image = image
        self.steps = steps
    }
}


class History: Identifiable {
    var id = UUID()
    var title: String
    var about: String
    var image: String
    
    init(id: UUID = UUID(), title: String, about: String, image: String) {
        self.id = id
        self.title = title
        self.about = about
        self.image = image
    }
}
