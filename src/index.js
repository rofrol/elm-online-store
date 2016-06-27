require("./styles/screen.scss");

// inject bundled Elm app into div#main
var Elm = require( './Main.elm' );
var mainElement = document.getElementById('main');
var app = Elm.Main.embed(mainElement);

app.ports.debug.subscribe(function(isVisible) {
    var debugInterface = mainElement.lastChild.lastChild;
    if (debugInterface.style.display === 'none') {
        debugInterface.style.display = 'initial';
    } else {
        debugInterface.style.display = 'none';
    }
});
