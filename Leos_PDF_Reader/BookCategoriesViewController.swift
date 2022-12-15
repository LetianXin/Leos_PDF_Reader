//
//  BookCategoriesViewController.swift
//  Leos_PDF_Reader
//
//  Created by Letian Xin on 15/12/2022.
//
//  Class extentions can break a big class into small pecies
//


import UIKit

class BookCategoriesViewController: UIViewController {
//    let bookCategories = ["A", "B", "C", "D", "E", "F", "G", "H"]
    
    let bookCategories: [String]
    
    init() {
        self.bookCategories = Utils.getDirectoriesUnder(s: "RAZ")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder not implemented")
    }
    
    override func loadView() {
        let v = UIView(frame: UIScreen.main.bounds)
        self.view = v
        view.backgroundColor = .white
        makeUITableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func makeUITableView() -> UITableView {
        var tbv = UITableView()
        view.addSubview(tbv)
        tbv.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tbv.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tbv.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tbv.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tbv.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
        ])
        
        tbv.delegate = self
        tbv.dataSource = self
        tbv.register(UITableViewCell.self, forCellReuseIdentifier: "tbvCell")
        return tbv
    }
   

}

extension BookCategoriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(bookCategories[indexPath.row])
        self.navigationController?.pushViewController(BookListViewController(), animated: true)
    }
}

extension BookCategoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tbvCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = bookCategories[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookCategories.count
    }
}

