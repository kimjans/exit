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
		deleteData();
	}
	
});

function deleteData(){
	
	client.query('DELETE FROM store WHERE userId = 1', function(err, rows){
		
		if(err){
			
			console.log('delete Data error');
		}else{
			
			console.log('delete Data ok');
		}
		
	});
}