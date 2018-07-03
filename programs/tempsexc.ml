let t1 = Sys.time() in

for i=0 to 500000
  do
   print_string "hello\n"
  done;
print_float (Sys.time() -. t1);;