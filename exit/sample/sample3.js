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

function insertData(){
	
	client.query('INSERT INTO store SET ?',{
		//storeid : 1,
		userId : 2,
		name : 'jans'
		
	}, function(err, rows){
		
		if(err){
			
			console.log('insert Data error');
		}else{
			
			console.log('insert Data ok');
		}
		
	});
}