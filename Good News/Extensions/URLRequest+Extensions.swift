//
//  URLRequest+Extensions.swift
//  Good News
//
//  Created by kenjimaeda on 01/11/22.
//

import Foundation
import RxSwift
import RxCocoa

struct Resource<T: Decodable> {
	let url: URL
}

extension URLRequest {
	
	static func load<T>(_ resource: Resource<T>) -> Observable<T> {
		
		return Observable.from([resource.url]).flatMap { url -> Observable<Data> in
			let urlRequest = URLRequest(url: url)
			return URLSession.shared.rx.data(request: urlRequest)
		}.map { data -> T in
			return try JSONDecoder().decode(T.self, from: data)
		}
		
	}
	
}
