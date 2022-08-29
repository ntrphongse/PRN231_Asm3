$(() => {
    $("#orderListBody").html("");

    const userId = $("#memberId").val();
    var url = "https://localhost:44330/api/Orders";
    if (userId !== "Admin") {
        url += "/member/" + userId;
    }

    getApi(
        url,
        "",
        {
            successCallback: (response, textStatus, xhr) => {
                console.log(response);

                if (response.length === 0) {
                    $("#orderListBody").html("No order yet!!");
                }
                else {
                    $.each(response, (listIndex, listValue) => {
                        $("#orderListBody").append($("<tr>"));
                        var appendElement = $("#orderListBody tr").last();

                        appendElement.append($("<td>").html(convertDate(listValue["orderDate"])));
                        appendElement.append($("<td>").html(convertDate(listValue["requiredDate"])));
                        appendElement.append($("<td>").html(convertDate(listValue["shippedDate"])));
                        appendElement.append($("<td>").html(listValue["freight"]));
                        appendElement.append($("<td>").html(listValue["member"]["email"]));

                        if (userId !== "Admin") {
                            appendElement.append(
                                $("<td>").html($("<div>")
                                    .append($("<a>").attr("href",
                                        `../Orders/Details/${listValue["orderId"]}`)
                                        .html("Details")
                                    )
                                )
                            );
                        } else {
                            appendElement.append(
                                $("<td>").html($("<div>")
                                    //.append($("<a>").attr("href",
                                    //    `../Orders/Edit/${listValue["orderId"]}`)
                                    //    .html("Edit")
                                    //)
                                    //.append($("<span>").html(" | "))
                                    .append($("<a>").attr("href",
                                        `../Orders/Details/${listValue["orderId"]}`)
                                        .html("Details")
                                    )
                                    .append($("<span>").html(" | "))
                                    .append($("<a>").attr("href",
                                        `../Orders/Delete/${listValue["orderId"]}`)
                                        .html("Delete")
                                    )
                                ));
                        }


                    });
                }

            },
            errorCallback: (xhr, textStatus, errorThrown) => {
                console.log(xhr);
                $("#errorText").html($("<span>").html(getFirstError(xhr)));
            },
        }
    )

})