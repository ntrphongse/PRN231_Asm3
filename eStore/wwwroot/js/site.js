// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

function getUrlParam(paramName) {
    const url = new URL(location.href);
    return url.searchParams.get(paramName);
}

function getUrlId() {
    const temp = location.href.split("/");
    console.log(temp);
    return temp[5];
}

function getFirstError(xhr) {
    if (xhr.responseJSON) {
        const responseJson = xhr.responseJSON;
        const title = responseJson.title;

        if (responseJson.errors) {
            const errors = responseJson.errors;
            const propertyName = Object.keys(errors)[0];
            const errorMessage = errors[propertyName][0];
            return `${title} <br /> <strong>Details:</strong> ${propertyName}: ${errorMessage}`;

        }
        return `${title}`;

    } else {
        return xhr.responseText;
    }
}

function convertDate(date) {
    if (date) {
        let vnDate = new Date(date).toLocaleString('en-US', {
            timeZone: 'Asia/Jakarta',
        });
        let newDate = new Date(vnDate);
        let createAtStr = `${newDate.getDate()}/${newDate.getMonth() + 1
            }/${newDate.getFullYear()} ${newDate.getHours()}:${newDate.getMinutes()}:${newDate.getSeconds()}`;

        return createAtStr;
    }
    return "";
};
