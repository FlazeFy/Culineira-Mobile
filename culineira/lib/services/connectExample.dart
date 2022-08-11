import 'package:postgres/postgres.dart';

setDatabase() async{
  var connection = PostgreSQLConnection(
    "...", 
    5432,                                                                               
    "...",                                                         
    username: "...",   
    password: "...",
    useSSL: true
  );
  await connection.open();
  return connection;
}
