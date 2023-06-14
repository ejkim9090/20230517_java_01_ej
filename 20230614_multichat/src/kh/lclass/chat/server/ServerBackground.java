package kh.lclass.chat.server;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;

import kh.lclass.chat.client.ClientGUI;

public class ServerBackground {
	private ServerSocket serverSocket; // 서버소켓
	private ServerGUI gui; //null //= new 하면 안됨. 
	private Socket socket;
	private BufferedReader br;
	private BufferedWriter bw;
	
	private int count; // 현재 접속자 수

	// 서버 생성 및 설정
	public void setting() {
		try {
			serverSocket = new ServerSocket(7777);
			// 방문자 접속을 계속 받아들임. 무한반복함. GUI 프로그램경우 창 닫힐때까지 계속 반복됨. break 없음
			while(true) { 
				// 접속자 대기 중
				socket = serverSocket.accept();  // 클라이언트 받음
				br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
				bw = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
				
				// 클라이언트 nickname이 바로 이어서 들어옴.
				String nickname = br.readLine();
				addClient(nickname);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 클라이언트 접속하면 그 정보를 나타내 주는 메소드
	public void addClient(String nickname) {
		gui.appendMsg(nickname+"님이 접속했습니다.");
	}
	
	
	
	
	
	
	// private ServerGUI gui;
	public void setGui(ServerGUI gui) {
		this.gui = gui;
	}
}
















