require("./styles/screen.scss");

// inject bundled Elm app into div#main
var Elm = require( './Main.elm' );
var mainElement = document.getElementById('main');
var app = Elm.Main.embed(mainElement);

app.ports.debug.subscribe(function(isVisible) {
    // This port allows us to hide/show the time travel debugger
    var debugInterface = mainElement.lastChild.lastChild;
    if (debugInterface.style.display === 'none') {
        debugInterface.style.display = 'initial';
    } else {
        debugInterface.style.display = 'none';
    }
});


var hideDebugInterface = setInterval(function() {
    // This updates the stypes of the time travel debugger so that its hidden
    // by default and so that the debugger can be scrolled.
    debugInterface = mainElement.lastChild.lastChild;
    if (debugInterface != null) {
        debugInterface.getElementsByTagName('div')[0]
          .style.position = 'absolute'
        debugInterface.style.display = 'none';
        clearInterval(hideDebugInterface);
    }
}, 5)
