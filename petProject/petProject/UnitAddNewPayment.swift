//
//  UnitAddNewPayment.swift
//  petProject
//
//  Created by Михаил Евсеев on 05.05.2023.
//

import SwiftUI

struct UnitAddNewPayment: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct UnitAddNewPayment_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            SumLable()
            TypePaymentPicker()
        }
    }
}

struct SumLable: View {
    var body: some View{
        Text("СУММА")
            .font(.largeTitle)
            .bold()
            .font(.title)
            .frame(alignment: .leading)
    }
}

struct TypePaymentPicker: View{
    private let  lablePiker = ["Дам в долг", "Возьму в долг"]
//    let orange2 = Color(red: 232/255, green: 72/255, blue: 82/255)
    
    @State var value = ""
    @State private var selectedType = 0
    
    var body: some View{
        Picker(selection: $selectedType,label: Text("Вы одолжили кому-то денег"))
            {
                ForEach(0..<lablePiker.count){
                    Text(lablePiker[$0])
                }
            }.pickerStyle(.segmented)
            .colorMultiply(ColorAddNewPaymet().pickerColor)
                .padding()
                .scaleEffect(CGSize(width: 1.2, height: 1.4))
            if(selectedType==0){
                Text("Вы одолжили кому-то денег")
                    .foregroundColor(.gray)
            }else{
                Text("Вы взяли у кого-то денеги")
                    .foregroundColor(.gray)
            }
    }
}
