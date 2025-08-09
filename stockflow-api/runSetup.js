const fs = require('fs');
const sqlite3 = require('sqlite3').verbose();

const db = new sqlite3.Database('./data.sqlite3');
const setupSQL = fs.readFileSync('./setup.sql', 'utf8');

db.exec(setupSQL, (err) => {
  if (err) {
    console.error('❌ Error executing setup.sql:', err.message);
  } else {
    console.log('✅ Database setup complete!');
  }
  db.close();
});
