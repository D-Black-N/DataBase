jQuery(function(){
    $("#select_year").on("change", function(){
        console.log("OK")
        year = $(this).val()
        $('table tbody tr').each(function(){
            if ($(this).find("td#season") != year){
                $(this).remove()
            }
        })        
    })
})