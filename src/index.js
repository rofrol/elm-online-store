require("./styles/screen.scss");

// inject bundled Elm app into div#main
var Elm = require( './Main.elm' );
var mainElement = document.getElementById('main');
var app = Elm.Main.embed(mainElement);
