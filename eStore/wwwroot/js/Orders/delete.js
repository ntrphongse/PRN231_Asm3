$(() => {
    const orderId = getUrlId();
    if (!orderId) {
        $("#btnDelete").hide();
        //$("form").hide();
        //$("#orderProductsDetails").hide();
        $("#errorText").append($("<span>").html("Order id not specified!!!"));
    } else {
        getApi(
            `https://localhost:44330/api/Orders/${orderId}`,
            "",
            {
                successCallback: (response, textStatus, xhr) => {
                    displayOrderInformation(response, "#orderDetails");
                    displayOrderDetails(response.orderDetails, "#orderProductsDetails");


                    //$("#detailsAction").html("");
                    //$("#detailsAction")
                    //    .append($("<a>").attr("href",
                    //        `/Products/Edit/${response.productId}`)
                    //        .html("Edit")
                    //    )
                    //    .append($("<span>").html(" | "))
                    //    .append($("<a>").attr("href",
                    //        `/Products`)
                    //        .html("Back to list")
                    //    )
                    //    ;
                },
                errorCallback: (xhr, textStatus, errorThrown) => {
                    console.log(xhr);
                    $("#errorText").html($("<span>").html(getFirstError(xhr)));
                },
            }
        );

        $("#btnDelete").click(() => {
            deleteApi(
                `https://localhost:44330/api/Orders/${orderId}`,
                "",
                {
                    successCallback: (response, textStatus, xhr) => {
                        location.href = "/Orders";
                    },
                    errorCallback: (xhr, textStatus, errorThrown) => {
                        console.log(xhr);
                        $("#errorText").html($("<span>").html(xhr.responseText));
                    },
                }
            );
        })
    }
})

function displayOrderInformation(order, selector) {
    $(selector)
        .append(
            $("<dt>")
                .addClass("col-sm-3")
                .html("Order Date")
        )
        .append(
            $("<dd>")
                .addClass("col-sm-9")
                .html(convertDate(order.orderDate))
        )
        .append(
            $("<dt>")
                .addClass("col-sm-3")
                .html("Required Date")
        )
        .append(
            $("<dd>")
                .addClass("col-sm-9")
                .html(convertDate(order.requiredDate))
        )
        .append(
            $("<dt>")
                .addClass("col-sm-3")
                .html("Shipped Date")
        )
        .append(
            $("<dd>")
                .addClass("col-sm-9")
                .html(convertDate(order.shippedDate))
        )
        .append(
            $("<dt>")
                .addClass("col-sm-3")
                .html("Freight")
        )
        .append(
            $("<dd>")
                .addClass("col-sm-9")
                .html(order.freight)
        )
        .append(
            $("<dt>")
                .addClass("col-sm-3")
                .html("Member")
        )
        .append(
            $("<dd>")
                .addClass("col-sm-9")
                .html(order.member.email)
        );
}

function displayOrderDetails(orderDetails, selector) {
    $(selector).html("");

    if (orderDetails.length > 0) {
        $.each(orderDetails, (listIndex, listValue) => {
            $(selector).append($("<tr>"));
            var appendElement = $(`${selector} tr`).last();

            appendElement.append($("<td>").html(listValue.product.productName));
            appendElement.append($("<td>").html(listValue.unitPrice));
            appendElement.append($("<td>").html(listValue.quantity));
            appendElement.append($("<td>").html(listValue.discount));
        });
        $("#orderTotal").html(`Order Total: ${orderDetails
            .map(od =>
                od.quantity * od.unitPrice * (1 - od.discount))
            .reduce((prev, next) => prev + next)}`);
    } else {
        $(selector).html("No item in cart!");
    }
}