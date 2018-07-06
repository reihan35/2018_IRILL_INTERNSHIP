[@bs.val] external alert : string => unit = "alert";
[@bs.val] external performance : unit => float = "performance.now";
[@bs.val] external reload : unit => unit = "location.reload";
[@bs.val] external alert2 : float => unit = "alert";

open Printf;

for (x in 1 to 10) {
	let file = open_out("java_script_bs_times.txt");
	let x = performance();
	let y = performance();
	output_value(file,(y-.x));
	reload();
}

