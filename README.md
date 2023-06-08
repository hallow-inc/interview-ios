# Interview

The intent of this interview is to:
- be an exercise that lets us get a better idea of how you think and work. We want to see how you adapt to a new code base and solve the challenges we've left for you along the way.
- be a reasonable simulation of really working together. At least as close as we can accomplish in a short time period
- be as open as you would like. Feel free to ask questions or search the internet.
- take longer than the time we have allotted. No one has ever "finished" this project

It is **not** intended to:
- be production-ready code. We do have a very similar view in our production app, but this one will never see the light of day. Feel free to talk about or demonstrate how you might make things more robust, but we want to see you solve _this_ problem not how you would solve some other problem.
- be stressful. We generally enjoy the work that we do and want to work with other people who do too. It isn't a trick question and we're not going to grill you about big O complexity or your choice in data structure.
- be done ahead of time. The whole point is to work together in real time. Feel free to look over the project before the interview or try some things out in the code, but revert to `main` before we start the interview so we can see the project from scratch.

We will be creating a calendar view that displays streak information for a given user.
Utilizing the provided base code, create an app that mimics the UI in the following image:

<img src="https://hallow.app/interview/ios_template.png" width="250">

### Requirements
* The data must be dynamic and must come from the provided API endpoint:
	https://hallow.com/interview/activity.json
* The stream of days should be broken up into weeks to display
* Every day with a streak should be displayed as a piece of the streak. For single day streaks it should be a circle, otherwise whatever component makes up the greater streak.
* Each month should show the month label on top of it

### Notes
* Some base code has been provided for you in this repository, feel free to use as much or as little as you would like
* For networking, some SPM packages have been pre-added for your use
