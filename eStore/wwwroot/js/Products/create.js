$(() => {
    $("#btnCreate").click(() => {
        //const productId = parseInt($("#ProductId").val());
        const categoryId = parseInt($("#CategoryId").val());
        const productName = $("#ProductName").val();
        const weight = parseFloat($("#Weight").val());
        const unitPrice = parseFloat($("#UnitPrice").val());
        const unitsInStock = parseInt($("#UnitsInStock").val());

        const createProduct = {
            //productId: productId,
            productName: productName,
            weight: weight,
            unitPrice: unitPrice,
            unitsInStock: unitsInStock,
            categoryId: categoryId
        };

        postApi(
            `https://localhost:44330/api/Products/`,
            createProduct,
            {
                successCallback: (response, textStatus, xhr) => {
                    location.href = "/Products";
                },
                errorCallback: (xhr, textStatus, errorThrown) => {
                    console.log(xhr);
                    $("#errorText").html(getFirstError(xhr));
                },
            }
        );

        console.log(createProduct);
    });
})