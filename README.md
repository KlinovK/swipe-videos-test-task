Swipe Videos Test Task

A SwiftUI onboarding app with swipeable video pages, text overlays, and navigation controls.

🚀 Overview

This project implements a full-screen onboarding flow featuring:
	•	Looping videos per page
	•	Text descriptions
	•	Swipe and button-based navigation
	•	UIKit integration for enhanced functionality

✨ Features
	•	Swipeable Video Pages: Navigate through three looping video pages by swiping.
	•	Text Overlays: Each page displays unique descriptive text.
	•	Navigation Controls:
	•	A “Next” button on the first two pages
	•	On the last page, “Next” loops back to the first
	•	Custom Page Control: UIKit-based page indicator (currently hidden).
	•	Video Looping: Seamless video playback using AVPlayerLooper.

🧱 Project Structure

File	Description
OnboardingView.swift	Main SwiftUI view displaying the video, text, and navigation controls.
OnboardingViewModel.swift	Manages page data and navigation logic.
OnboardingPage.swift	Model representing a page (video file + text).
PageControl.swift	SwiftUI wrapper for UIKit UIPageControl. (currently hidden)
VideoPlayerView.swift	SwiftUI wrapper for looping video playback using AVKit.

🔧 Setup

Prerequisites
	•	Xcode 16 or later
	•	iOS 15.0+
	•	Three video files added to the main bundle:
	•	Testdrive_01.mp4
	•	Testdrive_2.mp4
	•	Testdrive_03.mp4

Installation
	1.	Clone the repository:

git clone https://github.com/your-username/swipe_videos_test_task.git


	2.	Open the project:

open swipe_videos_test_task.xcodeproj


	3.	Ensure the required video files are added to the main bundle.

▶️ Running the App
	•	Build and run the app in Xcode on a simulator or device.
	•	Swipe left/right to switch pages, or tap Next to navigate.
	•	On the final page, tapping Next returns to the first page.

⚠️ Notes
	•	Ensure all video files are correctly named and included in the app bundle.
Otherwise, the app may crash due to missing resources.
	•	To enable the hidden page control, update visibility in OnboardingView.swift.

