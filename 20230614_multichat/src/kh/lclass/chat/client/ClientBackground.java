package kh.lclass.chat.client;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.net.UnknownHostException;

public class ClientBackground {
	private Socket socket; // 필드는 따로 close 안해줘도 됨. disconnection() 메소드를 운영하거나 garbage collection 에 의해 close 될 예정임.
	private BufferedReader br;
	private BufferedWriter bw;
	private String nickname;
	private ClientGUI gui; //null //= new 하면 안됨. 

	// client가 서버와 접속 끊기
	public void disconnection() {
		try {
			if(socket != null) {
				socket.close();
			}
		}catch (Exception e) {
		}
	}

	// client가 서버에 접속 -  
	public void connection() {
		try {
			// 서버와 연결
			socket = new Socket("127.0.0.1", 7777);
			// 서버와 입/출력 통로 생성
			br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
			bw = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
			// 접속되면 바로 나의 nickname 전송
			System.out.println("[ejkim]-2"+nickname);
			bw.write(nickname + "\n");
			bw.flush();
			
			// server와 입력 통로가 끊어지지 않았다면 계속 반복확인함.
			// server에서 수신받은 msg
			while(br != null) {
				String msg = br.readLine();
				gui.appendMsg(msg);
			}
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	public void sendMessage(String msg) {
		// server에 msg 전달 
		try {
			System.out.println("[ejkim]-3"+nickname);
			bw.write(nickname+":"+msg+ "\n");
			bw.flush();
			//gui.appendMsg(msg);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 닉네임 setter
	public void setNickname(String nickName) {
		System.out.println("[ejkim]-4"+nickName);
		this.nickname = nickname;
	}
	// private ClientGUI gui;
	public void setGui(ClientGUI gui) {
		this.gui = gui;
	}
}





















