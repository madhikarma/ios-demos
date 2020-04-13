//
//  CoreDataCenter.swift
//  CoreDataDemo
//
//  Created by Shagun Madhikarmi on 10/05/2018.
//  Copyright © 2018 ustwo. All rights reserved.
//

import CoreData
import Foundation

// TODO: (SM) mocking via Protocol?
// TODO: (SM) add generic create, fetch amd save methods to encapsulate

class CoreDataController {
    private var mainContext: NSManagedObjectContext!
    private var backgroundContext: NSManagedObjectContext!

    // MARK: - Init

    init(completion: @escaping (Bool, Error?) -> Void) {
        let persistentStoreCoordinator = createPersistentStoreCoordinator()
        setupContexts(persistentStoreCoordinator)
        setupPersistentStore(persistentStoreCoordinator, completion: completion)
        setupNotifcationObservers()
    }

    deinit {
        removeNotitificationObservers()
    }

    // MARK: - Setup

    private func createPersistentStoreCoordinator() -> NSPersistentStoreCoordinator {
        // This resource is the same name as your xcdatamodeld contained in your project
        guard let modelURL = Bundle.main.url(forResource: "CoreDataDemo", withExtension: "momd") else {
            fatalError("Error loading model from bundle")
        }

        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }

        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        return persistentStoreCoordinator
    }

    private func setupContexts(_ persistentStoreCoordinator: NSPersistentStoreCoordinator) {
        mainContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        mainContext.persistentStoreCoordinator = persistentStoreCoordinator

        backgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        backgroundContext.persistentStoreCoordinator = persistentStoreCoordinator
    }

    private func setupPersistentStore(_ persistentStoreCoordinator: NSPersistentStoreCoordinator, completion: @escaping (Bool, Error?) -> Void) {
        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
        queue.async {
            guard let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
                fatalError("Unable to resolve document directory")
            }

            let storeURL = documentsDirectoryURL.appendingPathComponent("CoreDataDemo.sqlite")

            do {
                // TODO: options for migrations?
                try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)

                DispatchQueue.main.sync {
                    completion(true, nil)
                }
            } catch {
                DispatchQueue.main.sync {
                    completion(false, error)
                }
                assertionFailure("Error: migrating store: \(error)")
            }
        }
    }

    // MARK: - CRUD

    func createObject<T>(name: String) -> T {
        return createObject(name: name, in: backgroundContext)
    }

    func getObjects<T: NSFetchRequestResult>(name: String) -> [T] {
        return getObjects(name: name, in: mainContext)
    }

    func save() {
        save(context: backgroundContext)
    }

    func deleteObject<T: NSManagedObject>(object: T) {
        let backgroundObject = backgroundContext.object(with: object.objectID)
        backgroundContext.delete(backgroundObject)
        save()
    }

    // MARK: - Private

    private func createObject<T>(name: String, in context: NSManagedObjectContext) -> T {
        let object = NSEntityDescription.insertNewObject(forEntityName: name, into: context) as! T
        save(context: context)
        return object
    }

    private func getObjects<T: NSFetchRequestResult>(name: String, in context: NSManagedObjectContext) -> [T] {
        let fetchRequest = NSFetchRequest<T>(entityName: name)

        var objects: [T] = []
        do {
            objects = try context.fetch(fetchRequest)
        } catch {
            print("Error: error fetching: \(error)")
        }
        return objects
    }

    private func save(context: NSManagedObjectContext) {
        guard context.hasChanges else {
            print("Warning: you've tried to save a context that has no changes")
            return
        }

        do {
            try context.save()
            print("Info: Success saving")
        } catch {
            print("Error: error saving: \(error)")
        }
    }

    private func mergeChanges(for context: NSManagedObjectContext, from notification: Notification) {
        context.perform {
            context.mergeChanges(fromContextDidSave: notification)
        }
    }

    // MARK: - Notifications

    private func setupNotifcationObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(CoreDataController.handleContextDidSave(notification:)), name: NSNotification.Name.NSManagedObjectContextDidSave, object: nil)
    }

    private func removeNotitificationObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self, name: NSNotification.Name.NSManagedObjectContextDidSave, object: nil)
    }

    @objc func handleContextDidSave(notification: Notification) {
        guard let sender = notification.object as? NSManagedObjectContext else {
            assertionFailure("Error: notification occured but no managed object context found")
            return
        }

        switch sender {
        case mainContext:
            mergeChanges(for: backgroundContext, from: notification)
        case backgroundContext:
            mergeChanges(for: mainContext, from: notification)
        default:
            assertionFailure("Error: unexpected context triggered did save notification")
        }
    }

    // TODO: try using new iOS 10 NSPersistentContainer stack code below (instead of creating our own managed object contexts above)

    // MARK: - Core Data stack

    //
    //    lazy var persistentContainer: NSPersistentContainer = {
    //        /*
    //         The persistent container for the application. This implementation
    //         creates and returns a container, having loaded the store for the
    //         application to it. This property is optional since there are legitimate
    //         error conditions that could cause the creation of the store to fail.
    //        */
    //        let container = NSPersistentContainer(name: "CoreDataDemo")
    //        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
    //            if let error = error as NSError? {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //
    //                /*
    //                 Typical reasons for an error here include:
    //                 * The parent directory does not exist, cannot be created, or disallows writing.
    //                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
    //                 * The device is out of space.
    //                 * The store could not be migrated to the current model version.
    //                 Check the error message to determine what the actual problem was.
    //                 */
    //                fatalError("Unresolved error \(error), \(error.userInfo)")
    //            }
    //        })
    //        return container
    //    }()
    //
    //    // MARK: - Core Data Saving support
    //
    //    func saveContext () {
    //        let context = persistentContainer.viewContext
    //        if context.hasChanges {
    //            do {
    //                try context.save()
    //            } catch {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //                let nserror = error as NSError
    //                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    //            }
    //        }
    //    }
    //
}
