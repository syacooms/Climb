package thread;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;

public class ReadThread extends Thread {

	Socket socket;
	
	public ReadThread(Socket socket) {
		this.socket = socket;
	}

	

	@Override
	public void run() {
		// TODO Auto-generated method stub
		super.run();
		try {
			while(true) {
		// recv (�޴´�) 
		BufferedReader reader 
			= new BufferedReader(new InputStreamReader(socket.getInputStream()));
		String packetStr;
		
			packetStr = reader.readLine();
			System.out.println("�����κ��� ��Ŷ:" + packetStr);
			
			Thread.sleep(100);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}
	
}
