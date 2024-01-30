//
//  Extensions.swift
//  NetflixClone
//
//  Created by Indrek Mäeots on 30.01.2024.
//

import Foundation

extension String {
    
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
