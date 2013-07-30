/**
 * New node file
 */
var mysql = require('mysql');

var client = mysql.createConnection({
	
	host : 'localhost',
	port : '3306',
// DB 및 USER / ID 변경
	user : 'exit',
	password : 'test',
	database : 'exit_proj' 
	
	
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
// PRIMARY-KEY 이므로 다시 추가시 에러 발생 가능성 농후	
	client.query('INSERT INTO user SET ?',{
		//storeid : 1,
		email: 'shai0827@gmail.com',
		nick: 'shai',
		level : 1
		
	}, function(err, rows){
		
		if(err){
			
			console.log('insert Data error');
		}else{
			
			console.log('insert Data ok');
		}
		
	});
}