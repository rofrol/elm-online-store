require("./styles/screen.scss");

// inject bundled Elm app into div#main
var Elm = require( './Main.elm' );
Elm.Main.embed( document.getElementById( 'main' ) );
