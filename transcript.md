[1] Hi, I'm Mary-Anne Cosgrove.
I am currently a Senior Developer in the Marketplace development team for Envato. We build a suite of eight online marketplaces for selling digital creations such as website themes, graphic art, audio and video. We currently have over 1.75 million active buyers. In September last year themeforest.net became one of the world's top 100 websites, with more page views than Netflix and google.com.au.
The code behind the marketplaces is constantly evolving, crafted by 7 teams using state of the art Agile development practices. These practices give us the confidence to deliver continual incremental improvements to our sites, with production deployments typically happening 8 - 12 times a day.

Previous to my role at Envato I was an Agile consultant for ThoughtWorks Australia in Sydney, mentoring Agile teams at various organisations including NBN Co, Suncorp and Vodafone. Today I want to share with you some of the practices and tools that have made all these Agile teams successful. 

[1.1] But first, tell me a little about yourselves...
Who here is currently a developer... or has been a developer?
Who is a tester, BA, project manager
What platforms are your development teams using? Java? .NET? Others?

[2] One of the practices that I have seen applied most successfully is Behaviour Driven Development, or BDD.
It was first described by Dan North in 2006. It is a development practice that incorporates the older practice of Test Driven Development (TDD), first described by Kent Beck in his 2002 book. Is anyone here working with teams that use TDD?

[3] When developing with TDD, we start by writing a failing unit test. Then we write just enough code to make the test pass. Finally, we refactor the code to make it neat and maintainable. 

[4] Writing the tests first guarantees that we have a high coverage of tests over our code. This is a safety net that gives developers the confidence they need to refactor. This refactor stage is a key benefit of TDD; without it, code tends to become brittle as time goes on. Eventually, a codebase that is developed without refactoring becomes impossible to maintain and must be rewritten. 

The suite of tests you build up over time becomes technical documentation of the classes in your system. Unlike written documentation, passing tests are guaranteed to be up to date.

Like the swinging of the pendulum in a grandfather clock, the rhythm of red - green - refactor forms a cadence that drives the work of the developers and testers in your team.

[5] If the TDD cycle is the minute hand of a clock, the BDD cycle is the hour hand. 

With BDD you start with writing a failing functional test, or scenario - a test that describes the feature you are developing from the _user's_ point of view. Then you begin the TDD loop. After your refactoring is done, you run the feature test. Now if it passes, you know your feature is complete. If it's still failing, you return to the TDD loop. 

[6] The scenario has become a roadmap for the development of your feature - the passing steps within the scenario are an accurate gauge of your progress.

[7] Let's look at an example.  Imagine that the Government has decided to solve its budget woes by increasing personal income tax! Our mission is to update the ATO tax calculator.  

[8] The tax calculator is a wizard style section of the ATO website.   
[9] Clicking on the link opens the tax calculator info page in a new window.  
[10] The wizard asks a series of questions, such as - were you an Australian resident for the full year?  
[11] How much income did you receive from various sources?  
[12] Which screens of the wizard are relevant to you?  
[13] What were your tax credits and offsets?  
[14] Finally, the wizard tells you your total and net tax payable. It is the figures on this final screen that our team must change as part of the work to adjust the tax rates.  

[15] When maintaining existing software, if you've been through the BDD cycle before you will already have a passing scenario for the feature. So let's begin with a passing scenario for the 2014 tax calculator.  It really doesn't matter how that website was developed - it could be Java or .NET or PHP - anything. But we can STILL power our project using one of the most powerful BDD tools, Cucumber. Here's what that scenario looks like. This is a real Cucumber test that I wrote to test the live ATO website. The code is available for download from my Github account.

[16] Cucumber scenarios are grouped together in files for each Feature. At the top of the file is a description of the Feature; here we want to calculate individual taxes for full year residents. Next comes a statement of what that feature is designed to achieve. The statement is often written in the form "In order to \<achieve a goal\>, as a \<user role\> I want to \<do something\>". This focuses the team on the end goal of the user, who that user is, and how they are to achieve their goal. It helps build empathy for the user within the development team. 

For this feature, "In order to know how much more tax I have to pay, As an Australian full year resident, I want to calculate my net tax owing".

[17] The operational part of the Cucumber scenario begins with the keyword Scenario. Scenarios are written in the language "Given \<some starting conditions\>, When \<I take some actions\> Then \<I expect some outcomes\>". In our example, "Given I have started the tax calculator and I am a resident, When I enter my income details, and choose these screens, and enter these tax credits,   
[18] Then I expect my tax payable to be around $39k". These final figures are the figures on the last page of the wizard, the ones we need to adjust.

[19] The process by which you arrive at your scenario is very important! BDD is at its most powerful when scenarios are developed together, by cross-functional teams - teams that include a mix of developers, testers, a BA and a product or feature owner. Each of these roles brings their own skills, knowledge and points of view to the table. When your team spends time working together on the scenarios at the start of each sprint, you have an opportunity to explore the feature, to ask questions of each other such as "who is going to be using our feature", "what are they trying to achieve", "what should happen under these circumstances", and so on. You start your development work with a deep shared understanding of the scenarios you are about to code, and an empathy for the end user and the goals they are trying to achieve.

[20] Let's see our working scenario in action! To start it running, we type 'cucumber' in the console. We can watch Cucumber drive the ATO tax calculator through each page of the wizard, ending with the verification of the figures on the final page. As it runs, the steps in our scenario appear in the console window on the right. Each green line is a step that has passed. The test ends with a summary letting us know that we ran 1 scenario containing 6 steps, which have all passed.

[21] The first time you see one of these scenarios in action, it seems like magic! How do you get from a description written in ordinary English, that is really a form of documentation of your feature, to working code? Would you like to have a brief look behind the scenes? This will get a little technical - if you're not comfortable with looking at code we can skim over this section and spend more time discussing what it's like to use these processes in your Agile team at the end of the presentation.

[22] Each line in the Feature is matched to Steps that are coded in a separate file. 

[23] For example, when the Feature says "Given I have started the latest comprehensive tax calculator", there's a step behind the scenes that matches that line. The matching is done using regular expressions, which can include placeholders for values so that the same step definition can be customised and reused across multiple scenarios. So in this example, to start the tax calculator, we visit the base page, click the tax calculator link, switch to the new window that opens up, then submit the form to progress to the next step in the wizard.

[24] Tags at the start of a scenario allow you to modify how the scenario will operate. You may have noticed the @javascript tag that our scenario uses. This tag ensures that the scenario runs inside a browser. It is necessary if your scenario requires JavaScript to operate. It is also very useful for debugging, as it allows you to see what your test is doing, or inspect your page at points during the test. Another commonly used tag is @wip, for Work In Progress. Scenarios that are committed to your source repository with this tag are generally skipped when the continuous integration build runs, so that developers can work on implementing a feature over a period of time without breaking the build. It's also easy to define your own tags, for example to break up your build into batches that run at different times or on different machines.

[25] There is a Ruby gem (a kind of plugin) called Capybara that Cucumber uses behind the scenes to interface with the web page you are testing. Capybara provides a variety of Finders, Actions and Matchers to make writing your steps easy.  Finders help you locate elements on your web page. Actions emulate user actions such as clicking on buttons or typing text. And Matchers allow you to verify the content of your page. In our scenario, "I am a Resident for the full year" calls a helper method I have written. The helper "choose_by_value" uses a Capybara finder to locate the radio button whose value is FULL_YEAR_RESIDENT. It then uses a Capybara action to emulate clicking on that radio button. (Just an aside - If I had control over the coding of the web page, I could use a much simpler finder here by connecting the label "Resident for the full year" to the radio button itself. That's something that should be done for accessibility anyway, but has not been done on this page. When the label is connected correctly to the input element you can simply find by the label text.)

[26] Another feature of Cucumber that we used extensively in this feature are Tables. Tables allow us to express our features very succinctly. When the feature says "My tax estimates are expected to be" "Tax on taxable income" of $37k, Medicare levy of $2k etc, that's all covered by a single step which takes in a table.   
[27] For each row in the table there's an expectation that our web page has a row containing the Estimate Type label, which also contains the amount text.  
[27.1] "have_text" is an example of a Capybara Matcher. Here the test will fail if the element found does not contain the amount text.  
[28] We can use tables not only for individual steps within scenarios, but also for entire scenarios, by calling it a "Scenario Outline" (instead of just "Scenario") and including a set of values in a table at the end of the outline. The scenario then runs once for each row in the table, using the provided values in that row to customise it.  

[29] Let's imagine now that we have our working scenario for the current version of the webpage, and we now need to update our values to suit the new tax rates. The first thing we do when we start working on our change, is change our scenario to make it fail. Let's see that in action. First we update the amount that is tax on taxable income. Now we run our tests to make sure that the scenario is failing in the manner we expect it to fail. This gives us a goal to aim for with the next little piece of our work, making the tax on taxable income match the new expectation.

[30] So... Cucumber in a Nutshell (if you'll forgive the mixed metaphor). BDD with Cucumber is at its most powerful when your scenarios are written together by your whole team. The diverse roles in a cross-functional team will all bring different perspectives, and as a result you'll end up with a set of scenarios that express the main use cases for your feature well. Your team will come away from that workshop with a clear, shared understanding of your new feature at the start of your sprint. Cucumber scenarios read like English and become living documentation of your feature, guaranteed never to be out of date if they are passing. The set of scenarios is a roadmap for the creation of your feature, and the passing steps are an accurate gauge of your team's progress through the work.

[31] But there are a couple of things you need to be careful of.  
[32] The first is reusing steps. It's tempting to get as much reuse out of steps as possible, but I've worked on projects where the steps ended up so disorganised that it took more time to write the features in the exact language of the steps you wanted to reuse, than it would have to write the steps from scratch. It's often better to have just a small set of commonly used steps, and write most features with their own set of fresh steps that use only those plus the basic Capybara finders, actions and matchers. 

[33] Sometimes when the process is new, the team forgets that there's a set of scenarios they are supposed to be using. They may need to be reminded to allow the scenarios to drive their work forward, otherwise you'll end up with a bunch of scenarios that must be 'dewipped' after the work is already complete.  

[34] Cucumber scenarios, because they are driving through your user interface, take much longer to run than unit tests that exercise the underlying code classes directly. To keep your whole test suite runnable in a reasonably short period of time, aim for the test pyramid. The vast majority of your tests should be unit tests, isolated to the class they are testing. You can run thousands of these in the time it takes to run one scenario. They should exercise all the edge and corner cases - the error conditions, logical boundaries and so on. Write a few integration tests - tests that communicate with other services such as a database or a third party API.   
[34.1] Cucumber scenarios should outline only the main happy-path use cases of your feature. And finally, manual testing should only be exploratory. If a test can be scripted, it can be automated.

[35] Now that we've written our failing Cucumber scenario,   
[36] it's time to enter the TDD cycle by writing our first failing unit test.

[37] I strongly encourage you to consider writing your unit tests with RSpec. Although RSpec was originally developed for testing Ruby projects, I have also worked on Java projects that used it by running JRuby on the JVM. I've provided a reference on how to do that in the Github project that accompanies this presentation.

[38] One reason for preferring RSpec is that, like Cucumber, it encourages more readable tests, turning them into living documentation. With RSpec, this is technical documentation of your classes rather than the feature level documentation you get out of Cucumber.  
[39] Here's an example of output from running an RSpec test against a class that might form part of the code for our tax update project. Here the test is failing because we've updated one of the figures in the test to match the new tax rates.  
[40] A clear description of the failure is printed at the bottom of the test output.

[41] So how is it that our test knows enough to produce this kind of documentation when it runs? Would you like to have a look at the code?

RSpec is a domain specific language for testing, that is layered on top of Ruby. This language encourages the developer to provide good descriptions of the object under test, the environment the test is running in, the actions that are taken, and the expected outcome.
[42] Here we see the keyword 'describe' documenting the class and methods under test. 'context', for example 'when reportable fringe benefits are...', like the 'Given' in a scenario, documents the environment the test is running in. 'it' encourages the coder to write a description of the expected outcome.   
[42.1] These descriptions come together in the output as 'TaxCalculator#initialize when reportable fringe benefits are 1, raises an error.'
The code itself reads well too, for example 'Expect tax_calculator to raise_error'.

[43] In RSpec we can take advantage of all the beautiful features of Ruby that coders love, for example String interpolation and easy enumeration over hashes and arrays. Here we see a hash of tax payable keyed on income, driving a set of tests of the total tax payable. The RSpec matcher "be_within" allows us to match floating point numbers without having to worry about their precision.

[44] Finally, RSpec makes it really easy to isolate your unit tests to individual classes and even methods, by supplying methods for mocking instances of other classes (for example, an interface to a third party API) and stubbing individual methods. Here we are testing the net tax payable by stubbing out the #total_tax_payable method. 'before' the test runs, we 'allow' the tax calculator 'to receive' the total_tax_payable method, 'and return' the value we want.

[45] So summing up, BDD is a powerful process for driving your Agile projects. Cucumber, Ruby, Capybara and RSpec are invaluable tools for supporting that process. Cucumber can be used with any web project, regardless of the language it was developed in. RSpec can be used on any Java or Ruby project.

[46] If you'd like to learn more, I encourage you to explore the project that contains the working examples for the tax calculator. It also contains a transcript of this talk, and references. It's under my Github account, named bdd-for-acs. Feel free to contact me - just remember 'macosgrove' on LinkedIn and Twitter, and @envato.com.
