package thread;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.List;

public class ServerThread extends Thread {

	Socket clientsocket;
	List<Socket> list;
	
	public ServerThread(Socket clientsocket, List<Socket> list) {
		this.clientsocket = clientsocket;	// 자기 자신의 묶음
		this.list = list;					// Socket의 묶음
	}

	@Override
	public void run() {		
		super.run();
		
		try {
			
			while(true) {
				
				BufferedReader reader 
					= new BufferedReader(new InputStreamReader(clientsocket.getInputStream()));
				String packetStr = reader.readLine();	// 실제 수신	
				
				System.out.println("클라이언트로부터 패킷:" + packetStr);
				
				// send (보내다)	
				PrintWriter writer = new PrintWriter(clientsocket.getOutputStream());
				writer.println(packetStr);		// 실제 송신
				writer.flush();	
				
			}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
