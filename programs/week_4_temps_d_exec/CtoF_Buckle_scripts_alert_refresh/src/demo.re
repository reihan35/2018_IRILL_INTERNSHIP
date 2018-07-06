[@bs.val] external alert : string => unit = "alert";
[@bs.val] external performance : unit => float = "performance.now";
[@bs.val] external reload : unit => unit = "location.reload";
[@bs.val] external alert2 : float => unit = "alert";

for (x in 1 to 10) {
	let x = performance();
	alert("hello");
	let y = performance();
	alert2((y-.x));
	/*reload();*/
}

