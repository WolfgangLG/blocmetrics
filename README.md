# Blocmetrics README

This README documents the Blocmetrics projects and denotes important information

Things I plan to cover in this README:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* JavaScript snippet

## JavaScript Snippet
Include this JavaScript snippet in any application you would like to track using Blocmetrics

```javascript
var blocmetrics = {};
blocmetrics.report = function(eventName) {
  // #1 Create an event JSON object to send to the Blocmetrics analytics service.
  var event = {event: { name: eventName }};
  // #2 Initialize a new XMLHttpRequest() (AJAX request)
  var request = new XMLHttpRequest();
  // #3 Set the HTTP method to POST, the url of our events endpoint, and allow the request to run asynchronously.
  request.open("POST", "http://localhost:3000/api/events", true);
  // #4 Set the request Content-Type header to 'application/json'. Without that, the API::EventsController would not know to process the request as JSON.
  request.setRequestHeader('Content-Type', 'application/json');
  // #5 Send the request
  request.send(JSON.stringify(event));
}
```
