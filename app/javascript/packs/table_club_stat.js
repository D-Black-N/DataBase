jQuery(function(){
    $('select#clubs').on("change", function(){
        club = $(this).val()
        league = $("select#leagues").val()
        $.ajax({
            url: '/league/find_club_stat',
            type: "GET",
            data: {champ: league, team: club},
            success: function(html){
                $("div#info").html($(html).find("table"))
            }
        })
    })
})