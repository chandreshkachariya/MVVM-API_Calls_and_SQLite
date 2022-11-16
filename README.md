# MVVM-API_Calls_and_SQLite

The Demo is related to <b>API Calls and SQLite. </b>

Note:
The below tasks are easily understandable for a Core developer


I am describing the Demo details below:

<b>Part 1:</b>

Call the below <b>API:</b>
https://dev.virtualearth.net/REST/v1/LocalSearch/?query=hospital&userLocation=47.602038,-122.333964&key=AthpKc52wjrCVUd51hK2qrPCe7OE4BP8rfkzsYHlWDBZdAopJH7af7uptSgIb7qs

Store the following details in the <b>local SQLite Database:</b>
name
latitude
longitude
full address
website
phonenumber

Fetch the details from <b>SQLite</b> and create a list view to show the following details:
Name of the hospital
Visit Website button
View on Map button

Pressing on the “Visit Website” button will open the Default web browser with the URL of the hospital.

The “View on Map” button will open another page that will add a pinpoint of the hospital over the Map

Every time the application is launched, it should delete all the previous data from SQLite, call the API, insert the data and then show the data over the list view.


<b>Part 2:</b>

Add another button named: <b>“View Images”</b> on the top right corner of the navigation bar.
On press of the same, open a page and call the below API:

https://api.giphy.com/v1/gifs/search?api_key=zkO0WivfBA8I5i4mLOpuW8WZIZMImzI5&q=dog&limit=50&offset=0&rating=g&lang=en

Display the <b>Animating GIF Images</b> in a Grid View of 3 Columns



<b>Part 1:</b> <br />
![Simulator Screen Shot - iPhone 14 Pro - 2022-11-16 at 17 44 56](https://user-images.githubusercontent.com/40895111/202178819-a9209e50-b4b9-45c4-9415-aeb016943773.png)


<b>Part 2: Load Gif: </b><br />
![Simulator Screen Shot - iPhone 14 Pro - 2022-11-16 at 17 45 46](https://user-images.githubusercontent.com/40895111/202178854-152cab3f-8583-4735-9868-fc1366ec3604.png)

