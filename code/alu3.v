// ��J a, b ��|���� op �ҫ��w���B��A�M��N���G��b�Ȧs�� y ����
module alu(input [7:0] a, input [7:0] b, input [2:0] op, output [7:0] y);
reg ty;
always@(a or b or op) begin // �� a, b �� op �����ܮɡA�N�i�J���϶�����C
  case(op)                  // �ھ� op �M�w�n�����عB��
    3'b000: ty = a + b;      // op=000, ����[�k
    3'b001: ty = a - b;      // op=000, �����k
    3'b010: ty = a * b;      // op=000, ���歼�k
    3'b011: ty = a / b;      // op=000, ���氣�k
    3'b100: ty = a & b;      // op=000, ���� AND
    3'b101: ty = a | b;      // op=000, ���� OR
    3'b110: ty = ~a;         // op=000, ���� NOT
    3'b111: ty = a ^ b;      // op=000, ���� XOR
  endcase
  $display("base 10 : %dns : op=%d a=%d b=%d y=%d", $stime, op, a, b, y); // �L�X op, a, b, y �� 10 �i��ȡC
  $display("base  2 : %dns : op=%b a=%b b=%b y=%b", $stime, op, a, b, y); // �L�X op, a, b, y ��  2 �i��ȡC
end
assign y=ty;
endmodule

module main;                // ���յ{���}�l
 reg  [7:0] a, b;           // �ŧi a, b �� 8 �줸�Ȧs��
 wire  [7:0] y;             // �ŧi y �� 8 �줸�u��
 reg  [2:0] op;             // �ŧi op �� 3 �줸�Ȧs��

 alu alu1(a, b, op, y);     // �إߤ@�� alu �椸�A�W�٬� alu1

 initial begin              // ���յ{������l�ưʧ@
  a = 8'h07;                // �]�w a ���ƭ� 7
  b = 8'h03;                // �]�w b ���ƭ� 3
  op = 3'b000;              // �]�w op ����l�Ȭ� 000
 end

 always #50 begin           // �C�� 50 �`���N�@�U�C�ʧ@
   op = op + 1;             // �� op ���ȥ[ 1
 end

initial #1000 $finish;      // �ɶ��� 1000 �`���N����

endmodule