---
title: /people/:id
position: 1.3
type: get
description: Get Person
right_code: |
  ~~~ json
  {
    "id": 3,
    "title": "Seita",
    "gender": "Female",
    "film": "Grave of the Fireflies"
  }
  ~~~
  {: title="Response" }

  ~~~ json
  {
    "error": true,
    "message": "Person doesn't exist"
  }
  ~~~
  {: title="Error" }
---

Returns a specific person

~~~ javascript
$.get("http://api.myapp.com/person/3", {
  token: "YOUR_APP_KEY",
}, function(data) {
  alert(data);
});
~~~
{: title="jQuery" }
