//
//  ArticleViewModel.swift
//  Good News
//
//  Created by kenjimaeda on 01/11/22.
//

import Foundation
import RxCocoa
import RxSwift

//view model comunica tanto com a view quanto com model

//MARK: - Criando apenas um article
struct ArticleViewModel {
	
	let articles: Articles
	
	init(_ articles: Articles) {
		self.articles = articles
	}
}

//criando um extension para pegar apenas o title e o description
//articles e do inicializador acima
extension ArticleViewModel {
	
	var title: Observable<String>  {
		return Observable.just(articles.title)
	}
	
	var description: Observable<String> {
		return Observable.just(articles.description)
	}
	
}

//MARK: - Criando uma lista de articles

//criando um uma lista de articles
struct ArticleListViewModel   {
	let articlesVM: [ArticleViewModel]
}

extension ArticleListViewModel  {
	
	//compactMap remove os nill
	//https://www.hackingwithswift.com/articles/205/whats-the-difference-between-map-flatmap-and-compactmap
	init(_ articles: [Articles]) {
		self.articlesVM = articles.compactMap(ArticleViewModel.init)
	}
	
	
}

//pegando so um article
extension ArticleListViewModel  {
	
	//com a palavra static nao reconhece
	func articleAt(_ index:Int) -> ArticleViewModel {
		return  self.articlesVM[index]
	}
	
}

