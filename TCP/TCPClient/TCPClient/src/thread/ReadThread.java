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
		// recv (받는다) 
		BufferedReader reader 
			= new BufferedReader(new InputStreamReader(socket.getInputStream()));
		String packetStr;
		
			packetStr = reader.readLine();
			System.out.println("서버로부터 패킷:" + packetStr);
			
			Thread.sleep(100);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}
	
}
