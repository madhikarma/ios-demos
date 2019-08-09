//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Shagun Madhikarmi on 10/05/2018.
//  Copyright © 2018 ustwo. All rights reserved.
//

import UIKit
import CoreData

final class ViewController: UIViewController {

    private let recordCellIdentifier = "RecordCellIdentifier";

    // TODO: dependency injection for this object?
    private var dataController: CoreDataController!

    private var mainView: View {
        guard let view = self.view as? View else {
            assertionFailure("Error: expected view to be set to the correct type")
            return View()
        }
        return view;
    }

    // TODO: move away from VC e.g. into a datasource
    private var records: [Record] = []

    // TODO: move away from VC e.g. into a util

    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.short
        formatter.timeStyle = DateFormatter.Style.long
        return formatter
    }()


    // MARK: - View lifecycle

    override func loadView() {

        self.view = View()
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        setupUI()
        setupDataController()
    }

    private func setupUI() {

        view.backgroundColor = UIColor.white
        title = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(ViewController.addButton))
        mainView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: recordCellIdentifier)
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }

    private func setupDataController() {

        // TODO: show loading whilst CoreData is being setup for the 1st time
        // TODO: DI the CoreDataController around the app and / or use Singleton to avoid setting up multiple times

        dataController = CoreDataController { success, error in
            if success {
                print("Info: Successfully initialized CoreData")
                self.loadDataAndUI()

            } else {
                print("Error: Failed to initialize CoreData \(String(describing: error))")
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)
    }


    // MARK: - Load

    private func loadDataAndUI() {

        loadData()
        mainView.tableView.reloadData()
    }

    private func loadData() {

        // TODO: constants or types to generate entity name

        self.records = dataController.getObjects(name: Record.EntityName)
    }


    // MARK: - Add

    @objc func addButton() {

        let record: Record = dataController.createObject(name: Record.EntityName)
        record.name = dateFormatter.string(from: Date())
        dataController.save()
        loadDataAndUI()
    }
}


// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: recordCellIdentifier, for: indexPath)

        if indexPath.row < records.count {
            cell.textLabel?.text = records[indexPath.row].name
        }
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return records.count
    }
}


// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {

        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        switch editingStyle {
        case .delete:
            let photo = records[indexPath.row]
            dataController.deleteObject(object: photo)
            loadDataAndUI()
        default:
            print("Info: unknown editing style action commited: \(editingStyle.rawValue)")
        }
    }
}
