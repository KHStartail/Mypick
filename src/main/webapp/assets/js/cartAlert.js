window.addEventListener('load', function() {
    function onClick(){
        document.querySelector("#modal-wrap1").style.display = "block";
        document.querySelector("#black-bg1").style.display = "block";
    }
    function offClick(){
        document.querySelector("#modal-wrap1").style.display = "none";
        document.querySelector("#black-bg1").style.display = "none";
        
    }
    document.getElementById("cart-btn").addEventListener("click",onClick);
    document.querySelector(".cart-close").addEventListener("click",offClick);
    
});