[1] Who am I?
I am Mary-Anne Cosgrove
I am currently a member of the Marketplace development team for Envato. We  such as website themes, graphic art, audio and video. Our community have made over $224M in sales from our sites. In September last year themeforest.net became one of the world's top 100 websites, ahead of Netflix and google.com.au.
The code behind the marketplaces is constantly evolving, crafted by 7 teams using state of the art Agile development practices. These practices give us the confidence to deliver continual incremental improvements to our sites, with production deployments typically happening 8 - 12 times a day.

[1.1] Tell me a little about yourselves...
Who here is currently a developer... or has been a developer?
Who is a tester, BA, project manager
What platforms are your development teams using? Java? .NET? Others?
[1.2] Why am I talking to you today?
Previous to my role at Envato I was an Agile consultant for ThoughtWorks Australia in Sydney, mentoring Agile teams at various organisations including NBN Co, Suncorp and Vodafone. Today I want to share with you some of the practices and tools that have made these teams successful. 
[2] One of those practices is Behaviour Driven Development, or BDD. What is BDD?
It was first described by Dan North in 2006. It is a development practice that incorporates the older practice of Test Driven Development, first described by Kent Beck in his 2002 book.
[3] The TDD cycle - Start by writing a failing unit test. Write just enough code to make the test pass. Now refactor the code to make it neat and maintainable.
The BDD cycle is an epicycle that wraps around the TDD cycle. With BDD you start with writing a failing functional test - a test that describes the feature you are developing from the _user's_ point of view. Then you begin the TDD loop. After your refactoring is done, you run the feature test. Now if it passes, you know your feature is complete. If it's still failing, you return to the TDD loop.
[4] Let's imagine that the Government has decided to solve its budget woes by increasing personal income tax! Our team's project is to update the ATO tax calculator website. Maybe we've been told the website must be written in Java or .NET to comply with departmental standards. But we can STILL power our project using one of the most powerful BDD tools, Cucumber. When maintaining existing software, if you've been through the BDD cycle before you will already have a passing functional test. So let's begin with a passing test for the 2014 tax calculator. Here's what that test looks like.