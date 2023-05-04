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
    @FetchRequest(sortDescriptors: []) var collect: FetchedResults<Collect>
    
    var body: some View {
        NavigationView{
            VStack {
                LatePaymentsButton()
                AddNewPaymentButton()
                DebtSumButton()
                CollectSumButton()
            }.navigationTitle("Главная")
        }
    }
    
    func deleteCellCollect(offset: IndexSet){
//        print("deletCollect - "+"\(offset)")
        withAnimation{
            offset.map{collect[$0]}.forEach(managedObjectContext.delete(_:))
            DataConroller.shared.save(context: managedObjectContext)
        }
        
    }
    
    func deleteCellDebt(offset: IndexSet){
//        print("deletDebt - "+"\(offset)")
        withAnimation{
            offset.map{debt[$0]}.forEach(managedObjectContext.delete(_:))
            DataConroller.shared.save(context: managedObjectContext)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
