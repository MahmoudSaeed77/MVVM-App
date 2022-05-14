//
//  HomeViewModel.swift
//  Medical Shop Client
//
//  Created by apple on 09/05/2022.
//

import Foundation

class HomeViewModel {
    
    // MARK:- Variables
    private weak var view: HomeVC!
    private var homeData = HomeBaseModel()
    
    
    // MARK:- Life cycle
    init(view: HomeVC) {
        self.view = view
        self.getHomeData()
    }
    
    // MARK:- Setting and getting data
    func getCategoriesCount() -> Int {
        return self.homeData.data?.categories?.count ?? 0
    }
    
    func getNewerCount() -> Int {
        return self.homeData.data?.newer?.count ?? 0
    }
    
    func getOffersCount() -> Int {
        return self.homeData.data?.offers?.count ?? 0
    }
    
    func getBrandsCount() -> Int {
        return self.homeData.data?.brands?.count ?? 0
    }
    
    func bindCategoriesData() -> [Categories] {
        return self.homeData.data?.categories ?? []
    }
    
    func bindNewerData() -> [Product] {
        return self.homeData.data?.newer ?? []
    }
    
    func bindOffersData() -> [Product] {
        return self.homeData.data?.offers ?? []
    }
    
    func bindBrandsData() -> [Brands] {
        return self.homeData.data?.brands ?? []
    }
    
    // MARK:- Getting data from api
    private func getHomeData() {
        HomeApiManager.shared.getHomeData { data, err in
            if err != nil {
                self.view.failedFetchingData(error: err?.localizedDescription ?? "")
                return
            }
            self.homeData = data
            self.view.successfullFetchingData(data: data)
        }
    }
}
