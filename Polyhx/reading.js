

 var json = $.getJSON("points.json");
 var data = eval("(" +json.responseText + ")");
 document.write(data["a"]);