<?php ob_start(); session_start(); ?>
<html>
	<head>
		<meta charset="utf-8"/>		
		<title>Review Management | Untitled Review Website</title>		
		<link href="style.css" rel="stylesheet" type="text/css">
		
		<div id="top">
			<a class="header-link" href="<?php echo "http://" . $_SERVER['HTTP_HOST']; ?>"><h1>Untitled Review Website</h1></a>
			<span class="separator"><b>|</b></span>
			<h2>The “leading” source for TV reviews, ratings, and awards</h2>
		</div>
	</head>
	<body>
		<div class="column-left">
<?php
$servername = "localhost:3306";
$username = $_SESSION['username'];
$password = $_SESSION['password'];
$dbname = "untitled_review_website";

if (isset($_SESSION['is_critic']) && $_SESSION['is_critic']) {
	echo "<span class=\"content-header\"><h3>Review Management</h3></span>";
		  
	$error = false;
	$conn = new mysqli($servername, $username, $password, $dbname);

	if ($conn->connect_error) {
		$error = true;
	} else {
		$seasonSql = "SELECT R.reviewID, S.serialID, SE.name AS showName, S.seasonID, CR.title, R.rating
						FROM Review R 
						JOIN CriticReview CR ON R.reviewID = CR.reviewID 
						JOIN CriticWrites CW ON R.reviewID = CW.reviewID 
						JOIN Critic C ON CW.reviewerID = C.reviewerID
						JOIN Season S ON R.serialID = S.serialID AND R.seasonID = S.seasonID
						JOIN Serial SE ON S.serialID = SE.serialID
						LEFT JOIN Publishes PU
						ON PU.reviewID = R.reviewID
						WHERE C.dbUsername = '" . $_SESSION['username'] . "'
						GROUP BY R.reviewID
						ORDER BY date DESC";
		$seasonResult = $conn->query($seasonSql);
		
		$programSql = "SELECT R.reviewID, R.progID, ES.serialID, ES.name AS showName, 
						ES.seasonID, ES.epID, P.name AS programName, R.rating, CR.title
						FROM Review R 
						JOIN CriticReview CR ON R.reviewID = CR.reviewID 
						JOIN CriticWrites CW ON R.reviewID = CW.reviewID 
						JOIN Critic C ON CW.reviewerID = C.reviewerID
						JOIN Program P ON R.progID = P.progID
						LEFT JOIN (SELECT E.progID, E.serialID, E.seasonID, E.epID, S.name
							FROM Episode E
							LEFT JOIN Serial S
							ON S.serialID = E.serialID) ES
						ON ES.progID = P.progID
						LEFT JOIN Publishes PU
						ON PU.reviewID = R.reviewID
						WHERE C.dbUsername = '" . $_SESSION['username'] . "'
						GROUP BY R.reviewID
						ORDER BY date DESC";
		$programResult = $conn->query($programSql);
		
		$type = "Season";
		$result = $seasonResult;
		
		if ($seasonResult->num_rows > 0 || $programResult->num_rows > 0) {
			echo "<p>Here is a list of reviews that you have authored.</p>";
			
			for ($i=1; $i<=2; $i++) {
				if ($result->num_rows > 0) {
					echo "<span class=\"content-header\"><h3>" . $type . " Reviews</h3></span>
							<table align=\"center\" class=\"listing\">
								<tr>
									<th>Edit</th>
									<th>Program Name</th>
									<th>Authors</th>
									<th>Title</th>
									<th>Publications</th>
									<th>Rating</th>
								</tr>";
					while ($row = $result->fetch_assoc()) {
						$editLink = "http://" . $_SERVER['HTTP_HOST']. "/edit_review?id=" . $row["reviewID"];
						
						if ($row["programName"] == null) {
							$showLink = "http://" . $_SERVER['HTTP_HOST']. "/season?serialID=" . $row["serialID"] . "&seasonID=" . $row["seasonID"];
							$showDescriptor = "";
							$showTitle = "<a href=\"" . $showLink . "\"><b><i>" . $row["showName"] . "</i> S" . $row["seasonID"] . "</b></a>";
						} else {
							$showLink = "http://" . $_SERVER['HTTP_HOST']. "/program?id=" . $row["progID"];
							$showDescriptor = ($row["showName"] === null) ? "" : "<span class=\"show-descriptor\"><i>" . $row["showName"]. "</i> S" . 
								$row["seasonID"]. "E" . $row["epID"]. "</span><br/>";
							$showTitle = "<a href=\"" . $showLink . "\">" . $row["programName"] . "</a>";
						}
						
						echo "<tr class=\"table-entry\">
								<td align=\"center\" class=\"edit\">
									<a href=\"" . $editLink . "\">
										<button type=\"submit\">Edit</button>
									</a>
								</td>
								<td>" . $showDescriptor . $showTitle . "</td>
								<td>";
						
						$authorSql = "SELECT C.name
										FROM Critic C, CriticWrites CW
										WHERE C.reviewerID = CW.reviewerID
											AND CW.reviewID = " . $row["reviewID"];
						$authorResult = $conn->query($authorSql);
						
						while ($innerRow = $authorResult->fetch_assoc()) {
							echo "<p><a href=\"http://" . $_SERVER['HTTP_HOST'] . "/critic?id=" . $innerRow['reviewerID'] . "\">
									" . $innerRow['name'] . "</p>";
						}
								
						echo "</td>
								<td style=\"width:200px\">" . $row['title'] . "</td>
								<td align=\"center\">";
						
						$pubSql = "SELECT publicationName, date
									FROM Publishes
									WHERE reviewID = " . $row["reviewID"];
						$pubResult = $conn->query($pubSql);
						
						while ($innerRow = $pubResult->fetch_assoc()) {
							echo "<p><i><a href=\"http://" . $_SERVER['HTTP_HOST'] . "/publication?id=" . $innerRow['publicationName'] . "\">
								" . $innerRow['publicationName'] . "</a></i> on " . $innerRow['date'] . "</p>";
						}
						
						echo "</td>
								<td align=\"center\">" . $row['rating'] . "%</td>
							  </tr>";
					}
					echo "</table>";
				}
				
				$type = "Program";
				$result = $programResult;
			}
		} else {
			$error = true;
		}
	}
	
	if ($error) {
		echo "<p>Review listing is not available...</p>";
	}
	$conn->close();
} else {
	echo "<span class=\"content-header\"><h3>Access Denied</h3></span>
		  <p>You do not have access to this page. Try logging in, or go <a href=\"http://" . $_SERVER['HTTP_HOST'] . "\">home</a>.</p>";
}	
?>
		</div>
		<div class="column-right">
<?php
if (isset($_SESSION['logged_in']) && !isset($_POST['logout'])) {	
	$user_descriptor = "<b>" . $_SESSION['username'] . "</b>";
	
	if (isset($_SESSION['is_critic']) && $_SESSION['is_critic']) {
		$servername = "localhost:3306";
		$username = "application";
		$password = "applicationPASSWORD";
		$dbname = "untitled_review_website";

		$conn = new mysqli($servername, $username, $password, $dbname);
		if (!$conn->connect_error) {
			$sql = "SELECT name FROM Critic WHERE dbUsername = '" . $_SESSION['username'] . "'";
			$result = $conn->query($sql);

			if ($result->num_rows > 0) {
				$row = $result->fetch_assoc();
				$user_descriptor = "<b>" . $row['name'] . "</b> (" . $_SESSION['username'] . ")";
			}
		}
		$conn->close();
	}
	
	echo "<div id=\"account\">
			<span class=\"content-header\"><h3>Account</h3></span>
					<p>Welcome, " . $user_descriptor . "</b>!</p>";
			
	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<p>Click <a href=\"http://" . $_SERVER['HTTP_HOST'] . "/admin_management\">here</a>
			to add data to the review website database.</p>";		
	}
	
	echo "<form action=\"" . $_SERVER['PHP_SELF'] . "\" method=\"post\">
			<button type=\"submit\" name=\"logout\">Logout</button>
		  </form>
		  </div>";
} else { 
	if (isset($_POST['logout'])){
		unset($_SESSION['logged_in']);
		unset($_SESSION['username']);
		unset($_SESSION['password']);
		unset($_SESSION['is_critic']);
		unset($_SESSION['is_admin']);
		unset($_POST["logout"]);
		header('Refresh: 0');
	}
	
	$servername = "localhost:3306";
	$username = htmlspecialchars($_POST['username']);
	$password = htmlspecialchars($_POST['password']);
	$dbname = "untitled_review_website";
	
	echo "<div id=\"login-form\">
		  <span class=\"content-header\"><h3>Login</h3></span>
		  <form action=\"" . $_SERVER['PHP_SELF'] . "\" method=\"post\">
			<table class=\"plain\">
				<tr>
					<td>Username</td>
					<td><input type=\"text\" name=\"username\" 
						value=\"" . (isset($_POST['username']) ? $_POST['username'] : '') . "\"</td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type=\"password\" name=\"password\" 
						value=\"" . (isset($_POST['password']) ? $_POST['password'] : '') . "\"</td>
				</tr>
				<tr>
					<td><button type=\"submit\" name=\"login\">Login</button></td>
				</tr>
			</table>
		  </form>";

	if (isset($_POST['login'])) {
		if (!empty($username) && !empty($password)) {
			$verify_error = false;
			
			$conn = new mysqli($servername, $username, $password, $dbname);		
			if ($conn->connect_error) {
				$verify_error = true;
			} else {
				$_SESSION['logged_in'] = true;
				$_SESSION['username'] = $username;
				$_SESSION['password'] = $password;
			}		
			$conn->close();
			$conn = new mysqli($servername, "application", "applicationPASSWORD", $dbname);		
			if ($conn->connect_error) {
				$verify_error = true;
			} else {
				$sql = "SELECT FROM_USER FROM mysql.role_edges WHERE TO_USER = '" . $username . "'";
				$result = $conn->query($sql);
				
				$_SESSION['is_critic'] = false;
				$_SESSION['is_admin'] = false;		
				
				if ($result->num_rows > 0) {
					while ($row = $result->fetch_assoc()) {
						if ($row['FROM_USER'] == 'Critic'){
							$_SESSION['is_critic'] = true;
						} else if ($row['FROM_USER'] == 'Administrator'){
							$_SESSION['is_admin'] = true;
						}
					}
				} else {
					$verify_error = true;
				}
			}		
			$conn->close();
			
			if ($verify_error) {
				echo "<p>Invalid login, please try again...</p>";
			} else {
				header('Refresh: 0');
			}
		} else if (empty($username)) {
			echo "<p>Please enter a username.</p>";
		} else {
			echo "<p>Please enter a password.</p>";
		}
	}
}
?>
			  </div>
		</div>
	</body>
</html>