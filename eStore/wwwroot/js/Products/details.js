$(() => {
    const productId = getUrlId();
    if (!productId) {
        //$("#btnDelete").hide();
        $("#errorText").append($("<span>").html("Product id not specified!!!"));
    } else {
        getApi(
            `https://localhost:44330/api/Products/${productId}`,
            "",
            {
                successCallback: (response, textStatus, xhr) => {
                    $("#productDetails")
                        .append(
                            $("<dt>")
                                .addClass("col-sm-3")
                                .html("Product Name")
                        )
                        .append(
                            $("<dd>")
                                .addClass("col-sm-9")
                                .html(response.productName)
                        )
                        .append(
                            $("<dt>")
                                .addClass("col-sm-3")
                                .html("Weight")
                        )
                        .append(
                            $("<dd>")
                                .addClass("col-sm-9")
                                .html(response.weight)
                        )
                        .append(
                            $("<dt>")
                                .addClass("col-sm-3")
                                .html("Unit Price")
                        )
                        .append(
                            $("<dd>")
                                .addClass("col-sm-9")
                                .html(response.unitPrice)
                        )
                        .append(
                            $("<dt>")
                                .addClass("col-sm-3")
                                .html("Units In Stock")
                        )
                        .append(
                            $("<dd>")
                                .addClass("col-sm-9")
                                .html(response.unitsInStock)
                        )
                        .append(
                            $("<dt>")
                                .addClass("col-sm-3")
                                .html("Category")
                        )
                        .append(
                            $("<dd>")
                                .addClass("col-sm-9")
                                .html(response.category.categoryName)
                        );

                    //$("#detailsAction").html("");
                    $("#detailsAction")
                        .append($("<a>").attr("href",
                            `/Products/Edit/${response.productId}`)
                            .html("Edit")
                        )
                        .append($("<span>").html(" | "))
                        .append($("<a>").attr("href",
                            `/Products`)
                            .html("Back to list")
                        )
                        ;
                },
                errorCallback: (xhr, textStatus, errorThrown) => {
                    console.log(xhr);
                    $("#errorText").html($("<span>").html(getFirstError(xhr)));
                },
            }

        )
    }
})