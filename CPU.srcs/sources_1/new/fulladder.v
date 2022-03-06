module fulladder(S,Co,A,B,Ci);
    input A,B,Ci;    //������A,����B����λ��λCi
    output S,Co;     //��S����λ��λCo
    wire S1,D1,D2;   //�ڲ��ڵ��ź�
    halfadder HA1(S1,D1,A,B);    
    halfadder HA2(S,D2,S1,Ci) ;
    or G1(Co,D2,D1);
endmodule