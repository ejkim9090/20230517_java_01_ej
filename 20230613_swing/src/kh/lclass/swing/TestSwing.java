package kh.lclass.swing;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class TestSwing extends JFrame{

	public TestSwing() {
		setTitle("Hello Window 프레임");
		setDefaultCloseOperation(EXIT_ON_CLOSE);  // x 버튼 눌러서 resource 정리하고 창 닫기
		
		Container contentPane = getContentPane();
		//contentPane.setLayout(new FlowLayout(FlowLayout.RIGHT, 5, 5));
//		contentPane.setLayout(new BorderLayout(20,30));
//		contentPane.add(new JButton("OK"), BorderLayout.NORTH);
//		contentPane.add(new JButton("Cancel"), BorderLayout.WEST);
//		contentPane.add(new JButton("Ignore"), BorderLayout.EAST );
//		contentPane.add(new JButton("Center"), BorderLayout.CENTER);
		
		// component 생성
		JTextField txtName = new JTextField();
		JTextField txtNo = new JTextField();
		JTextField txtMajor = new JTextField();
		JTextField txtSubject = new JTextField();
		JButton btnSave = new JButton("저장");
		
		// event 등록 = Action 리스너 달기
		btnSave.addActionListener(new MyActionListener());
		txtName.addActionListener(new MyNameActionListener());
		
		// component를 contentPane에 추가
		contentPane.setLayout(new GridLayout(5,2,10,10));
		contentPane.add(new JLabel("이름"));
		contentPane.add(txtName);
		contentPane.add(new JLabel("학번"));
		contentPane.add(txtNo);
		contentPane.add(new JLabel("학과"));
		contentPane.add(txtMajor);
		contentPane.add(new JLabel("과목"));
		contentPane.add(txtSubject);
		contentPane.add(btnSave);

		setSize(300, 300);
		setVisible(true);
	}
	public static void main(String[] args) {
		TestSwing frame = new TestSwing();
	}

}

class MyNameActionListener implements ActionListener{

	public void actionPerformed(ActionEvent e) {
		System.out.println("이건 언제 호출되지???");
		System.out.println(e);
		Object source  = e.getSource();
		if(source instanceof JTextField) {
			System.out.println("JTextField에서 enter가 눌렀네요");
			if(((JTextField)source).getText().trim().length() == 0) {
				((JTextField)source).setText("이름을 입력해주세요");
			} else {
				((JTextField)source).setText(((JTextField)source).getText().trim());
			}
		}
	}
	
}

class MyActionListener implements ActionListener{

	public void actionPerformed(ActionEvent e) {
		System.out.println("이건 언제 호출되지???");
		System.out.println(e);
		Object source  = e.getSource();
		if(source instanceof JButton) {
			System.out.println("button 눌렀네요");
			if(((JButton)source).getText().equals("저장")) {
				((JButton)source).setText("Save");
			} else {
				((JButton)source).setText("저장");
			}
		} else if(source instanceof JTextField) {
			System.out.println("text 필드에서 enter key를 눌렀네요.");
		}
	}
	
}























