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
		updateData();
	}
	
});

function updateData(){
	
	client.query('UPDATE store SET ? WHERE userId = 1',{
		//storeid : 1,
		name : 'jans222'
		
	}, function(err, rows){
		
		if(err){
		
			console.log('update Data error');
		}else{
			
			console.log('update Data ok');
		}
		
	});
}