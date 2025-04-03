# Holden's Custom TTS Dune Uprising Script

Modified variant of the TTS Dune Uprising script.
Mainly modified to report game stats for personal use.

I modify the rank game stat uploading functions to do this.
I disable the rank server communication but keep the stats being
sent to a google form. However, we need to create the form from scratch.

To play this, just play 4 players ranked with the `Bloodlines....json` as a save file.

To see your data, go to the spreadsheet at https://holden.li/dune

## Creating the Google Form

Instead of doing it by hand, I call the `batchUpdate` function for a new empty form.
There is a json request included as an example.

I just plug in the request into the (Google Playground)[https://developers.google.com/oauthplayground/].

Note: I set the ids of the items and questions so this process is relatively deterministic.

## Encoding and Decoding the Script

You can use the TTS Atom plugin I guess but I don't want to install it
so I just modify the save file directly.

Extract and decode lua script from TTS JSON:

```
cat '.\Bloodlines Ranked 4.1.json' | jq -r [.LuaScript] > holden.lua
```

Convert script to JSON string:

```
cat holden.lua | jq -R --slurp > holden.lua.json
```

Then I just copy paste the encoded value into the save/json but there's probably a
jq query to do that.

## Modifying the Script

First I disable all calls to the rank server.

I point `GOOGLE_DOC_URL` to a new URL and set the fields. There isn't
a real public API for this so we have to capture the POST request being sent and
make that call in the lua script. Note: the prefill feature will generate a similar
URL with GET params.

There is the full lua script included as an example.

TODO: implement a diff so we can patch into new versions of the script.

## Data Science

Google Forms can ingest the data into a Google Sheet. Then we do annoying Excel-like functions
to generate visualizations.
