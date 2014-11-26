// Vänta tills DOM är redo
$(function(){ 
	$('#addBook').submit(addNewBook);	
	function addNewBook(){
    // Ladda inte om sidan när man trycker på knappen
	return false;
 
 	}); 
});