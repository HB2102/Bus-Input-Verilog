// 4to1 mux module
module mux1x4 (
    input i1,i2, i3, i4,s0,s1,
    output y
    );
    
    
    not(ns0 , s0);
    not(ns1 , s1);

    and(w0, i1, ns0, ns1);
    and(w1, i2, ns0, s1);
    and(w2, i3, s0, ns1);
    and(w3, i4, s0, s1);

    or(y,w0,w1,w2,w3);

endmodule


module bustransfer (
    input [3:0] a,b,c,d,
    input x,y,
    output [3:0] bus
);

    mux1x4 m1(a[0],b[0],c[0],d[0],x,y,bus[0]);
    mux1x4 m2(a[1],b[1],c[1],d[1],x,y,bus[1]);
    mux1x4 m3(a[2],b[2],c[2],d[2],x,y,bus[2]);
    mux1x4 m4(a[3],b[3],c[3],d[3],x,y,bus[3]);
    
endmodule


module tb_bustransfer ();

    reg [3:0] a,b,c,d;
    reg x,y;
    wire [3:0] bus;

    bustransfer bust(a,b,c,d,x,y,bus);

    initial begin
        a = 4'b0000;
        b = 4'b0001;
        c = 4'b1000;
        d = 4'b1111;
        x = 0;
        y = 0;
        #100;

        a = 4'b0000;
        b = 4'b0001;
        c = 4'b1000;
        d = 4'b1111;
        x = 0;
        y = 1;
        #100;

        a = 4'b0000;
        b = 4'b0001;
        c = 4'b1000;
        d = 4'b1111;
        x = 1;
        y = 0;
        #100;

        a = 4'b0000;
        b = 4'b0001;
        c = 4'b1000;
        d = 4'b1111;
        x = 1;
        y = 1;
        #100;

        
    end

    
endmodule

