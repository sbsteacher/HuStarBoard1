
function isDel(iboard) {
    var result = confirm('삭제하시겠습니까?');

    if(result) {
        location.href = '/del?iboard=' + iboard;
    }
}