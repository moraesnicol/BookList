//
//  BoolTableViewCell.swift
//  BookList
//
//  Created by Gabriel on 26/09/21.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookSummary: UILabel!
    @IBOutlet weak var bookPrintLength: UILabel!
    
    
    private var urlString: String = ""
    
    func setCellWithValuesOf(_ book: Book) {
        updateUIView(title: book.title, author: book.author, printLength: book.printLength, summary: book.summary, bookCover: book.imgUrl)
    }
    
    private func updateUIView(title: String?, author: String?, printLength: Int?, summary: String?, bookCover: String?) {
        
        self.bookTitle.text = title
        self.bookAuthor.text = author
        self.bookSummary.text = summary
        guard let page = printLength else {return}
        self.bookPrintLength.text = String(page)
        
        guard let coverString = bookCover else {return}
        urlString = coverString
    
        guard let coverImage = URL(string: urlString) else {
            self.bookCover.image = UIImage(named: "noImageAvaible")
            return
        }
       self.bookCover.image = nil
        
        getImageDataFrom(url: coverImage)
    }
    
    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("DataTaskError: \(error.localizedDescription)")
                return
            }
        
            guard let data = data else {
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.bookCover.image = image
                }
            }
        }.resume()
    }
    
    
}
