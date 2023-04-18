//
//  FViewModel.swift
//  Wiederholsession
//
//  Created by Felix Bücher on 13.04.23.
//

import Foundation
import CoreData

class FViewModel: ObservableObject {
    
    let container = NSPersistentContainer(name: "Wiederholsession")
    
    @Published var articleList: [Artikel] = []
    @Published var shoppingList: [Artikel] = []
    
    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core data failed: \(error.localizedDescription)")
            }
        }
        fetchArticles()
        fetchShoppingList()
    }
    
    func fetchArticles() {
        let request = NSFetchRequest<Artikel>(entityName: "Artikel")
        do {
            articleList = try container.viewContext.fetch(request)
        } catch {
            print("Loading failed: \(error)")
        }
    }
    
    func fetchShoppingList() {
        let request = NSFetchRequest<Artikel>(entityName: "Artikel")
        request.predicate = NSPredicate(format: "inShoppingList == %@", NSNumber(value: true))
        do {
            shoppingList = try container.viewContext.fetch(request)
        } catch {
            print("Loading failed: \(error)")
        }
    }
    
    func addArticle(_ articleName: String) {
        let article = Artikel(context: container.viewContext)
        article.id = UUID()
        article.inShoppingList = false
        article.name = articleName
        article.note = ""
        do{
            try container.viewContext.save()
            fetchArticles()
            fetchShoppingList()
        }catch {
            print("Failed: \(error)")
        }
    }
    
    func saveNote(_ note: String, _ article: Artikel) {
        article.note = note
        do{
            try container.viewContext.save()
            fetchShoppingList()
            fetchArticles()
        }catch {
            print("Failed: \(error)")
        }
    }
    
    func addToShoppingList(_ article: Artikel) {
        article.inShoppingList = true
        do{
            try container.viewContext.save()
            fetchArticles()
            fetchShoppingList()
        }catch {
            print("Failed: \(error)")
        }
    }
    
    func removeFromShoppingList(_ article: Artikel) {
        article.inShoppingList = false
        do{
            try container.viewContext.save()
            fetchArticles()
            fetchShoppingList()
        }catch {
            print("Failed: \(error)")
        }
    }
    
    func clearShoppingList() {
        articleList.forEach { article in
            article.inShoppingList = false
        }
        do{
            try container.viewContext.save()
            fetchArticles()
            fetchShoppingList()
        }catch {
            print("Failed: \(error)")
        }
    }
}
