$(() => {
    $("#btnSave").click(() => {
        const productId = parseInt($("#ProductId").val());
        const categoryId = parseInt($("#CategoryId").val());
        const productName = $("#ProductName").val();
        const weight = parseFloat($("#Weight").val());
        const unitPrice = parseFloat($("#UnitPrice").val());
        const unitsInStock = parseInt($("#UnitsInStock").val());

        const updateProduct = {
            productId: productId,
            productName: productName,
            weight: weight,
            unitPrice: unitPrice,
            unitsInStock: unitsInStock,
            categoryId: categoryId
        };

        putApi(
            `https://localhost:44330/api/Products/${productId}`,
            updateProduct,
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

        console.log(updateProduct);
    });
})