# [Flask Notes](https://flask.palletsprojects.com/en/latest/quickstart/) 

`main.py:`

url for below code is: `http://localhost:5000/sharath/demo/1`

``` py
@app.route("/<name>/<path:subpath>/<int:num>") # url/name/12/23
def greet(name,subpath,num):
    return f"<h3>Hi {name}!!</h3><p>You are {subpath} years old {num}</p>"
```

### passing Mutiple kwargs:

`server.py`
``` py
@app.route("/<userName>")
def userPage(userName):
    jsonData = getDataFromAPI(userName)
    genderData = getGender(userName)
    return render_template("userName.html", userTitle=jsonData["name"],
                           userName=jsonData["name"].title(),
                           ageNo=jsonData["age"], gender= genderData["gender"])
```

👉**keywords should match exactly like above👆 in html👇 page**

`username.html`

``` html
<head>
    <title>{{ userTitle }}</title>
</head>
<body>
    <h1>Hey {{userName}}</h1>
    <h2>I think You are {{gender}}</h2>
    <h3>And you are {{ageNo}} year old</h3>
</body>
```

## creating href anchor tags using jinja

`html`

``` html
<p>
        Look for <a href="{{url_for('blogPost',printNumTerminal = 2)}}">Blog</a>!!!
</p>
    <p>
        allBlogs: <a href="{{url_for('displayAllOfJson')}}">can be found here</a>
    </p>
```

`server.py`

``` py
@app.route("/blog/<printNumTerminal>")
def blogPost(printNumTerminal):
    # some code here


@app.route("/all")
def displayAllOfJson():
    # some code here
```


