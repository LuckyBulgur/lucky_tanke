let ressource_name = "lucky_tanke";

$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function (event) {
        if (event.data.type === "ui") {
            ressource_name = event.data.name;
            $(".bill").text("$0");
            if (event.data.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
        else if (event.data.type == "anzahl") {
            $(".percentage").text(event.data.current + " L");
            $(".circle").attr("stroke-dasharray", event.data.current + ", 100")
            if (event.data.current > "99.9") {
                $(".submit").show();
                $(".close").hide();
                $(".suuui").hide();
            }
        }
        else if (event.data.type == "bill") {
            $(".bill").text("$" + event.data.bill);
        }
    })
    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post(`http://${ressource_name}/exit`, JSON.stringify({}));
            return
        }
    };
    $("#close").click(function () {
        $.post(`http://${ressource_name}/exit`, JSON.stringify({}));
        return
    })
    //when the user clicks on the submit button, it will run
    $("#submit").click(function () {
        $(".bill").text("$0");
        // if there are no errors from above, we can send the data back to the original callback and handle it from ther
        $.post(`http://${ressource_name}/main`, JSON.stringify({

        }));
        return;
    })
})
