# Good news
Aplicativo consumindo api de [noticias](https://newsapi.org/)

## Motivação
Aprender o uso do MVVM e também melhorar conceito de requisições com RxSwfit e RxCocoa

## Feature
- Para construir uma view model extensiva, disponibilizei uma coleção de articles e apenas um  article
- Disponibilizei apenas um article, porque no momento de construir nossas células no dequeReusableCell preciso apenas de um artile

```swift

// view model

struct ArticleViewModel {
	
	let articles: Articles
	
	init(_ articles: Articles) {
		self.articles = articles
	}
	
}

extension ArticleViewModel  {
	
	var title: Observable<String>  {
		return Observable.just(articles.title)
	}
	
	var description: Observable<String> {
		return Observable.just(articles.description)
	}
	
}


```
- Disponibilizei um conjunto de articles porque no momento da requisição preciso de uma coleção



```swift

struct ArticlesListViewModel {
	
	let articlesVM: [ArticleViewModel]
	
}

extension ArticlesListViewModel {
		
	//compactMap remove os nill
	//https://www.hackingwithswift.com/articles/205/whats-the-difference-between-map-flatmap-and-compactmap
	
	//criando um array de articlesVM a partir do init de articles
	init(_ articles: [Articles]) {
		self.articlesVM = articles.compactMap(ArticleViewModel.init)
	}
	
}

//pegando so um articleVM
extension ArticlesListViewModel  {
	
	func articleAt(_ index: Int) -> ArticleViewModel {
		return articlesVM[index]
	}
	
}


```



