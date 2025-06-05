//
//  PageControl.swift
//  swipe-videos-test-task
//
//  Created by Константин Клинов on 05/06/25.
//

import SwiftUI

struct PageControl: UIViewControllerRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeUIViewController(context: Context) -> UIPageControlViewController {
        let pageControl = UIPageControlViewController()
        pageControl.pageControl.numberOfPages = numberOfPages
        pageControl.pageControl.currentPage = currentPage
        return pageControl
    }
    
    func updateUIViewController(_ uiViewController: UIPageControlViewController, context: Context) {
        uiViewController.pageControl.currentPage = currentPage
    }
}

class UIPageControlViewController: UIViewController {
    let pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = .gray
    }
}
