### Steps to Run the App

1. `git clone` this repository onto a Mac with Xcode installed.
2. Open the project in Xcode.
3. Select `Product > Run`.

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

I prioritized implementing a `CachedAsyncImage` view that caches the result of the network request. 
I chose to implement it this way because I knew that I would be using cachable images in a few places throuhout the app.
Additionally, having a single view to encapsulate this logic is much more maintainable and makes future developemnet easier.

I also implemented some tests for the behavior of my `ImageLoader`, `RecipeRetriver`, and `Recipe`'s conformace to `Decodable`.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

I spent approximately 4.5 hours on this project.
I put in a total of about 3.5 hours on 2024-12-12 and about 1 hour on 2024-12-18 including writing this README.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?

The first decisison I had to make for this project was between using SwiftUI and UIKit.
I chose SwiftUI since Fetch uses it to make new views and I wanted to demonstate proficiency in the newest methods.
I chose Swift Testing over XCTest for similar reasons: it demonstates I am current with my iOS develeopement knowedge.
I have experience with UIKit and XCTest as well and am happy to demonstate them at another time.

### Weakest Part of the Project: What do you think is the weakest part of your project?

In this app I chose to keep everything extremely simple at the cost of some amount of flexibility.
The weakest part is probobly the UI.
One example of this is that long recipe titles like "Apple & Blackberry Crumble" do not wrap in the navigation bar on devices with small enough screens.
This is a problem that can be fixed fairly easily, but do to my limited time and that this is a demo app not meant for production, I chose to leave small errors like that.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.

I completed this take home project during a very busy period.
I am proud of my work, but in the spirit of open communication, this project was not my first priority.
If I am hired by Fetch I will be able to dedicate much more time and effort to my work than I was able to in this project.
