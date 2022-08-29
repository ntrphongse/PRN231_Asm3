function fetchApi(
    url,
    body,
    method,
    callbacks,
    contentType = 'application/json'
) {
    $.ajax({
        beforeSend: function (xhrObj) {
            xhrObj.setRequestHeader('Content-Type', contentType);
            // xhrObj.setRequestHeader('Accept', 'application/json;odata.metadata=minimal;odata.streaming=true');
        },
        method: method,
        url: url,
        data: body,
        dataType: 'json',
        success: callbacks.successCallback,
        error: callbacks.errorCallback,
    });
}

function getApi(
    url,
    body,
    callbacks
) {
    fetchApi(url, body, 'GET', callbacks);
}

function postApi(
    url,
    body,
    callbacks,
) {
    fetchApi(url, JSON.stringify(body), 'POST', callbacks);
}

function putApi(
    url,
    body,
    callbacks,
    contentType = 'application/json'
) {
    fetchApi(url, JSON.stringify(body), 'PUT', callbacks, contentType);
}

function deleteApi(
    url,
    body,
    callbacks
) {
    fetchApi(url, JSON.stringify(body), 'DELETE', callbacks);
}