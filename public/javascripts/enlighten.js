var websock = new WebSocket('ws://0.0.0.0:3000/debugger');
websock.onmessage = function(e) {
  $("#prompt_section").before("<pre>&gt;&gt; " + $("#prompt_field").val() + "\n" + "<span class='response'>=&gt; " + e.data + "</span></pre>");
  $("#prompt_field").val("");
};

$(function() {
  $("#prompt form").submit(function(e) {
    websock.send($("#prompt_field").val());
    e.preventDefault();
  });
});
