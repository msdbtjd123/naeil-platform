package Encryption;
import java.io.*;
import java.util.HashMap;

public class monitorVncURL {
	public Iterator getVncURL(String user) {

		String line = "";
		String url = "";
		HashMap<String, String> VncURL = new HashMap<String, String>();

		Runtime rt = Runtime.getRuntime();
		Process ps = null;
		String command = String.format("python3 /naeil-package/monitor.py %s ", user);  // <---- 실행할 쉘명령어

		try{
			ps = rt.exec(command);
			BufferedReader br = new BufferedReader(new InputStreamReader(new SequenceInputStream(ps.getInputStream(), ps.getErrorStream())));

				while((line = br.readLine()) != null){
					VncURL.put(line.split(" ")[0], line.split(" ")[1]);
				}
			br.close();
		}
		catch(IOException ie){ie.printStackTrace();}
		catch(Exception e){e.printStackTrace();}
		return VncURL;
	}
}
