## Note from Matthew 
I created several helper functions that could be resused with tests. I ran into some configuration issues putting these in their own file, and so resorted to copying them into each test case in which they were used. Ordinarily I would have gone to a coworker who had more experience with configuring the elixir files for this, or added them to a pre-existing helper file, since I assume one most likely already exists.  


## Elixir SDET homework assigment

- Choose at least 3 three of the options in the list on https://the-internet.herokuapp.com/, and automate at least one test case for each option.
- Bonus: Choose at least 1 request from https://reqres.in/ and write at least one api test for that request (double bonus if this is done in elixir, in the same project as the browser automation portion.)

Hint:
This challenge is to showcase your skill, so it is recommended to spend time your time showcasing coding skills, rather than the quantity of tests that you write.

- When finished, submit the challenge as a github link from your personal github (please keep the name of the repo as "homework")


## Getting Up and Running

- Download the latest version of chromedriver and ensure that your version of chrome is up to date as well
- Run chromedriver
- In a different terminal window or tab, cd into the homework project and you can now execute the command "mix test" and it will run all of the test files in the "test" folder


