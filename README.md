#Mar's Pet Perference Experiment
### Mario M Sarria Jr 

## Introduction

&nbsp;&nbsp;&nbsp;&nbsp;This is my first [Ruby on Rails](https://rubyonrails.org/) app. I used [Heroku ](https://www.heroku.com/) for deployment and [Git](https://github.com/) for source control. The app attempts to guess if the person is a "dog person" or a "cat person" based on data entered from surveyed users. The app keeps track of the users guess and whether the app was successfull in guessing the user's preference.

## How I did it

&nbsp;&nbsp;&nbsp;&nbsp;I used the following:

### Tools
- [Homebrew](https://Brew.sh/) 
- Git
- MacOS
- Visual Studio Code
- Google Chrome (Dev Mode)

### Resources
- [RailsTutorial](https://RailsTutorial.org/) 
- [Heroku Dev Center](https://devcenter.heroku.com/) 
- [Ruby-Doc.org](https://Ruby-Doc.org/) 
- [TutorialsPoint](https://www.tutorialspoint.com/ruby/)
- [Omni Calculator: Percentage Difference](https://www.omnicalculator.com/math/percentage-difference)
... 
- [Google](https://www.google.com/) 


## Requirements
- Git
- Ruby
- Rails
- PostgreSql Gem
- Bootstrap Sprockets Gem
- Bootstrap
- Heroku CLI

## Guess Logic

&nbsp;&nbsp;&nbsp;&nbsp;I have two kinds of guess, complex and simple. The following is the criteria for the usage of each guess.

| Condition     | Function      | 
| ------------- |:-------------:| 
| < 10 records  | simpleGuess   | 
| < 5% diff     | simpleGuess   | 
| other         | complexGuess  |  

### Simple Guess
&nbsp;&nbsp;&nbsp;&nbsp;The simple guess uses the secure random generator to get two sets of random numbers between 0 and 10. The first number generated is assigned to *catsWin* and the second to *dogsWin*. The highest is the result of the simpleGuess function. 

### Complex Guess
&nbsp;&nbsp;&nbsp;&nbsp;The complex guess uses data from the database. I get the total number of cat lovers and total number of dog lovers for a given height and weight. If the difference between those numbers is less than 5%, I use a simple guess. Otherwise the majority is the guess I take. For example if there are more dog lovers than cat lovers for a particular height and weight, I guess dog lover and vice versa. 
