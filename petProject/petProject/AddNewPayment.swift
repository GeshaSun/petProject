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
    private let  lablePiker = ["Дам в долг", "Возьму в долг"]
    let orange2 = Color(red: 232/255, green: 72/255, blue: 82/255)
    
    @State var value = ""
    @State private var selectedType = 0
    
    var body: some View {
        
        NavigationView{
            Form{
                Section(){
                    VStack{
                        HStack{
                            Text("СУММА")
                                .font(.largeTitle)
                                .bold()
                                .font(.title)
                                .frame(alignment: .leading)
                            Spacer()
                        }
                        HStack{
                            Text("Введите сумму и валюту")
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        TextField("Например 500₽", text: $value).frame(minHeight: Double((UIScreen.main.bounds.width)/10))
                        
                    }
                    VStack{
                    Picker(selection: $selectedType,label: Text("Вы одолжили кому-то денег"))
                        {
                            ForEach(0..<lablePiker.count){
                                Text(lablePiker[$0])
                            }
                        }.pickerStyle(.segmented)
                            .colorMultiply(orange2)
                            .padding()
                            .scaleEffect(CGSize(width: 1.2, height: 1.4))
//                            .scaleEffect()
                            
//                            .frame(height: Double((UIScreen.main.bounds.width)/1))
                        if(selectedType==0){
                            Text("Вы одолжили кому-то денег")
                                .foregroundColor(.gray)
                        }else{
                            Text("Вы взяли у кого-то денеги")
                                .foregroundColor(.gray)
                        }

                    }
                                
                }
                
            }
//            .navigationTitle("Новая запись")
//                .navigationBarTitleDisplayMode(.large)
        }
        
    }
    
    
}

struct AddNewPayment_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPayment()
    }
}
