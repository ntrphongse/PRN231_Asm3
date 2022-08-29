$(() => {
    $("#btnReport").click(() => {
        const startDate = $("#startDate").val();
        const endDate = $("#endDate").val();
        if (!startDate || !endDate) {
            $("#reportError").html("Enter both Start Date and End Date to get report...");
        } else {
            $("#reportError").html("");
            $("#reportBody").html("Searching...");

            getApi(
                `https://localhost:44330/api/Orders/search?startDate=${startDate}&endDate=${endDate}`,
                "",
                {
                    successCallback: (response, textStatus, xhr) => {
                        console.log(response);
                        if (response.length === 0) {
                            $("#reportBody").html("No order found!!");
                        }
                        else {
                            $("#reportBody").html("");
                            $.each(response, (listIndex, listValue) => {
                                $("#reportBody").append($("<tr>"));
                                var appendElement = $("#reportBody tr").last();

                                appendElement.append($("<td>").html(convertDate(listValue.orderDate)));
                                appendElement.append($("<td>").html(convertDate(listValue.requiredDate)));
                                appendElement.append($("<td>").html(convertDate(listValue.shippedDate)));
                                appendElement.append($("<td>").html(listValue.freight));
                                appendElement.append($("<td>").html(listValue.member.email));
                                appendElement.append($("<td>").html(listValue.orderDetails.length));
                                appendElement.append($("<td>").html(listValue.orderDetails.map(od =>
                                    od.quantity * od.unitPrice * (1 - od.discount))
                                    .reduce((prev, next) => prev + next)));
                            });
                        }
                    },
                    errorCallback: (xhr, textStatus, errorThrown) => {
                        console.log(xhr);
                        $("#reportBody").html($("<span>").html(getFirstError(xhr)));
                    },
                }
            );
        }
    });
});