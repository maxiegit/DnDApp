//
//  DatabaseCategory.swift
//  DnDApp
//
//  Created by Max Magill on 05/11/2020.
//

import SwiftUI

struct DatabaseCategory: View {
    
    var body: some View {
        List(0..<5){ item in
            Text("spell")
        }
    }
    
    struct DatabaseCategory_Previews: PreviewProvider {
        static var previews: some View {
            DatabaseCategory()
        }
    }
}
