//
//  AddNewPayment.swift
//  petProject
//
//  Created by Михаил Евсеев on 24.04.2023.
//

import SwiftUI

struct AddNewPayment: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddNewPayment_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPayment()
    }
}
