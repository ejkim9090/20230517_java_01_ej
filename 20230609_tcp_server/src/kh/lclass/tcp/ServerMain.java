package kh.lclass.tcp;

public class ServerMain {
	public static void main(String[] args) {
		// 1. 서버의 포트번호 정함 ==> 프로그램의 포트번호
		new TcpServer().testTcpServer(9001); 
	}
}
