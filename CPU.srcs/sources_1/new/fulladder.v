module fulladder(S,Co,A,B,Ci);
    input A,B,Ci;    //被加数A,加数B，低位进位Ci
    output S,Co;     //和S，高位进位Co
    wire S1,D1,D2;   //内部节点信号
    halfadder HA1(S1,D1,A,B);    
    halfadder HA2(S,D2,S1,Ci) ;
    or G1(Co,D2,D1);
endmodule