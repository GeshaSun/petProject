//
//  DataController.swift
//  petProject
//
//  Created by Михаил Евсеев on 24.04.2023.
//

import Foundation
import CoreData

class DataConroller: ObservableObject{
    let container = NSPersistentContainer(name: "DebtModel")
    static let shared = DataConroller()

    init(){
        container.loadPersistentStores {desc, error in
            if let error = error{print("Ошибка была маловероятно, но не невозможно - мы выпечатаем сообщение в журнал отладки Xcode \(error.localizedDescription)")}
        }
    }
    
    func save (context: NSManagedObjectContext){
        do{
            try context.save()
            print("Date saved!!")
        }catch{print("Upps sorry")}
    }
    
    func addNewDebt(name: String, valueDebt: Double, context: NSManagedObjectContext){
        let debt = Debt(context: context)
        debt.name = name
        debt.uuid = UUID()
        debt.valueDebt = valueDebt
        
        save(context: context)
    }
    
    func addNewCollect(name: String, valueDebt: Double, context: NSManagedObjectContext){
        let data = Collect(context: context)
        data.name = name
        data.uuid = UUID()
        data.valueCollect = valueDebt
        
        save(context: context)
    }
    
}
