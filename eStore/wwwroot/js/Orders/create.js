var orderDetails = [];

$(() => {

    const userId = $("#memberId").val();
    if (userId !== "Admin") {
        $("#MemberId").val(userId).change();
        $("#MemberId").prop("disabled", "disabled");
    }

    $("#btnCreate").click(() => {
        if (orderDetails.length == 0) {
            displayCreateError("No item in cart! Please add at least one item to process!!!");
        }
        else {
            const memberId = $("#MemberId").val();
            //const orderDate = $("#OrderDate").val();
            const requiredDate = $("#RequiredDate").val();
            const shippedDate = $("#ShippedDate").val();
            const freight = parseFloat($("#Freight").val());

            const createOrder = {
                memberId: memberId,
                //orderDate: orderDate,
                requiredDate: requiredDate,
                shippedDate: shippedDate,
                freight: freight,
                orderDetails: orderDetails
            }

            postApi(
                `https://localhost:44330/api/Orders/`,
                createOrder,
                {
                    successCallback: (response, textStatus, xhr) => {
                        location.href = "/Orders";
                    },
                    errorCallback: (xhr, textStatus, errorThrown) => {
                        console.log(xhr);
                        displayCreateError(getFirstError(xhr));
                    },
                }
            );

            console.log(createOrder);
        }
    });

});

function displayCreateError(text) {
    $("#errorText").html(text);
}