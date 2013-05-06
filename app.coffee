
###
Module dependencies.
###
express = require("express")
routes = require("./routes")
user = require("./routes/user")
http = require("http")
path = require("path")
app = express()

# all environments
app.set "port", process.env.PORT or 3000
app.set "views", __dirname + "/views"
app.set "view engine", "jade"
app.use express.favicon()
app.use express.logger("dev")
app.use express.bodyParser()
app.use express.methodOverride()
app.use express.cookieParser("your secret here")
app.use express.session()
app.use app.router
app.use require("less-middleware")(src: __dirname + "/public")
app.use express.static(path.join(__dirname, "public"))

# complie coffeescript to js on the fly
app.use require('connect-coffee-script') 
  src:  __dirname + '/public'
  dest: __dirname + '/.public'
app.use express.static(path.join(__dirname, ".public"))

# development only
app.use express.errorHandler()  if "development" is app.get("env")

app.get "/", routes.index
app.get "/users", user.list

server = http.createServer(app)
io = require("engine.io").attach(server)

io.on  "connection", (socket) ->
    socket.on "message", (v) ->
        socket.send "pong"


server.listen app.get("port"), ->
    console.log "Express server listening on port " + app.get("port")
