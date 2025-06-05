//
//  OnboardingView.swift
//  swipe-videos-test-task
//
//  Created by Константин Клинов on 04/06/25.
//

import SwiftUI

/// A SwiftUI view for an onboarding experience with video pages and navigation.
///
/// Displays a full-screen video player with text overlays and a "Next" button for navigation, except on the last page.
struct OnboardingView: View {
    /// The view model managing page data and navigation state.
    @StateObject private var viewModel = OnboardingViewModel()
    
    /// The main view content.
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $viewModel.currentPage) {
                ForEach(0..<viewModel.pages.count, id: \.self) { index in
                    ZStack(alignment: .bottom) {
                        VideoPlayerView(videoName: viewModel.pages[index].videoName, isActive: viewModel.currentPage == index)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            .ignoresSafeArea()
                            .tag(index)
                        
                        VStack {
                            Text(viewModel.pages[index].text)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.black.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.top, 50)
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            Spacer()
                            
                            if index < viewModel.pages.count - 1 {
                                Button(action: {
                                    viewModel.goToNextPage()
                                }) {
                                    Text("Next")
                                        .font(.headline)
                                        .padding()
                                        .frame(width: 100)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .clipShape(Capsule())
                                        .padding(.bottom, 60)
                                }
                            }
                        }
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea()
        }
    }
}
