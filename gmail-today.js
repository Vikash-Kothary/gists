javascript: String.prototype.format = function() {
    var i = 0,
        args = arguments;
    return this.replace(/{}/g, function() {
        return typeof args[i] != 'undefined' ? args[i++] : '';
    });
};

function searchToday() {
    let today = new Date();
    let dd = today.getDate();
    let mm = today.getMonth() + 1;
    let yyyy = today.getFullYear();
    let url = '#search/';
    let params = [];
    params.push('after%3A{}%2F{}%2F{}'.format(yyyy, mm, dd));
    params.push('before%3A{}%2F{}%2F{}'.format(yyyy, mm, dd + 1));
    params.push('in%3Ainbox');
    for (var param in params) {
        url += encodeURIComponent(params[param]) + '+';
    }
    return url;
}

function gmailToday() {
    var base_url = 'https://mail.google.com/mail/u/0/?zx=8uifvpdj3b7f';
    var search_parameter = searchToday();
    url = base_url + search_parameter;
    window.location.href = url;
}
gmailToday();