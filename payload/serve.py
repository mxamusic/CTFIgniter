# do not modify this file since we are deploying it to Nginx, sockets will be used.

from CTFd import create_app
app = create_app()
app.run(debug=True, host="0.0.0.0", port=4000)
