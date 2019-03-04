$(".app-button").click(function(e) {

    var n = parseFloat($(".app-input").val());

    worksheet.execute_code({
        code: "salvus.data['n'] * random()",
        data: {n:n},
        preparse: false,
        cb : function(mesg) {
            console.log(mesg);
            if (mesg.stdout) {
                $(".app-output").append(mesg.stdout);
            }
        }
    })
})
