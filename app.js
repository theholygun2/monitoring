
const mysql = require('mysql');
const fs = require('fs');
const util = require('util');

const con = mysql.createConnection({
  host: "localhost",
  user: "dbadmin",
  password: "inidbadmin",
  database: "monitoring"
});


con.connect(function(err) {
  if (err) throw err;
  con.query("SELECT waktu, cpu_usage FROM status", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    var jsonContent = JSON.stringify(result);
    console.log(jsonContent);

    fs.writeFile("cpu_usage.json", jsonContent, 'utf8', function (ddd) {
        console.log("JSON file has been saved.");
    });

  });
});
