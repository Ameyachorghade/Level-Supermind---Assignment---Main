//
//  paginationDataSet.swift
//  Level Supermind - Assignment
//
//  Created by Ameya Chorghade on 24/04/24.
//

import Foundation
import UIKit

struct DataSet {
    let image: UIImage?
    let heading: String?
    let subheading1: String?
    let subheading2: String?
}

class DataManager {
    static let shared = DataManager()
    
    var dataSetArray: [DataSet] = []
    
    private init() {
        // Initialize your data sets here
        dataSetArray = [
            DataSet(image: UIImage(named: "image1")!,
                    heading: "Music Spiritual Mantras",
                    subheading1: "Om Chanting",
                    subheading2: "30 min-10XP"),
            DataSet(image: UIImage(named: "image1")!,
                    heading: "Heading 2",
                    subheading1: "Subheading 2-1",
                    subheading2: "Subheading 2-2"),
            DataSet(image: UIImage(named: "image1")!,
                    heading: "Heading 3",
                    subheading1: "Subheading 3-1",
                    subheading2: "Subheading 3-2")
        ]
    }
}

