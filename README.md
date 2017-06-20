# Bink tech-test
a quick challenge to make a website that displays an image search using a colour selected by the user and a random noun and includes some surrounding features.

the original time limit was 24 hours, would have finished well within that but the deadline was moved to allow 20 more, so the extra time was utilized for css.

## installation
Installing a local version isn't easy as you have to configure a CSE from google to run an image search and then also get an APIKEY to go with it.

When you have both create a file called `.env` in the root of the project and fill it with the following, replacing the stuff in []'s

```
GOOGLE_KEY=[your api key]
CX=[your CSE's id code]
```
after this you should just be able to run `rails s` in the console and visit it on a local brower at `localhost:3000`

# usage
When you visit the site you get told what your noun is, you can then click a square to pick a colour.
The site then displays the top 5 results below the colours and gives you a new noun.
At this point you can either search again or click an image to see the full size version at it's original address.
After conducting another search the history box appears below the results box, from here you can rerun searches using the buttons at the side

## heroku deployment
https://ancient-ocean-25028.herokuapp.com/

## things i'd like to keep working on if this idea needed expanding

make main view into partials.

make the boxes apear using js and jquery instead of having to recreate the first view.

install a database.

check for thumbnails from google api instead of getting fullsize images
new font.

## choices made during design
helpers was not tested as it's a single line method that returns a random result.

singleton pattern used to store data for the current session only, as it was the simplest choice available for temporaliy storing data; In the same vien `Response` is used like a row in a database, thus it has a lot of instance vars, again used for simplicity of deployment. Both these smells could be removed by installing a DB, the reason I didn't do so was the "helpful tips" in the briefing "Do not over think your solution, keep it simple & use what you know" and "Avoid creating additional requirements, e.g. persistence between sessions is not stated"

you can click on any image to see the full version - because it was more simple to allow all than to process the first result seperatly.

not using dominant colour as a filter- google search api does not allow the colour red, amongst others. instead the colour is appended onto the search term.

## things to do differently if I started from scratch again
I'd go straight for creating a db next time, The current solution has two codesmells directly related to not having one, and I don't think the jump in complexity would be that great if you don't try matching a new user up to old searches.
