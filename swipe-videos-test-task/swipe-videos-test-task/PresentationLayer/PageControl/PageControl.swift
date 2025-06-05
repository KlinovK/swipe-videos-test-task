//
//  PageControl.swift
//  swipe-videos-test-task
//
//  Created by Константин Клинов on 05/06/25.
//

import SwiftUI

/// A SwiftUI view that displays a UIKit `UIPageControl` for page navigation.
///
/// Wraps a `UIPageControl` to show dots for pages in a SwiftUI app.
struct PageControl: UIViewControllerRepresentable {
    /// Total number of pages.
    var numberOfPages: Int
    
    /// Binding to the current page index.
    @Binding var currentPage: Int
    
    /// Creates and sets up the `UIPageControlViewController`.
    ///
    /// - Parameter context: SwiftUI context.
    /// - Returns: A configured `UIPageControlViewController`.
    func makeUIViewController(context: Context) -> UIPageControlViewController {
        let pageControl = UIPageControlViewController()
        pageControl.pageControl.numberOfPages = numberOfPages
        pageControl.pageControl.currentPage = currentPage
        return pageControl
    }
    
    /// Updates the `UIPageControl` with the current page.
    ///
    /// - Parameters:
    ///   - uiViewController: The `UIPageControlViewController` to update.
    ///   - context: SwiftUI context.
    func updateUIViewController(_ uiViewController: UIPageControlViewController, context: Context) {
        uiViewController.pageControl.currentPage = currentPage
    }
}

/// A UIKit view controller that manages a `UIPageControl`.
///
/// Hosts a `UIPageControl` for use in SwiftUI, handling its layout and style.
class UIPageControlViewController: UIViewController {
    /// The `UIPageControl` for page indicators.
    let pageControl = UIPageControl()
    
    /// Sets up the `UIPageControl` in the view.
    ///
    /// Adds the `pageControl`, sets constraints, and styles it.
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
