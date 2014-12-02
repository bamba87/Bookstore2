// Vänta tills DOM är redo
$(function()
{
	//Globala variabler som ska kunna nås från alla functions
	var requestData = {
		sql: "sql/questions.sql"
	};
	var currentSortInfo = {};
	var outCart = [];

	//Alla saker som ska köras när sidan laddats ska vara i denna funktionen
	function siteStartup()
	{
		$("section.pop-up").hide();
		$(".addNewBookButton").click(addNewBookButtonClick);
		$(".pop-up div.close-button").click(popUpCloseButtonClick);
		$('#addBook').submit(addNewBook);
	}
	
	//Denna funktionen tar emot ett object med infon till den svarta lådan och den tar också emot funktionen som ska köras efteråt.
	//
	//En bra sak att veta är att när du lägger in en funktion i inparametern "successFunction" är att du ska INTE skriva "doStuff()" utan "doStuff"
	//annars kommer den försöka kalla på "doStuff" direkt innan du kallar på "contactDatabase" med andra ord: inte bra.
	function contactDatabase(request, successFunction)
	{
		$.ajax({
			url:"libs/sql-ajax-json.php",
			dataType: "json",
			data: request,
			success: successFunction
		});
	}

	function addNewBook()
	{
    // Ladda inte om sidan när man trycker på knappen
	return false;
	}

	function addNewBookButtonClick()
	{
		$("section.pop-up.add-book").fadeToggle(150);
	}

	function popUpCloseButtonClick()
	{
		$("section.pop-up").fadeToggle(150);
	}

	siteStartup();
 });