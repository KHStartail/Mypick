var locked = 0;

function show(star){
    if (locked)
        return;
    var i;
    var rev;
    var el;
    var e = document.getElementById('revText');

    for(i = 1; i<=star; i++){
        rev = 'rev'+i;
        el = document.getElementById(rev);
        el.src = "assets/images/goodsStarPick.png";
    }
}

function noshow(star){
    if (locked)
        return;
    var i;
    var rev;
    var el;
    for (i = 1; i <=star; i++){
        rev = 'rev'+i;
        el = document.getElementById(rev);
        el.src = "assets/images/goodsStar.png"
    }
}

function lock(star){
    show(star);
    locked = 1;
}

function mark(star){
    lock(star);
    document.revForm.revStar.value = star;
}