$(() => {
    const productId = getUrlId();

    if (!productId) {
        $("#btnDelete").hide();
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
                },
                errorCallback: (xhr, textStatus, errorThrown) => {
                    console.log(xhr);
                    $("#errorText").html($("<span>").html(getFirstError(xhr)));
                },
            }
        );
    }

    $("#btnDelete").click(() => {
        deleteApi(
            `https://localhost:44330/api/Products/${productId}`,
            "",
            {
                successCallback: (response, textStatus, xhr) => {
                    location.href = "/Products";
                },
                errorCallback: (xhr, textStatus, errorThrown) => {
                    console.log(xhr);
                    $("#errorText").html($("<span>").html(getFirstError(xhr)));
                },
            }
        );
    });
})