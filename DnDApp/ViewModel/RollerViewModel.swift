//
//  RollerViewModel.swift
//  DnDApp
//
//  Created by Max Magill on 13/11/2020.
//

import Foundation

class RollerViewModel: ObservableObject{
    
    @Published var sides = 2
    
    func setSides(numOfSides: Int){
        sides = numOfSides
    }
    
}
