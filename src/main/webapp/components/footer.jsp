<footer class="bg-dark text-white text-center p-3 mt-5">
    2026 Lego Shop
</footer>

</body>

<!-- Nút mở chat -->
<div id="chat-toggle" style="
position:fixed;
bottom:20px;
right:20px;
background:#ff4757;
color:white;
padding:12px;
border-radius:50%;
cursor:pointer;
font-size:18px;
z-index:9999;">
CHAT WITH AI
</div>

<!-- Chatbox -->
<div id="chatbox" style="
position:fixed;
bottom:80px;
right:20px;
width:320px;
display:none;
font-family:sans-serif;
z-index:9999;
">

    <div style="
    background:#ff4757;
    color:white;
    padding:10px;
    border-radius:10px 10px 0 0;
    display:flex;
    justify-content:space-between;">
         LEGO Assistant
        <span id="chat-close" style="cursor:pointer;">x</span>
    </div>

    <div id="chat-content" style="
    background:white;
    height:260px;
    overflow:auto;
    padding:10px;">
    </div>

    <input type="text" id="chat-input"
           placeholder="Enter your question.."
           style="width:100%;padding:10px;border:none;border-top:1px solid #ddd;">
</div>

<script>
// mở chat
document.getElementById("chat-toggle").onclick = function(){
    document.getElementById("chatbox").style.display = "block";
    this.style.display = "none";
}

// đóng chat
document.getElementById("chat-close").onclick = function(){
    document.getElementById("chatbox").style.display = "none";
    document.getElementById("chat-toggle").style.display = "block";
}

// gửi tin nhắn
document.getElementById("chat-input").addEventListener("keypress", function(e) {

    if (e.key === "Enter") {

        let msg = this.value.trim();
        if(msg === "") return;

        this.value = "";

        let chatBox = document.getElementById("chat-content");

        chatBox.innerHTML += "<div><b>You:</b> " + msg + "</div>";

        fetch("${pageContext.request.contextPath}/chatbot", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: "message=" + encodeURIComponent(msg)
        })
        .then(res => res.json())
        .then(data => {
            console.log(data);

            let reply = data.reply;

            chatBox.innerHTML += "<div style='color:green'><b>Bot:</b> " + reply + "</div>";

            chatBox.scrollTop = chatBox.scrollHeight;
        })
        .catch(err => {
            chatBox.innerHTML += "<div style='color:red'> Chatbot Error </div>";
        });
    }
});
</script>
</html>