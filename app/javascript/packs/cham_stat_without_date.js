jQuery(function(){
    $('select#leagues').on("change", function(){
        value = $(this).val()
        $.ajax({
            url: "/league/find_by_champ",
            type: "GET",
            cashe: false,
            data: {champ: value},
            success: function(data){
                $('div#tab').html($(data).find("table"))
            }
        })
    })
})