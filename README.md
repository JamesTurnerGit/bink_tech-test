# Bink tech-test
a quick challenge to make a website that displays an image search using a colour selected by the user and a random noun and includes some surrounding features.

## installation
Installing a local version isn't easy as you have to configure a CSE from google to run an image search and then also get an APIKEY to go with it.

When you have both create a file called `.env` in the root of the project and fill it with the following, replacing the stuff in []'s

```
GOOGLE_KEY=[your api key]
CX=[your CSE's id code]
```
after this you should just be able to run `rails s` in the console and visit it on a local brower at `localhost:3000`

## usage
When you visit the site you get told what your noun is, you can then click a square to pick a colour.
The site then displays the top 5 results below the colours and gives you a new noun.
At this point you can either search again or click an image to see the full size version at it's original address.
After conducting another search the history box appears below the results box, from here you can rerun searches using the buttons at the side

## heroku deployment
https://ancient-ocean-25028.herokuapp.com/

## things i'd like to keep working on if this idea needed expanding

split the index view into partials.

manipulate the main view using js and jquery instead of going through redirects to update. could keep the required data in JS objects.

check for thumbnails from google api instead of getting fullsize images.

## choices made during design
the single helper is not tested as it's a single line method that returns a random result.

the singleton pattern was used to store data for the current session only, as it was the simplest choice available for quickly storing and retrieving data. this has led to the side effect of sharing the searches across all users - as this isn't against the brief it was kept in.

you can click on any image to see the full version - because it was more simple to allow all than to process the first result separately.

not using dominant colour as a filter- Google search API does not allow the colour red, amongst others. instead, the colour is appended onto the search term.

## things i'd do differently starting from scratch

In this exact challenge since it looks like it's mainly the ruby being judged and not the project as a whole I'd implement a database from the start.

on the other hand; with a less metric driven and ruby based briefing - I'd definatly go the JS route for data-storage, it's got the advantage of not clogging up the server with needless data to be cleaned and makes for a much smoother user experience.
