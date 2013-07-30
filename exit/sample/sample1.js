/**
 * New node file
 */
var mysql = require('mysql');

var client = mysql.createConnection({
	
	host : 'localhost',
	port : '3306',
	user : 'ryu',
	password : 'ryu'
	
	
});
client.connect(function(err){
	
	if(err){
		
		console.log( 'err');
	}else{
		
		console.log('ok');
		createDatabase();
	}
	
});

function createDatabase(){
	
	client.query('CREATE DATABASE user', function(err, rows){
		
		if(err){
			console.log('create table error');
		}else{
			
			console.log('create success');
		}
		
	});
}