window.onload = function(){
    function onClick(){
        document.querySelector("#modal-wrap").style.display = "block";
        document.querySelector("#black-bg").style.display = "block";
    }
    function offClick(){
        document.querySelector("#modal-wrap").style.display = "none";
        document.querySelector("#black-bg").style.display = "none";
        
    }
    document.getElementById("delete-btn").addEventListener("click",onClick);
    document.querySelector(".delete-close").addEventListener("click",offClick);
    
};