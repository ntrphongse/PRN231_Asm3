$(() => {
    $("#btnFilter").click(() => {
        const startPrice = parseFloat($("#startPrice").val());
        const endPrice = parseFloat($("#endPrice").val());
        if (!startPrice || !endPrice) {
            $("#searchError").html("Enter both Start Price and End Price to filter...");
        } else {
            $("#searchError").html("");
            $("#productListBody").html("Searching...");
            getApi(
                `https://localhost:44330/api/Products/filter?startPrice=${startPrice}&endPrice=${endPrice}`,
                "",
                {
                    successCallback: (response, textStatus, xhr) => {
                        console.log(response);
                        if (response.length === 0) {
                            $("#productListBody").html("No product found!!");
                        }
                        else {
                            $("#productListBody").html("");
                            $.each(response, (listIndex, listValue) => {
                                $("#productListBody").append($("<tr>"));
                                var appendElement = $("#productListBody tr").last();

                                appendElement.append($("<td>").html(listValue["productName"]));
                                appendElement.append($("<td>").html(listValue["weight"]));
                                appendElement.append($("<td>").html(listValue["unitPrice"]));
                                appendElement.append($("<td>").html(listValue["unitsInStock"]));
                                appendElement.append($("<td>").html(listValue["category"]["categoryName"]));

                                appendElement.append(
                                    $("<td>").html($("<div>")
                                        .append($("<a>").attr("href",
                                            `../Products/Edit/${listValue["productId"]}`)
                                            .html("Edit")
                                        )
                                        .append($("<span>").html(" | "))
                                        .append($("<a>").attr("href",
                                            `../Products/Details/${listValue["productId"]}`)
                                            .html("Details")
                                        )
                                        .append($("<span>").html(" | "))
                                        .append($("<a>").attr("href",
                                            `../Products/Delete/${listValue["productId"]}`)
                                            .html("Delete")
                                        )
                                    ));

                            });
                        }
                    },
                    errorCallback: (xhr, textStatus, errorThrown) => {
                        console.log(xhr);
                        $("#errorText").html($("<span>").html(getFirstError(xhr)));
                    },
                }
            );
        }
    });
})