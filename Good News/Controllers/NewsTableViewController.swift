//
//  NewsTableViewController.swift
//  Good News
//
//  Created by kenjimaeda on 26/10/22.
//

import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
	
	//MARK: - Vars
	let disposed = DisposeBag()
	var articleVM: ArticlesListViewModel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		populetedNews()
		
	}
	
	func populetedNews() {
		
		let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e03da12b408445449464ceb16db4963a")!
		
		let resource = Resource<ArticleResult>(url: url)
		
		URLRequest.load(resource).subscribe(onNext:{[self] response in
			 
			let articles = response.articles
			articleVM = ArticlesListViewModel(articles)
			
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
			 
		}).disposed(by: disposed)
		
	}
	 
	override func numberOfSections(in tableView: UITableView) -> Int {
		 return 1
	}
	 
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return articleVM != nil  ? articleVM.articlesVM.count : 0
	}
 
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cellGodNews", for: indexPath) as! NewsTableViewCell
		
		let article = articleVM.articleAt(indexPath.row)
		 
		article.title.asDriver(onErrorJustReturn: "")
			.drive(
				cell.labTitleNew.rx.text
			).disposed(by: disposed)
		
		article.description.asDriver(onErrorJustReturn: "")
			.drive(
				cell.labDescriptionNew.rx.text
			).disposed(by: disposed)
		
		return cell
		
	}
	 
	
}
