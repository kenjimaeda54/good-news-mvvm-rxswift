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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		populetedNews()
		
	}
	
	func populetedNews() {
		
		let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e03da12b408445449464ceb16db4963a")!
		
		let resource = Resource<ArticleResult>(url: url)
		
		URLRequest.load(resource).subscribe(onNext:{
			 print($0)
		}).disposed(by: disposed)
		
	}

}
