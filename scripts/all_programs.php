<?php session_start(); ?>
<html>		
	<head>
		<meta charset="utf-8"/>		
		<title>All Programs | Untitled Review Website</title>		
		<link href="style.css" rel="stylesheet" type="text/css">
		
		<div id=top>
			<a class="header-link" href="<?php echo "http://" . $_SERVER['HTTP_HOST']; ?>"><h1>Untitled Review Website</h1></a>
			<span class="separator"><b>|</b></span>
			<h2>The “leading” source for TV reviews, ratings, and awards</h2>
		</div>		
	</head>	
	<body>
		<div class="column-left">			
			<span class="content-header"><h3>All Programs</h3></span>
<?php	
$servername = "localhost:3306";
$username = "application";
$password = "applicationPASSWORD";
$dbname = "untitled_review_website";

$conn = new mysqli($servername, $username, $password, $dbname);
$error = false;
if ($conn->connect_error) {
    $error = true;
}
else {
	echo "<form class=\"tab\" action=\"" . $selfURL . "#broadcast\" method=\"post\">
				<p>
					<button class=\"tab\" type=\"submit\" name=\"tab\" value=\"1\">Serials</button>
					<button class=\"tab\" type=\"submit\" name=\"tab\" value=\"2\">Episodes</button>
					<button class=\"tab\" type=\"submit\" name=\"tab\" value=\"3\">Films</button>
				</p>
			</form>
			<div class=\"content\">
				<table align=\"center\" class=\"listing\">";
		
	$currentTab = 1;
	if (isset($_POST['tab'])){
		$currentTab = $_POST['tab'];
	} else {
		$_POST['tab'] = $currentTab;
	}
				
	switch ($currentTab) {
		default:
			$sql = "SELECT S.serialID, S.name, MIN(P.releaseDate) AS premiereDate
					FROM Serial S
					LEFT JOIN Episode E
					ON S.serialID = E.serialID
					LEFT JOIN Program P
					ON E.progID = P.progID
					GROUP BY S.serialID";
			break;
		case 2:
			$sql = "SELECT * 
					FROM AllReleases A
					WHERE EXISTS(SELECT E.progID
								FROM Episode E
								WHERE E.progID = A.programID)
					ORDER BY STR_TO_DATE(A.releaseDate, '%M %e, %Y') DESC, A.programID ASC";
			break;
		case 3:
			$sql = "SELECT * 
					FROM AllReleases A
					WHERE NOT EXISTS(SELECT E.progID
								FROM Episode E
								WHERE E.progID = A.programID)
					ORDER BY STR_TO_DATE(A.releaseDate, '%M %e, %Y') DESC, A.programID ASC";
			break;
	}
	
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		$missing = "<span class=\"no-rating\" >N/A</span>";
		
		if ($currentTab == 1) {
			echo "<tr><th>Serial Name</th><th>Premiere Date</th><th>Critic Rating</th><th>User Rating</th></tr>";
			while ($row = $result->fetch_assoc()) {
				$serialID = $row["serialID"];
				$premiereDate = isset($row["premiereDate"]) ? $row["premiereDate"] : $missing;
				$link = "http://" . $_SERVER['HTTP_HOST']. "/serial?id=" . $serialID;
				$showTitle = "<a href=\"" . $link . "\"><i>" . $row["name"] . "</i></a>";
				
				$innerSql = "SELECT AVG(R.rating) AS rating
							FROM (SELECT AVG(R2.rating) AS rating
									FROM Review R2
									WHERE EXISTS(SELECT reviewID
												FROM CriticReview CR
												WHERE CR.reviewID = R2.reviewID)
										AND R2.serialID = " . $serialID . "
									GROUP BY R2.seasonID) R";
				$innerResult = $conn->query($innerSql);
				$innerRow = $innerResult->fetch_assoc();	
				
				$currentCriticRating = ($innerRow["rating"] === null) ? $missing : (round($innerRow["rating"]) . "%");
				
				$innerSql = "SELECT AVG(R.rating) AS rating, COUNT(R.rating) AS count
							FROM Review R, Episode E
							WHERE EXISTS(SELECT reviewID
										FROM UserReview UR
										WHERE UR.reviewID = R.reviewID)
								AND R.progID = E.progID
								AND E.serialID = " . $serialID;
				$innerResult = $conn->query($innerSql);
				$innerRow = $innerResult->fetch_assoc();	
				
				$currentUserRating = ($innerRow["rating"] === null) ? $missing : (round($innerRow["rating"]) . "%");
				
				echo "<tr class=\"table-entry\"><td>" . $showDescriptor. " " . $showTitle. 
					 "</td><td align=\"center\">" . $premiereDate . "
					 </td><td align=\"center\">" . $currentCriticRating. 
					 "</td><td align=\"center\">" . $currentUserRating. "</td></tr>";
			}
		} else {
			echo "<tr><th>Program Name</th><th>Release Date</th><th>Critic Rating</th><th>User Rating</th></tr>";
			while ($row = $result->fetch_assoc()) {
				$link = "http://" . $_SERVER['HTTP_HOST']. "/program?id=" . $row["programID"];
				$showDescriptor = ($row["showName"] === null) ? "" : "<span class=\"show-descriptor\"><i>" . $row["showName"]. "</i>
					S" . $row["season"]. "E" . $row["episode"]. "</span>";
				$showTitle = "<a href=\"" . $link . "\">" . $row["programName"] . "</a>";
				$currentCriticRating = ($row["currentCriticRating"] === null) ? $missing : (round($row["currentCriticRating"]) . "%");
				$currentUserRating = ($row["currentUserRating"] === null) ? $missing : (round($row["currentUserRating"]) . "%");
				echo "<tr class=\"table-entry\"><td>" . $showDescriptor. " " . $showTitle. 
					 "</td><td align=\"center\">" . $row["releaseDate"]. "</td><td align=\"center\">" . $currentCriticRating. 
					 "</td><td align=\"center\">" . $currentUserRating. "</td></tr>";
			}
		}
	} else {
		$error = true;
	}
}
if ($error) {
	echo "<p>Program listing is not available...</p>";
}
$conn->close();
?>
				</table>
			</div>
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
			
	if (isset($_SESSION['is_critic']) && $_SESSION['is_critic']) {
		echo "<p>Search for a program to add a review to, or click 
			<a href=\"http://" . $_SERVER['HTTP_HOST'] . "/critic_management\">here</a>
			to view and update your reviews.</p>";
	}
	if(isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
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