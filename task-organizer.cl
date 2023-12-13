class Main inherits IO{
	main() : Object{
		let 
		start : Start <- new Start,
		done : Bool <- false,
		lineCount : Int <- 0
		in {
		
			start.start_message();
			
			
			while not done loop {
				let s : String <- in_string() 
				in {
					if s = "" then
						done <- true
					else
					{
						done <- false;
						lineCount <- lineCount + 1;
						-- Here is where we can make our node equivalent.
						-- We will need to create a List class to store these nodes.
						--
					}

					fi ;
				} ;
			} pool ;
			
			if lineCount = 0 then
				out_string("ERROR: No lines detected.")
			else if (lineCount % 2) = 0 then
				out_string("another error")
			fi;
				
		}
	};
};

class Start inherits IO {

	init() : Start{
		{
			self;
		}
	};
	
	
	start_message() : Object { 
		{
			out_string("Please input task values.\n");
		}
	};
};
	