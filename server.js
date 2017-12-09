const { Pool, Client } = require('pg');

// pools will use environment variables
// for connection information
const pool = new Pool(),
serve = require('koa-static');
cors = require('koa2-cors'),
koa = require('koa');

const app = new koa();
app.use(serve('./pages/'));
app.use(cors());

app.use(async (ctx) => {
  let [url] = ctx.request.url.split('?'),
      [table, theid] = url.substr(1).split('/').slice(-2);
  let result;

  // For a small measure of security, block table names that
  // aren't a single word or IDs that aren't integers.
  if ( ! table.match(/^[a-zA-Z0-9_]+$/) ) {
    throw "Not a valid table name: " + table;
  }

  theid = parseInt(theid, 10);
  if(theid == 0){
    result = await pool.query('select * from ' + table);
  } else {
    result = await pool.query('select * from ' + table + ' where id = ' + theid);
  }

  ctx.body = result;
});

app.listen(4001);
