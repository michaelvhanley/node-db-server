# node-db-server
A quick way to expose your database to your web application

This code is a node app that creates a server that can connect to a database that you specify, and run queries.  

1. You really want to watch the chat from Thursday, November 30th, 2017. We built this thing during that chat, and I explain why it works, and all the steps.  You can work along with the video if you want, or just use this bit if code as a starting point.

2. You'll need to install some packages if you don't already have them. At the command line:
npm install pg
npm install koa
npm install koa2-cors

3. You'll have to have a database already running on your computer, for this app to connect to.  On line 19 you see a sample Select query that I wrote, because I have a table named bandinfo. Make your own queries that match your database.

4. To RUN this server, you need to tell node about your database connection.  At the command line, in the director where this code is running, type:
PGUSER=[your database user]   PGHOST=localhost   PGPASSWORD=[your db password]   PGDATABASE=[your database name] node server.js

5. Here's how it works: You go to http://localhost:4001/bandinfo/3, for example, and the code in its current state will run a query that does "select * from bandinfo where id = 3".  Make sure you make the queries match your own DB, and that the variables above are correct. When you get it all set up, you should see data in the browser.

6. You can run ANY kind of Select you want, though.  What if you don't want only 1 record? You could edit this code and have it run any query you want, based on whatever value you put in the URL.  ctx.request.url tells you what the URL is, and you can check it and run the proper query. This allows you to put all the queries you need for your web application into a single pgae of code here.


7. Now you have made an API that talks to your database.  You know how to connect to APIs with Javascript, right? 
