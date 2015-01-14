<html>
<head>
</head>
<body>
 <script src="jquery-2.1.0.min.js"></script>
 <script>
 
function formatKMLForHTML(kml)
{
	var formattedKML = "";
	var tempString = kml;
	
	var index = 0;
	var start = 0;

	var index = tempString.indexOf("<");
	while(index >=0)
	{
		tempString = tempString.replace("<","&lt;");
		start = index+1;
		index = tempString.indexOf("<", start);
	}
	var index = tempString.indexOf(">");
	while(index >=0)
	{
		tempString = tempString.replace(">","&gt;");
		start = index+1;
		index = tempString.indexOf(">", start);
	}

	formattedKML = tempString;
	
	return formattedKML;
}
function cleartext()
{
	//alert('clr');
	document.getElementById("contentSpan").innerHTML = "";
	return;
}
function testAmbushKML()
{
	
	var bbox = "66.25,30.60,66.28,30.65";
	//var bbox = "-180.0,-90.0,180.0,90.0";
	var scale = 50000.0;
	
	var formatJSON = 1;
	var formatKML = 0;
	var pixelWidth = 800;
	var pixelHeight = 600;
	
	//change this to format JSON to see the different output.
	var format = formatKML;
	
	
	//Not meant to be changed on the fly.
	//Let's user choose between 2525Bch2 and 2525C.
	var ms2525Bch2 = 0;
	var ms2525C = 1;
	var symStd = ms2525Bch2;
		
	////////////////////////////////////////////////////////////////////////////////////////
	
	//SECTOR RANGE FAN EXAMPLE USING WEB SERVICE
	//https://localhost:8443/mil-sym-service/test-index.jsp
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//AMBUSH EXAMPLE
	var symbolCode4 = "GHGPSLA-------X";//ambush

	var controlPoints4 = "66.26700036208742,30.62755038706961 66.27555681517738,30.64727776502703 66.25654247497746,30.64632704801704";
	var bbox4 = "66.25,30.60,66.28,30.65";
	//var bbox2 = "-180.0,-90.0,180.0,90.0";
	var scale4 = 50000.0;
	//distance (AM), azimuth (AN), and altitudeDepth (X) can all have multiple values so they are enclosed in brackets.
	var modifiers4 = "";
	
	format = formatKML;
	//format = formatKML;
	var json4;
	
	//get via POST
	var http = new XMLHttpRequest();
	//var url = "http://localhost:8080/mil-sym-service/renderer/mp3d/" + symbolCode4;
	
	//for rendering on 3d google earth//////////////////////////////////////////////////
	format = formatKML;
	var url = "renderer/mp3d/" + symbolCode4;
	var params = BuildParams3D("ID","Name","Description", symbolCode4,controlPoints4, "clampToGround",scale4, bbox4, modifiers4,format,symStd);
	//*///////////////////////////////////////////////////////////////////////////////////////
	
	////////////////////////////////////////////////////////////////////////////////////
	//for rendering on a 2d map
	/*format = formatJSON;
	var url = "renderer/mp2d/" + symbolCode4;
	var params = BuildParams2D("ID","Name","Description", symbolCode4,controlPoints4, pixelWidth, pixelHeight, bbox4, modifiers4,format,0);
	//*///////////////////////////////////////////////////////////////////////////////////////
	document.getElementById("contentSpan").innerHTML += "<br/><br/>Ambush KML:   <br/>";
	callWebService(url, params, format);
}
function testAmbushJSON()
{
	
	var bbox = "66.25,30.60,66.28,30.65";
	//var bbox = "-180.0,-90.0,180.0,90.0";
	var scale = 50000.0;
	
	var formatJSON = 1;
	var formatKML = 0;
	var pixelWidth = 800;
	var pixelHeight = 600;
	
	//change this to format JSON to see the different output.
	var format = formatJSON;
	
	
	//Not meant to be changed on the fly.
	//Let's user choose between 2525Bch2 and 2525C.
	var ms2525Bch2 = 0;
	var ms2525C = 1;
	var symStd = ms2525Bch2;
		
	////////////////////////////////////////////////////////////////////////////////////////
	
	//SECTOR RANGE FAN EXAMPLE USING WEB SERVICE
	//https://localhost:8443/mil-sym-service/test-index.jsp
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//AMBUSH EXAMPLE
	var symbolCode4 = "GHGPSLA-------X";//ambush

	var controlPoints4 = "66.26700036208742,30.62755038706961 66.27555681517738,30.64727776502703 66.25654247497746,30.64632704801704";
	var bbox4 = "66.25,30.60,66.28,30.65";
	//var bbox2 = "-180.0,-90.0,180.0,90.0";
	var scale4 = 50000.0;
	//distance (AM), azimuth (AN), and altitudeDepth (X) can all have multiple values so they are enclosed in brackets.
	var modifiers4 = "";
	
	format = formatJSON;
	
	var json4;
	
	//get via POST
	var http = new XMLHttpRequest();
	//var url = "http://localhost:8080/mil-sym-service/renderer/mp3d/" + symbolCode4;
	
	//for rendering on 3d google earth//////////////////////////////////////////////////
	/*format = formatKML;
	var url = "renderer/mp3d/" + symbolCode4;
	var params = BuildParams3D("ID","Name","Description", symbolCode4,controlPoints4, "clampToGround",scale4, bbox4, modifiers4,format,symStd);
	//*///////////////////////////////////////////////////////////////////////////////////////
	
	////////////////////////////////////////////////////////////////////////////////////
	//for rendering on a 2d map
	format = formatJSON;
	var url = "renderer/mp2d/" + symbolCode4;
	var params = BuildParams2D("ID","Name","Description", symbolCode4,controlPoints4, pixelWidth, pixelHeight, bbox4, modifiers4,format,0);
	//*///////////////////////////////////////////////////////////////////////////////////////
	document.getElementById("contentSpan").innerHTML += "<br/><br/>Ambush JSON:   <br/>";
	callWebService(url, params, format);
}
function testAxisOfAdvance()
{
	var formatJSON = 1;
	var formatKML = 0;
	
	//change this to format JSON to see the different output.
	var format = formatKML;
	
	
	//Not meant to be changed on the fly.
	//Let's user choose between 2525Bch2 and 2525C.
	var ms2525Bch2 = 0;
	var ms2525C = 1;
	var symStd = ms2525Bch2;
		
	////////////////////////////////////////////////////////////////////////////////////////
	
	//SECTOR RANGE FAN EXAMPLE USING WEB SERVICE
	//https://localhost:8443/mil-sym-service/test-index.jsp
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//AOA EXAMPLE
	var symbolCode4 = "GFGPOLAGM-****X";//Axis of Advance Ground Main Attack

	var controlPoints4 = "-96,-68,0 -95.37721031688045,-67.50564676142983,0 -94.80261082916915,-66.8525859524669,0 -95.34501213073854,-67.89145017922694,0";
	var bbox4 = "-99.9198454040672,-68.2537501554183,-91.28311615789315,-65.55725973843599";
	//var bbox2 = "-180.0,-90.0,180.0,90.0";
	var scale4 = 814129.2;
	//distance (AM), azimuth (AN), and altitudeDepth (X) can all have multiple values so they are enclosed in brackets.
	var modifiers4 = "";
	
	format = formatKML;
	//format = formatKML;
	var json4;
	
	//get via POST
	var http = new XMLHttpRequest();
	//var url = "http://localhost:8080/mil-sym-service/renderer/mp3d/" + symbolCode4;
	
	//for rendering on 3d google earth//////////////////////////////////////////////////
	format = formatKML;
	var url = "http://127.0.0.1:6789/mil-sym-service/renderer/mp3d/" + symbolCode4;
	var params = BuildParams3D("ID","Axis of Advance Ground Main Attack","Axis of Advance Ground Main Attack", symbolCode4,controlPoints4, "clampToGround",scale4, bbox4, modifiers4,format,symStd);
	//*///////////////////////////////////////////////////////////////////////////////////////
	
	document.getElementById("contentSpan").innerHTML += "<br/><br/>Axis of Advance KML:   <br/>";
	callWebService(url, params, format);
}
function testRangeFan()
{

	var bbox = "66.25,30.60,66.28,30.65";
	//var bbox = "-180.0,-90.0,180.0,90.0";
	var scale = 50000.0;
	
	var formatJSON = 1;
	var formatKML = 0;
	var pixelWidth = 800;
	var pixelHeight = 600;
	
	//change this to format JSON to see the different output.
	var format = formatJSON;
	
	
	//Not meant to be changed on the fly.
	//Let's user choose between 2525Bch2 and 2525C.
	var ms2525Bch2 = 0;
	var ms2525C = 1;
	var symStd = ms2525Bch2;
		
	////////////////////////////////////////////////////////////////////////////////////////
	
	//SECTOR RANGE FAN EXAMPLE USING WEB SERVICE
	//https://localhost:8443/mil-sym-service/test-index.jsp
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	var symbolCode4 = "GFFPAXS---****X"; //sector range fan

	var controlPoints4 = "66.26700036208742,30.62755038706961";
	var bbox4 = "66.25,30.627,66.27,30.63";//whole symbol will be calculated
	//var bbox2 = "-180.0,-90.0,180.0,90.0";
	var scale4 = 50000.0;
	//distance (AM), azimuth (AN), and altitudeDepth (X) can all have multiple values so they are enclosed in brackets.
	var modifiers4 = "{\"AM\":[3000,10000],\"AN\":[315,45],\"X\":[0]}";
	
	format = formatKML;
	//format = formatKML;
	var json4;
	
	
	//var url = "http://localhost:8080/mil-sym-service/renderer/mp3d/" + symbolCode4;
	
	//for rendering on 3d google earth//////////////////////////////////////////////////
	format = formatKML;
	var url = "renderer/mp3d/" + symbolCode4;
	var params = BuildParams3D("ID","Name","Description", symbolCode4,controlPoints4, "clampToGround",scale4, bbox4, modifiers4,format,0);
	//*///////////////////////////////////////////////////////////////////////////////////////
	
	////////////////////////////////////////////////////////////////////////////////////
	//for rendering on a 2d map
	/*format = formatJSON;
	var url = "renderer/mp2d/" + symbolCode4;
	var params = BuildParams2D("ID","Name","Description", symbolCode4,controlPoints4, pixelWidth, pixelHeight, bbox4, modifiers4,format,0);
	//*///////////////////////////////////////////////////////////////////////////////////////
	document.getElementById("contentSpan").innerHTML += "<br/><br/>Sector Range Fan:   <br/>";
	callWebService(url, params, format);
}

function callWebService(url, params, format){

	var formatJSON = 1;
	var formatGeoJSON = 2;
	var formatKML = 0;
	//get via POST
	var http = new XMLHttpRequest();
	http.open("POST",url,true);

	//First 2 header lines critical!
	http.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8,");
	http.setRequestHeader("Content-length",params.length);
	//Not sure about this line
	http.setRequestHeader("Connection","Close");
	
	
	http.onreadystatechange = function(){
		if(http.readyState === 4 && http.status === 200){
		
			json4 = http.responseText;
			
			
			document.getElementById("contentSpan").innerHTML += "<br/>" + http.getAllResponseHeaders() + "<br/>";
			if(format == formatJSON)
			{
				document.getElementById("contentSpan").innerHTML += "JSON Format:<br/>";
				if (json4 == null || json4 == "")
					document.getElementById("contentSpan").innerHTML += "json empty";
				else
				{
					document.getElementById("contentSpan").innerHTML += json4;
				}
			}
			else if(format == formatGeoJSON)
			{
				document.getElementById("contentSpan").innerHTML += "GeoJSON Format:<br/>";
				if (json4 == null || json4 == "")
					document.getElementById("contentSpan").innerHTML += "geojson empty";
				else
				{
					document.getElementById("contentSpan").innerHTML += json4;
				}
			}
			else// if formated as KML
			{
				document.getElementById("contentSpan").innerHTML += "KML Format:<br/>";
				//the following is just so you can view the KML properly on the html page.
				//this isn't something you'd normally do.
				if (json4 == null || json4 == "")
					document.getElementById("contentSpan").innerHTML += "kml empty";
				else
				{
					var formattedKML = "";
					formattedKML = formatKMLForHTML(json4);
					
					document.getElementById("contentSpan").innerHTML += formattedKML;
					//document.getElementById("XMLHolder").innerHTML +=  json;//parseXMLString(json);
				}
			}
		}
		else if(http.readyState === 4 && http.status === 406){
			document.getElementById("contentSpan").innerHTML += "<br/><br/>Error 406<br/>";
			document.getElementById("contentSpan").innerHTML += http.getAllResponseHeaders() + "<br/>";
		}
		else
		{
			document.getElementById("contentSpan").innerHTML += "<br/>readystate: " + httpReadyStateToString(http.readyState);
			//document.getElementById("contentSpan").innerHTML += " - status: " + http.status; -->//IE no likey
		}
		
		
	}
	http.send(params);
		
	//////////////
	
	
	////////////////////////////////////////////////////////////////////////////////////////
	

}

function httpReadyStateToString(status)
{
	if(status===0)
		return "request not initialized";
	else if(status===1)
		return "server connection established";
	else if(status===2)
		return "request received";
	else if(status===3)
		return "processing request";
	else if(status===4)
		return "request finished and response is ready";
	else
		return "unknown status: " + status;
}
function BuildParams3D(id, name, description, symbolID, points, altitudeMode, scale, bbox, modifiers, format, symstd)
{
	var paramString = "";
	paramString += "ID=" + encodeURIComponent(id);
	paramString += "&NAME=" + encodeURIComponent(name);
	paramString += "&DESCRIPTION=" + encodeURIComponent(description);
	paramString += "&SYMBOLID=" + encodeURIComponent(symbolID);
	paramString += "&CONTROLPOINTS=" + encodeURIComponent(points);
	paramString += "&ALTITUDEMODE=" + encodeURIComponent(altitudeMode);
	paramString += "&SCALE=" + encodeURIComponent(scale);
	paramString += "&BBOX=" + encodeURIComponent(bbox);
	paramString += "&MODIFIERS=" + encodeURIComponent(modifiers);
	paramString += "&FORMAT=" + encodeURIComponent(format);
	paramString += "&SYMSTD=" + encodeURIComponent(symstd);
	return paramString;
}
function BuildParams2D(id, name, description, symbolID, points, pixelWidth, pixelHeight, bbox, modifiers, format, symstd)
{
	var paramString = "";
	paramString += "ID=" + encodeURIComponent(id);
	paramString += "&NAME=" + encodeURIComponent(name);
	paramString += "&DESCRIPTION=" + encodeURIComponent(description);
	paramString += "&SYMBOLID=" + encodeURIComponent(symbolID);
	paramString += "&CONTROLPOINTS=" + encodeURIComponent(points);
	paramString += "&PIXELWIDTH=" + encodeURIComponent(pixelWidth);
	paramString += "&PIXELHEIGHT=" + encodeURIComponent(pixelHeight);
	paramString += "&BBOX=" + encodeURIComponent(bbox);
	paramString += "&MODIFIERS=" + encodeURIComponent(modifiers);
	paramString += "&FORMAT=" + encodeURIComponent(format);
	paramString += "&SYMSTD=" + encodeURIComponent(symstd);
	return paramString;
}
function getKML(dimension)
{
	
	var bbox = $("#bboxlonll").val() + ","  + $("#bboxlatll").val() + "," + $("#bboxlonur").val() + ","  + $("#bboxlatur").val();;
	var scale = $("#scale").val();
	var pixelWidth = $("#pixelWidth").val();
	var pixelHeight = $("#pixelWidth").val();
	
	var formatJSON = 1;
	var formatKML = 0;
	var format = $("#format").val();
	
	
	//Not meant to be changed on the fly.
	//Let's user choose between 2525Bch2 and 2525C.
	var ms2525Bch2 = 0;
	var ms2525C = 1;
	var symStd = $("#standard").val();
		

	var symbolCode = $("#symbolCode").val(); //"GHGPSLA-------X";//Ambush
	var modifiers = $("#modifiers").val();

	//var controlPoints4 = "66.26700036208742,30.62755038706961 66.27555681517738,30.64727776502703 66.25654247497746,30.64632704801704";
	//var bbox4 = "66.25,30.60,66.28,30.65";
	var controlPoints = $("#cclon0").val() + "," + $("#cclat0").val();
	controlPoints += " " + $("#cclon1").val() + "," + $("#cclat1").val();
	if ($("#cclon2").val() != "") {
		controlPoints += " " + $("#cclon2").val() + "," + $("#cclat2").val();
	}
	if ($("#cclon3").val() != "") {
		controlPoints += " " + $("#cclon3").val() + "," + $("#cclat3").val();
	}

	
	
	
	
	//for rendering on 3d google earth//////////////////////////////////////////////////
	var url = "renderer/mp3d/" + symbolCode;
	if(dimension === 3)
		var params = BuildParams3D("ID","Name","Description", symbolCode,controlPoints, "clampToGround",scale, bbox, modifiers,format,symStd);
	else
		var params = BuildParams2D("ID","Name","Description", symbolCode,controlPoints, pixelWidth, pixelHeight, bbox, modifiers,format,symStd);
	<!-- document.getElementById("contentSpan").innerHTML += "<br/><br/>Ambush KML:   <br/>"; -->
	callWebService(url, params, format);
}

	</script>

	<form>
		MILSTD2525 Symbol Code:<input type="text" id="symbolCode" value="GHGPGAA---****X"/><br>
		Bounding Box <br>
		Lower Left Longitude:<input type="number" id="bboxlonll" value="66.25" step="any">,
		Lower Left Latitude:<input type="number" id="bboxlatll" value="30.60" step="any"><br>
		Upper Right Longitude:<input type="number" id="bboxlonur" value="66.28" step="any">,
		Upper Right Latitude:<input type="number" id="bboxlatur" value="30.65" step="any"><br>
		<p>Control Points<br>
		Lon <input type="number" step="any" value="66.26700036208742" id="cclon0">, Lat <input type="number" value="30.62755038706961" id="cclat0" step="any"><br> 
		Lon <input type="number" step="any" value="66.27555681517738" id="cclon1">, Lat <input type="number" id="cclat1" value="30.64727776502703" step="any"><br>
		Lon <input type="number" step="any" value="66.25654247497746" id="cclon2">, Lat <input type="number" id="cclat2" value="30.64632704801704" step="any"><br>		
		Lon <input type="number" step="any" id="cclon3">, Lat <input type="number" id="cclat3" step="any"><br>		
		<p>
		scale <input type="number" id="scale" value="50000.0" step="any"/> (for 3D)<br>
		pixel width <input type="number" id="pixelWidth" value="800"/ step="any"> (for 2D)<br>
		pixel hight <input type="number" id="pixelHeight" value="600"/ step="any"> (for 2D)<br>
		Symbology Standard <select id="standard">
							<option value="1">2525C</option>
							<option value="0">2525B</option>
						   </select>
 	   Output Format <select id="format">
							<option value="0">KML</option>
							<option value="2">GeoJSON</option>
							<option value="1">JSON</option>
							</select><br>
		Modifiers (formatted like: {"T":"NAME","H":"H","fillColor":"80ff0066","lineColor":"ff00ff00","W":"W1","W1":"W2","AM":[40000,60000],"AN":[0,170,50,120],"X":[200,27000]} )<br>
		<input type="text" id="modifiers" value="" size="100"/><br>
		
		<p>
		<button type='button' onclick='getKML(3)'>Call 3D web service</button>
		<button type='button' onclick='getKML(2)'>Call 2D web service</button>
	</form>
	<p>
    <button type='button' onclick='testRangeFan()'>Test Sector Range Fan</button>
	<button type='button' onclick='testAmbushKML()'>Ambush KML</button>
	<button type='button' onclick='testAmbushJSON()'>Ambush JSON</button>
	<button type='button' onclick='testAxisOfAdvance()'>Axis of Advance</button>
	<button type='button' onclick='cleartext()'>Clear</button>
	
   <span id='contentSpan'/>
   
   
   

</body>

</html>