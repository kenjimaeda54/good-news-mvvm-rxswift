//
//  Articles.swift
//  Good News
//
//  Created by kenjimaeda on 01/11/22.
//

import Foundation

struct ArticleResult: Decodable {
	let articles: [Articles]
}

struct Articles: Decodable {
	let description: String
	let title: String
}
