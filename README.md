# MVVM-API_Calls_and_SQLite

The Demo is related to API Calls and SQLite. 

Note:
The below tasks are easily understandable for a Core developer


I am describing the Demo details below:
Part 1:
Call the below API:
https://dev.virtualearth.net/REST/v1/LocalSearch/?query=hospital&userLocation=47.602038,-122.333964&key=AthpKc52wjrCVUd51hK2qrPCe7OE4BP8rfkzsYHlWDBZdAopJH7af7uptSgIb7qs

Store the following details in the local SQLite Database:
name
latitude
longitude
full address
website
phonenumber

Fetch the details from SQLite and create a list view to show the following details:
Name of the hospital
Visit Website button
View on Map button

Pressing on the “Visit Website” button will open the Default web browser with the URL of the hospital.

The “View on Map” button will open another page that will add a pinpoint of the hospital over the Map

Every time the application is launched, it should delete all the previous data from SQLite, call the API, insert the data and then show the data over the list view.


Part 2:
Add another button named: “View Images” on the top right corner of the navigation bar.
On press of the same, open a page and call the below API:

https://api.giphy.com/v1/gifs/search?api_key=zkO0WivfBA8I5i4mLOpuW8WZIZMImzI5&q=dog&limit=50&offset=0&rating=g&lang=en

Display the Animating GIF Images in a Grid View of 3 Columns


