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
        
        NavigationView{
            Form{
                Section(){
                    VStack{
                        HStack{
                            SumLable()
                            Spacer()
                        }//HS
                        HStack{
                            Text("Введите сумму и валюту")
                                .foregroundColor(.gray)
                            Spacer()
                        }//HS
                        TextField("Например 500₽", text: TypePaymentPicker().$value).frame(minHeight: Double((UIScreen.main.bounds.width)/10))
                    }//VS
                    VStack{
                        TypePaymentPicker()
                        
                    }//VS
                }//Section
                
            }//Form
        }//NavView
    }//View
}//AddNewPayment

struct AddNewPayment_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPayment()
    }
}
