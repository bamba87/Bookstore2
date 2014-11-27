// Vänta tills DOM är redo
$(function()
{
	//Alla saker som ska köras när sidan laddats ska vara i denna funktionen
	function siteStartup()
	{
		$('#addBook').submit(addNewBook);
	}
	
	function addNewBook()
	{
    // Ladda inte om sidan när man trycker på knappen
	return false;
	}
	siteStartup();
 });