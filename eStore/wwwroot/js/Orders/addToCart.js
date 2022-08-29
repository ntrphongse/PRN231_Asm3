$(() => {
    displayCart(orderDetails, "#orderProductsDetails");

    $("#btnAddToCart").click(() => {
        const productId = parseInt($("#ProductId").val());
        const quantity = parseInt($("#Quantity").val());
        const discount = parseFloat($("#Discount").val());

        if (!productId) {
            displayAddToCartError("Product ID is not valid!!");
        } else if (!quantity || quantity < 0) {
            displayAddToCartError("Order detail Quantity has to be a positive integer!");
        } else if ((discount !== 0 && !discount) || discount < 0 || discount > 1) {
            displayAddToCartError("Order detail Discount has to be between 0 and 1!");
        } else {
            getApi(
                `https://localhost:44330/api/Products/${productId}`,
                "",
                {
                    successCallback: (response, textStatus, xhr) => {
                        const product = response;

                        var isQuantityError = false;
                        if (isExistProduct(orderDetails, productId)) {
                            const existedOne = orderDetails.filter(od =>
                                od.productId === productId
                            )[0];
                            if (existedOne.quantity + quantity > product.unitsInStock) {
                                isQuantityError = true;
                                displayAddToCartError(`Product ${product.productName} can only be ordered more at most with the quantity of <strong>${product.unitsInStock - existedOne.quantity}</strong>`);
                            }
                        } else {
                            if (quantity > product.unitsInStock) {
                                displayAddToCartError(`Product ${product.productName} can only be ordered at most with the quantity of <strong>${product.unitsInStock}</strong>`);
                                isQuantityError = true;
                            }
                        }
                        if (!isQuantityError) {
                            addToCart(orderDetails, {
                                productId: productId,
                                productName: product.productName,
                                unitPrice: product.unitPrice,
                                quantity: quantity,
                                discount: discount
                            });
                            displayCart(orderDetails, "#orderProductsDetails");
                            displayAddToCartError("");
                        }

                    },
                    errorCallback: (xhr, textStatus, errorThrown) => {
                        console.log(xhr);
                        displayAddToCartError(getFirstError(xhr));
                    },
                }

            );
        }
    });
});

function displayAddToCartError(text) {
    $("#addToCartText").html(text);
}

function isExistProduct(cart, productId) {
    return cart.some(od => {
        return od.productId === productId
    });
}

function addToCart(cart, orderDetail) {

    if (isExistProduct(cart, orderDetail.productId)) {
        cart = cart.map(od => {
            if (od.productId === orderDetail.productId) {
                od.quantity += orderDetail.quantity;
                od.discount = orderDetail.discount;
                od.unitPrice = orderDetail.unitPrice;
            }
            return od;
        });
    } else {
        cart.push(orderDetail);
    }
}

function displayCart(cart, tableSelector) {
    $(tableSelector).html("");
    $("#orderTotal").html("");

    if (cart.length > 0) {
        $.each(cart, (listIndex, listValue) => {
            $(tableSelector).append($("<tr>"));
            var appendElement = $(`${tableSelector} tr`).last();

            appendElement.append($("<td>").html(listValue["productName"]));
            appendElement.append($("<td>").html(listValue["unitPrice"]));
            appendElement.append($("<td>").html(listValue["quantity"]));
            appendElement.append($("<td>").html(listValue["discount"]));
            appendElement.append($("<td>").html(
                $("<a>")
                    .addClass("remove-cart-item")
                    .attr("data-product-id", listValue.productId)
                    .attr("href", "#")
                    .click(() => removeCartItem(cart, listValue.productId))
                    .html("Remove")
            ));
        });
        $("#orderTotal").html(`Order Total: ${cart
            .map(od =>
                od.quantity * od.unitPrice * (1 - od.discount))
            .reduce((prev, next) => prev + next)}`);
    } else {
        $(tableSelector).html("No item in cart!");
    }

}

function removeCartItem(cart, productId) {
    if (isExistProduct(cart, productId)) {
        orderDetails = cart.filter(od => od.productId !== productId);
    }

    displayCart(orderDetails, "#orderProductsDetails");
}