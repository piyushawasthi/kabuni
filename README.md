# URL Shortener

## Setup

### Go into newly created directory
```
git clone repository
```


```
cd url_shortener
```

### Create & Migrate the DB
```
rake db:create
```

```
rake db:migrate
```

### Run Application
```
rails s
```

### How to use
```
1: Create Signup
2: Create new shortner add target URL= https://www.google.com and click generate
3: Hit localhost:3000/shorten_url it will redirect you on google
4: Come to index page and click on your url
5: Check how many times you visited.
6: To change Base url update URL in application.yml
```

## Thanks