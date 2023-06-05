package kh.lclass.io;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectInput;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import kh.lclass.exception.UserException;
import kh.lclass.oop.sample.Person;

public class TestFileIO {
	public void testFileOutputStreamObject() {
		// 파일에 사람들 자료를 저장함.
		Person p1 = new Person("홍길동", 23, '남',5);
		Person p2 = new Person("영희", 27, 'F',2);
	
		String filePath="D:/data2/test/aaa.txt";
		FileOutputStream fos = null;  // 기반스트림
		BufferedOutputStream bos = null;
		ObjectOutputStream oos = null;  // 보조스트림
		try {
			fos = new FileOutputStream(filePath);
			bos = new BufferedOutputStream(fos);
			oos = new ObjectOutputStream(bos);
			
			oos.writeObject(p1);
			oos.writeObject(p2);
			oos.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(oos !=null) oos.close();
				if(fos !=null) fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	public void testFileInputStreamObject() {
		String filePath="D:/data2/test/aaa.txt";
		FileInputStream ios = null;  // 기반스트림
		ObjectInputStream ois = null;  // 보조스트림
		try {
			ios = new FileInputStream(filePath);
			ois = new ObjectInputStream(ios);
			Object a  = null;
			if((a = ois.readObject()) instanceof Person) {
				Person p = (Person)a;
				System.out.println(p.getName());
			}
			if((a = ois.readObject()) instanceof Person) {
				Person p = (Person)a;
				System.out.println(p);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ois !=null) ois.close();
				if(ios !=null) ios.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public void testRamda() throws UserException {
		int[] arr = {2,3,4};
		int[] arr2 = new int[] {2,3,4};
		for(int i=0; i<arr.length; i++) {
			System.out.println(arr[i]);
		}
		if(arr.length >2) {
			// No exception of type UserException can be thrown; an exception type must be a subclass of Throwable
			//throw new UserException();
			throw new UserException("배 크면 안됨. 줄여주세요.");
			// 오류 발생하고 죽어버림.열의 크기는 2보다
		}
	}
	public void testFileReadData() {
		String filePath="D:/data2/test/aaa.txt";
		try(DataInputStream dis = new DataInputStream(new FileInputStream(filePath));) {
			long temp = 0L;
			while((temp=dis.readLong()) != 0) {
				System.out.println(String.valueOf(temp));
			}
			// F2 - quick fix 사용 1. try catch 신중하게 잘 써야함. 2. unimplement method add
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	public void testFileRead3() {
		String filePath="D:/data2/test/aaa.txt";
//		BufferedReader br = null;
		try (
				FileInputStream fis = new FileInputStream(filePath);
				InputStreamReader isr = new InputStreamReader(fis);
				BufferedReader br = new BufferedReader(isr);
			)
		{
//			br = new BufferedReader(new FileReader(filePath));
			String str = null;
			while( (str = br.readLine()) != null ) {
				System.out.println(str);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
//		} finally {
//			try {
//				if(br != null) br.close();
//			}catch (IOException e) {
//				e.printStackTrace();
//			}
		}
	}
	public void testFileRead2() {
		// 보조스트림
		String filePath = "D:/data2/test/aaa.txt";
		FileInputStream fis = null;
		InputStreamReader isr = null;
		BufferedReader br = null;  //The local variable br may not have been initialized
		try {
			// 생성 순서 : 기반스트림 --> 보조스트림
			fis = new FileInputStream(filePath);
			isr = new InputStreamReader(fis);
			br = new BufferedReader(isr);
			
			// 줄여서 나타내기
//			isr = new InputStreamReader(new FileInputStream(filePath));
//			br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath)));
			
			String str = null;
			while( (str = br.readLine()) != null ) {
				System.out.println(str);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				// 해제 순서 (생성반대순서) : 보조스트림 --> 기반스트림
				if(br != null) br.close();
				if(isr != null) isr.close();
				if(fis != null) fis.close();
			} catch (IOException e2) {
				e2.printStackTrace();
			}
		}
	}
	public void testFileRead() {
		String filePath = "D:/data2/test/aaa.txt";
		// fr cannot be resolved
		FileReader fr = null;
		try {
			fr = new FileReader(filePath); // (file과 java 프로그램의 resource 통로)
			// Unhandled exception type IOException
			// 사용 불가 for(int i=0; i<fr.)
			// 방법 1
//				int a = -1;
//				while((a = fr.read()) > -1) {
//					System.out.println((char)a);
//				}
			// 방법 2 - 3
			int cntPerRead = 50;
			char[] readCharArr = new char[1000];
			for (int i = 0; i < readCharArr.length / cntPerRead; i++) {
				int readCnt = fr.read(readCharArr, i * cntPerRead, cntPerRead);
				System.out.println(readCnt); // 50 : 문자 4개 읽었음.
				if (readCnt < cntPerRead) {
					break;
				}
			}
			System.out.println(readCharArr);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			System.out.println("파일을 찾을 수 없습니다. 경로를 확인해 주세요.");
		} catch (IOException e) {
			e.printStackTrace();
			// Unreachable catch block for FileNotFoundException. It is already handled by the catch block for IOException
		} finally {
			// Unhandled exception type IOException
			try {
				if (fr != null)
					fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("== testFileRead 끝 ==");
	}

	public void testFile()/* throws Exception */ {
//		File f1 = new File("D:/data1/aaa.txt");
//		f1.mkdirs();
		String path = "D:/data2/test";
		String filename = "aaa.txt";

		new File(path).mkdirs(); // 디렉토리 생성
		File f2 = new File(path, filename);
		// Unhandled exception type IOException
		FileWriter fw = null;
		try {
			f2.createNewFile(); // 파일생성

			fw = new FileWriter(f2); // File에 문자 형태 전송이 가능한 OutputStream (file과 java 프로그램의 통로)
			fw.write("한글 한"); // 전송하고자 하는 문자
			fw.flush(); // 전송한 문자가 담긴 버퍼(통로)를 깨끗하게 밀어내기
			return;
		} catch (IOException e) {
			System.out.println("file 생성 못함");
			e.printStackTrace();
		} finally { // return 전에 반드시 실행하고 넘어가는 문구
			try {
				if (fw != null)
					fw.close(); // 통로를 닫기
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
