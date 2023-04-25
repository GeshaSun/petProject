//
//  ContentView.swift
//  petProject
//
//  Created by Михаил Евсеев on 24.04.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var debt: FetchedResults<Debt>
    
    var body: some View {
        NavigationView{
            VStack {
                LatePaymentsButton()
                AddNewPaymentButton()
                DebtSumButton()
                CollectSumButton()
                List{
                    ForEach(debt) {debt in HStack{
                        Text(debt.name!)
                        Text(String(debt.valueDebt))
                        Text("\(debt.uuid!)")
                    }
                    }.onDelete(perform: deleteCell)
                }
            }.navigationTitle("Главная")
        }
    }
    
    func deleteCell(offset: IndexSet){
        withAnimation{
            offset.map{debt[$0]}.forEach(managedObjectContext.delete(_:))
            DataConroller.shared.save(context: managedObjectContext)
        }
        
    }
}

struct SumButtonStyle: ButtonStyle {
    let orange2 = Color(red: 226/255, green: 135/255, blue: 67/255)
    
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [.pink, orange2]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .cornerRadius(16))
                .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
                .scaleEffect(configuration.isPressed ? 0.95 : 1)
        }
    }

struct AddNewPaymentButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3)
            .bold()
            .padding()
            .background(Color(.systemGray6))
            .foregroundColor(.pink)
//            .buttonBorderShape(.capsule)
            .cornerRadius(20)
            .frame(maxWidth: .infinity)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)

    }
}

struct CollectSumButton: View {
    var body: some View {
        Button(action: {print("Перейти к займам")}){
        Label: do {
                VStack(){
                    Text("Collect summ ")
                    Text("12342").foregroundColor(.white).font(.title)
                    + Text(" руб")
                    Text("до 14.12.23").font(.subheadline)
                }.frame(maxWidth: .infinity, alignment: .center)
            }
        }.buttonStyle(SumButtonStyle())
            .padding(.horizontal, 20)
    }
}

struct DebtSumButton: View {
//    @Environment(\.managedObjectContext) var managedObjectContext

//    @FetchRequest(sortDescriptors: [] )  var debt: FetchedResults<Debt>
//    guard let debt = debt else {print("dont unwarp")}
    
    
    var body: some View {
        Button(action: {print("перейти к долгам")}){
            
            Label: do {
                VStack(){
                    Text("Debt summ = ")
                    Text("120").foregroundColor(.white).font(.title)
                    + Text(" руб")
                    Text("до 14.12.23").font(.subheadline)
                }.frame(maxWidth: .infinity, alignment: .center)
            }
        }.buttonStyle(SumButtonStyle()).padding(.horizontal, 20)
    }
}

struct AddNewPaymentButton: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View{
        Button(action: {
            print("Новый платеж")
            DataConroller.shared.addNewDebt(name: "MARK", valueDebt: 1000, context: managedObjectContext)
        }){
            Label("Новая запись", systemImage: "plus").frame(maxWidth: .infinity)
        }.buttonStyle(AddNewPaymentButtonStyle())
            .padding(.horizontal, 25)
            .padding()
    }
}

struct LatePaymentsButton: View {
    var body: some View{
        Button(action: {print("Все платежи")}) {
            HStack{
                Text("2")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
                    .padding()
                    .overlay(
                        Circle()
                            .stroke(Color.orange, lineWidth: 3.5)
                            .padding(1))
                VStack(alignment: .leading){
                    Text("Есть пропущенные платежи")
                        .bold()
                        .foregroundColor(.pink)
                    Text("Показать")
                        .bold()
                }
            }//HStack
            .padding()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
