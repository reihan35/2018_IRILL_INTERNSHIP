let canvas = Dom_html.getElementById "myCanvas"
let ctx = canvas##getContext Js.string("2d")
ctx##beginPath()
ctx##arc(95, 50, 40, 0, 2 * 3.14)