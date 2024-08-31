# [Flask Notes](https://flask.palletsprojects.com/en/latest/quickstart/) 

`main.py:`

url for below code is: `http://localhost:5000/sharath/demo/1`

``` py
@app.route("/<name>/<path:subpath>/<int:num>") # url/name/12/23
def greet(name,subpath,num):
    return f"<h3>Hi {name}!!</h3><p>You are {subpath} years old {num}</p>"
```


