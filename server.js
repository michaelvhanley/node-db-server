const { Pool, Client } = require('pg');

// pools will use environment variables
// for connection information
const pool = new Pool(),
cors = require('koa2-cors'),
koa = require('koa');

const app = new koa();

app.use(cors());

app.use(async (ctx) => {
  let [url] = ctx.request.url.split('?'),
      [table, theid] = url.substr(1).split('/').slice(-2);
  let result;

  if(table == 'band'){
    result = await pool.query('select * from bandinfo where id = ' + theid);
  } else {
    result = 'bad url';
  }

  ctx.body = result;
});

app.listen(4001);
