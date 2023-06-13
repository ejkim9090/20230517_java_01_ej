package kh.lclass.udp;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;

public class UdpEchoReceiver {
	public static void main(String[] args) {
		new UdpEchoReceiver().receiverUdp();
	}
	public void receiverUdp() {
		// 포트번호 정함
		int myPort = 6001;
		//int destPort = 5001;
		//String destName = "localhost";
		DatagramSocket dSock = null;
		try {
			// DatagramSocket 객체 생성
			dSock = new DatagramSocket(myPort);// 매개인자 없으면 자동port 번호 할당.지정하면 해당 포트 번호로 소켓 생성
			
			// 메시지 수신
			while(true) {
				byte[] byteMsg = new byte[1000];
				// 수신받을 메시지를 DatagramPacket 객체에 담음
				DatagramPacket receivedData 
				= new DatagramPacket
				( byteMsg, byteMsg.length );
				dSock.receive(receivedData);
				
				// 전달받은 메시지 정보들
//				System.out.println("===전달받은 정보들=");
//				System.out.println(byteMsg.length);
//				System.out.println(receivedData.getData().length);
//				System.out.println(receivedData.getLength());
//				System.out.println(receivedData.getAddress());  // 전달받은 메시지의 발신IP
//				System.out.println(receivedData.getPort());  // 전달받은 메시지의 발신Port
//				
				String receivedStr = new String(receivedData.getData());
				System.out.println("수신메시지 :"+ receivedStr);
			
				// Echo 메시지 송신
//				5. 전송할 메시지를 DatagramPacket 객체에 담음
				DatagramPacket sendData 
				= new DatagramPacket
				( receivedData.getData(), receivedData.getLength()
						, receivedData.getAddress(), receivedData.getPort());
				dSock.send(sendData);
				
			}
		
		
		
		
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
					
	}
}
