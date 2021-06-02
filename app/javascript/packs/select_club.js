jQuery(function(){
  $('select#clubs').on("change", function(){
    club_id = $(this).val()
    cham_id = $("#leagues").val()
    $.ajax({
      url: "/league/matches",
      type: "GET",
      data: {cham_id: cham_id, team: club_id},
      cashe: false,
      success: function(html){
        $("div#tab").html($(html).find("div#tab"))
      }
    })
  })
})

