jQuery(function(){
  $('#leagues').on("change", function(){
    cham_id = $(this).val();
    console.log('first')
    $.ajax({
      url: "/league/matches.json",
      type: "GET",
      cashe: false,
      data: {cham_id: cham_id},
      success: function(data){
        $("select#clubs").empty()
        $("select#clubs").append("<option value=''></option>")
        $.each(data, function(index, value){
          $("select#clubs").append("<option value='" + value.team_id + "'>" + value.name +"</option>")
        })
      } 
    })
  })  
})
