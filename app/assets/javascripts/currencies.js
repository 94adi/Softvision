$(document).ready(function(){
    
  var chart;
  var previous_data = null;
  var current_data = null;
  var first_load = true;
  
    setInterval(function(){
    $.getJSON("currencies/get_currency_data", function(data){
        current_data = JSON.stringify(data);
    if(first_load == true)
    {
        chart = c3.generate({
          data: {
              columns: data['stats'],
              type : 'donut'
          },
          donut: {
              title: "My Currencies"
          }
      });
      first_load = false;
    }
    else
    {
        if(previous_data !== current_data)
        {
          chart.load({ columns: data['stats'] })
        }
    }
    previous_data = JSON.stringify(data);
    console.log(previous_data);
    });
  }, 2000); 
});