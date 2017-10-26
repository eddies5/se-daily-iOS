//
//  PodcastPageViewController.swift
//  SEDaily-IOS
//
//  Created by Keith Holliday on 7/26/17.
//  Copyright © 2017 Koala Tea. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class PodcastPageViewController: TabmanViewController, PageboyViewControllerDataSource {
    
    var viewControllers = [GeneralCollectionViewController]()
    var barItems = [TabmanBar.Item]()
    var customTabBarItem: UITabBarItem! {
        get {
            return UITabBarItem(title: L10n.tabBarTitleLatest, image: #imageLiteral(resourceName: "mic_stand"), selectedImage: #imageLiteral(resourceName: "mic_stand_selected"))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem = customTabBarItem
        
        self.dataSource = self
        
        self.loadViewControllers()
        
        // configure the bar
        self.bar.style = .scrollingButtonBar
        
        self.bar.items = barItems
        
        self.reloadPages()
        
        // Set the tab bar controller first selected item here
        self.tabBarController?.selectedIndex = 0
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func loadViewControllers() {
        let layout = UICollectionViewLayout()
        
        viewControllers = [
            GeneralCollectionViewController(collectionViewLayout: layout,
                                            tabTitle: PodcastCategoryIds.All.description),
            GeneralCollectionViewController(collectionViewLayout: layout,
                                            categories: [PodcastCategoryIds.Business_and_Philosophy],
                                            tabTitle: PodcastCategoryIds.Business_and_Philosophy.description),
            GeneralCollectionViewController(collectionViewLayout: layout,
                                            categories: [PodcastCategoryIds.Blockchain],
                                            tabTitle: PodcastCategoryIds.Blockchain.description),
            GeneralCollectionViewController(collectionViewLayout: layout,
                                            categories: [PodcastCategoryIds.Cloud_Engineering],
                                            tabTitle: PodcastCategoryIds.Cloud_Engineering.description),
            GeneralCollectionViewController(collectionViewLayout: layout,
                                            categories: [PodcastCategoryIds.Data],
                                            tabTitle: PodcastCategoryIds.Data.description),
            GeneralCollectionViewController(collectionViewLayout: layout,
                                            categories: [PodcastCategoryIds.JavaScript],
                                            tabTitle: PodcastCategoryIds.JavaScript.description),
            GeneralCollectionViewController(collectionViewLayout: layout,
                                            categories: [PodcastCategoryIds.Machine_Learning],
                                            tabTitle: PodcastCategoryIds.Machine_Learning.description),
            GeneralCollectionViewController(collectionViewLayout: layout,
                                            categories: [PodcastCategoryIds.Open_Source],
                                            tabTitle: PodcastCategoryIds.Open_Source.description),
            GeneralCollectionViewController(collectionViewLayout: layout,
                                            categories: [PodcastCategoryIds.Security],
                                            tabTitle: PodcastCategoryIds.Security.description),
            GeneralCollectionViewController(collectionViewLayout: layout,
                                            categories: [PodcastCategoryIds.Hackers],
                                            tabTitle: PodcastCategoryIds.Hackers.description),
            GeneralCollectionViewController(collectionViewLayout: layout,
                                            categories: [PodcastCategoryIds.Greatest_Hits],
                                            tabTitle: PodcastCategoryIds.Greatest_Hits.description)
        ]
        
        viewControllers.forEach { (controller) in
            barItems.append(Item(title: controller.tabTitle))
        }
    }
}
