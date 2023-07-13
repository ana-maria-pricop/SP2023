`ifndef MUX
`define MUX

module mux2_1 #( parameter N = 32 )			
	 (	  
	 	input  [ N-1 : 0 ] in0,		
	 	input  [ N-1 : 0 ] in1,	
        input              sel,	                
		output [ N-1 : 0 ] out		
	 );		 
	 
	 assign out = sel ? in1 : in0; 	
		 						
endmodule

  `endif


// mux2-1 => multiplexor parametrizabil cu doua intrari de date pe N biti , o iesire de date pe N biti si o selectie pe un bit
