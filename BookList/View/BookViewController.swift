//
//  ViewController.swift
//  BookList
//
//  Created by Gabriel on 26/09/21.
//

import UIKit

class BookViewController: UIViewController {
    
    var apiService = ApiService()
    private var viewModel = BookViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBooksData()
    }
    
    private func loadBooksData() {
        viewModel.getBooksData { [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.reloadData()
        }
    }
  
}

extension BookViewController: UITableViewDelegate {
    
}

extension BookViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookTableViewCell
        
        let book = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(book)
        return cell
    }
}
