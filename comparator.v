module four_bit_comparator(
    input [3:0] A,
    input [3:0] B,
    output S,
    output E,
    output G    
);

    wire c0,c1,c2,c3,b0,b1,b2,b3,g1,g2,g3,g4;
    xnor gate1(c0, A[0], B[0]); 
    xnor gate2(c1, A[1], B[1]); 
    xnor gate3(c2, A[2], B[2]); 
    xnor gate4(c3, A[3], B[3]); 
    and gate5(E, c0, c1, c2, c3);  // E represents A = B (4 input AND)
    not gate6(b0, B[0]);
    not gate7(b1, B[1]);
    not gate8(b2, B[2]);
    not gate9(b3, B[3]);
    and gate10(g3, A[3], b3);
    and gate11(g2, c3, A[2], b2);          // 3 input AND
    and gate12(g1, c3, c2, A[1], b1);      // 4 input AND
    and gate13(g0, c3, c2, c1, A[0], b0);  // 5 input AND
    or gate14(G, g0, g1, g2, g3);  // G represents A > B   (4 input OR)
    nor gate15(S, G, E);  // S represents A < B



endmodule