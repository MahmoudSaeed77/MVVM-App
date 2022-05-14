//
//  HomeModel.swift
//  Medical Shop Client
//
//  Created by apple on 09/05/2022.
//

import Foundation
struct HomeBaseModel : Codable {
    var data : HomeBaseData?
    var status : Bool?
}

struct HomeBaseData : Codable {
    var categories : [Categories]?
    var brands : [Brands]?
    var newer : [Product]?
    var offers : [Product]?
}

struct Categories : Codable {
    var id : Int?
    var name : String?
    var image : String?
    var products_count : Int?
    var subCats : [SubCats]?
}

struct SubCats : Codable {
    var id : Int?
    var name : String?
}

struct Brands : Codable {
    var id : Int?
    var name : String?
    var products_count : Int?
}

struct Product : Codable {
    var id : Int?
    var images : [String]?
    var name : String?
    var price : String?
    var qty : Int?
    var rate : String?
    var discount_price : String?
}
