package kh.lclass.chat.client;

import javax.swing.JOptionPane;

public class ClientRun {
	public static void main(String[] args) {
		// 사용자 nickname을 GUI를 통해서 입력받음. 
		String nickName = JOptionPane.showInputDialog("닉네임을 입력해주세요.");
		System.out.println(nickName);
		new ClientGUI(nickName);  // 객체 생성 --> 생성자에 화면초기화 + event 등록 및 visible --> 창 보여짐

	}
}
