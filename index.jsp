<!DOCTYPE html>
<html>
	<head>
		<title>Hey y'all!</title>
		<style type="text/css">
			@font-face {
			    font-family: UBCFont;
			    src: url("UBCFont.otf") format("opentype");
			}
			@font-face {
			    font-family: UBCFont;
			    font-weight: bold;
			    src: url("UBCFont_bold.otf") format("opentype");
			}

			@font-face {
			    font-family: Consolas;
			    src: url("Consolas.ttf") format("truetype");
			}

			html {
				padding: 0px;
				font-family: UBCFont;
			}

			body {
				padding: 0px;
				margin: 0px;
				background-color: #002145;
				color: white;
			}

			h1 {
				background-color: black;
				font-family: Consolas;
				color: #00FF00;
				padding: 20px;
				margin: 0px;
			}

			h3, h4 {
				font-family: Consolas;
			}

			p, small {
				padding: 20px;
			}

		</style>
		<link rel="shortcut icon" type="image/x-icon" href="rofl-emoji.png">
	</head>

	<body align="center">
		<h1>Heyy thereeee!! Welcome to Eugene's server! &#xe41e;</h1>
		<%@ page import="java.io.*" %>
		<%
			String publicIP = request.getRemoteHost();

			// ===== RECORDS PUBLIC IP ADDRESS TO COUNT UNIQUE PAGE VIEWS =====
			String currentDirectory = request.getRealPath("/"); // returns the tomcat directory
			File PublicIPAddresses = new File(currentDirectory + "Public-IP-Addresses.dat");
			FileReader fr = new FileReader(PublicIPAddresses);
			BufferedReader br = new BufferedReader(fr);

			String line;
			boolean visited = false;
			int views = 0;

			while ( ( (line = br.readLine()) != null) ) {
				if (line.equals(publicIP)) {
					visited = true;
				}
				views++;
			}

			// Record public IP address if user hasn't visited
			if (!visited) {
				Writer w = new BufferedWriter(new FileWriter(PublicIPAddresses, true));
				w.append(publicIP + "\r\n");
				w.close();
				views++;
			}
			
			out.println("<h3>I also know your public IP address: " + publicIP + "</h3>");
			out.println("<h4>Visitor count (including you, " + publicIP + "): " + views + " views</h4>");

			if (visited)
				out.println("<small>You've visited my server so I'm not counting you twice in my visitor count hehe</small>");
			out.println("<hr>");
		%>

		<p>Yeap, you're accessing a page that's stored on my personal computer. This is my default homepage and I gotta agree, there isn't much to see here (and yes, ik it's ugly). More like, <i>I haven't uploaded my projects yet...</i></p>
		<p>And to y'all computer nerds, here are some fun facts: my server runs on a <b>1TB HDD</b> (no SSD, sad I know haha), <b>AMD A9-9420 dual-core 3.00 GHz</b> processor, <b>8GB DDR4</b> RAM, and an <b>Ubuntu 18.04</b> slapped on top of an <b>ASUS X505BA</b> laptop that runs 24/7. Ain't much for a server but I have yet to see if <i>this</i> simple lappy takes my coding career somewhere only-God-knows-where ;)</p>
		<p>If you're seeing this page, my laptop is up and running; otherwise, blame it on the power outage or poor WiFi connection since I live by the mountains...</p>

		<hr>

		<small>Also: I think it'd be a sin if I don't recognize one of the awesomest, most chill yet engaging computer science profs out there, <b>Dr. Ramon Lawrence</b> of UBC Okanagan. Dr. Lawrence has lent his time by virtually helping me piece together my personal server, even when I wasn't taking his course and in the midst of COVID-19. Thanks a bunch, Dr. Lawrence, and gotta keep it real as always!</small> &#xe427;
	</body>

</html>
