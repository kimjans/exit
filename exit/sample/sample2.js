/**
 * New node file
 */
var mysql = require('mysql');

var client = mysql.createConnection({
	
	host : 'localhost',
	port : '3306',
	user : 'ryu',
	password : 'ryu',
	database : 'user'
	
	
});
client.connect(function(err){
	
	if(err){
		
		console.log( 'err');
	}else{
		
		console.log('ok');
		insertData();
	}
	
});

function createTable(){
	
	client.query('CREATE TABLE store (storeid INT(11) AUTO_INCREMENT, userid INT(11), name TEXT, PRIMARY KEY(storeid))', function(err, rows){
		
		if(err){
			console.log('create table error');
		}else{
			
			console.log('create table ok');
		}
		
	});
}