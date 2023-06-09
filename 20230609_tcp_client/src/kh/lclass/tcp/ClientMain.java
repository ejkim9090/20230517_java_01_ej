package kh.lclass.tcp;

public class ClientMain {
	public static void main(String[] args) {
		// "127.0.0.1" 은 "localhost" = loopback
		new TcpClient().testTcpClient("127.0.0.1", 9001);
	}
}
