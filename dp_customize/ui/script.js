window.addEventListener('message', function(event) {
	var item = event.data;

	if (item.status == true){
		$("#container").show();
	}
	else if (item.status == false){
    $("#container").fadeOut();
	}

});

function Luk(){
	$("#container").fadeOut();
	$.post("http://dp_customize/Luk");
}

/* Prim farver */

function farve1(){
	$.post("http://dp_customize/farve1");
}

function farve2(){
	$.post("http://dp_customize/farve2");
}

function farve3(){
	$.post("http://dp_customize/farve3");
}

function farve4(){
	$.post("http://dp_customize/farve4");
}

function farve5(){
	$.post("http://dp_customize/farve5");
}

function farve6(){
	$.post("http://dp_customize/farve6");
}

function farve7(){
	$.post("http://dp_customize/farve7");
}

function farve8(){
	$.post("http://dp_customize/farve8");
}

function farve9(){
	$.post("http://dp_customize/farve9");
}

function farve10(){
	$.post("http://dp_customize/farve10");
}