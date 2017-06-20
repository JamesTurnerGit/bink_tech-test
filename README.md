# Bink tech-test
a quick challenge to make a website that completes and displays an image search using a colour selected by the user and a random noun.

Original time limit was 24 hours, would have finished well within that but the deadline was moved to allow 20 more, so the extra time was utilized.

## heroku deployment
https://ancient-ocean-25028.herokuapp.com/

## things i'd like to keep working on
REMOVE API KEY

make main view into partials.
`googleAPI` should return `Response` objects

check for thumbnails
make it really pretty
new font
"green happiness" on it's own line
max-width for items

## choices made during design
helpers was not tested as it's a single line method that returns a random result.

singleton pattern used to store data for the current session only, simplest choice available.

`Response` is used like a row in a database, thus it has a lot of instance vars, again used for simplicity of deployment.

you can click on any image to see the full version - because it was more simple to allow all than to process the first result seperatly.

not using dominant colour as a filter- google search api does not allow the colour red, amongst others. instead the colour is appended onto the search term.
