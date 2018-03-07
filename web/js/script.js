$.get("/api/json", function(data, state, xhr){
  console.log(data, data.id);
})

$.getJSON("/api/json", function(data, state, xhr){
  console.log(data, data.id);
})

$.getScript("/api/script", function(script, state, xhr){
  console.log(script);
})

$("#ajaxLoad").load("/api/html", function(){
  console.log(arguments);
});
