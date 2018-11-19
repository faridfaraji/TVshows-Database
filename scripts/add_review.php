<?php ob_start(); session_start(); ?>
<html>
	<head>
		<meta charset="utf-8"/>		
		<title>Add Review | Untitled Review Website</title>		
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

if (isset($_GET["progID"])) {
	$progID = htmlspecialchars($_GET["progID"]);
	$selfURL = $_SERVER['PHP_SELF'] . "?progID=" . $progID;
	$error = false;
} else if (isset($_GET["serialID"]) * isset($_GET["seasonID"])) {
	$serialID = htmlspecialchars($_GET["serialID"]);
	$seasonID = htmlspecialchars($_GET["seasonID"]);
	$selfURL = $_SERVER['PHP_SELF'] . "?serialID=" . $serialID . "&seasonID=" . $seasonID;
	$error = false;
} else {
	$error = true;
}

if (isset($_SESSION['is_critic'])) {
	echo "<span class=\"content-header\"><h3>Add Review</h3></span>";
	
	if ($error) {
		echo "<p>Unable to create a review... please check for typos in the URL.</p>";
	} else {
		$conn = new mysqli($servername, $username, $password, $dbname);

		if ($conn->connect_error) {
			$error = true;
		}
		else {
			if (isset($_POST['submit'])) {
				$rating = htmlspecialchars($_POST['rating']);
				$title = htmlspecialchars($_POST['title']);
				$textExcerpt = htmlspecialchars($_POST['textExcerpt']);
				
				if (strlen($title) > 250) {
					$review_error = "<p>Title must be 250 characters or less.</p>";
				} else if (strlen($textExcerpt) > 1000) {
					$review_error = "<p>Text excerpt must be 1000 characters or less.</p>";				
				} else if (intval($rating) > 100 || intval($rating) < 0) {
					$review_error = "<p>Rating must be between 0 and 100.</p>";
				} else {
					if (isset($progID)) {
						$sql = "INSERT INTO Review (rating, progID) VALUES
								(" . $rating . ", " . $progID . ")";
					} else {
						$sql = "INSERT INTO Review (rating, serialID, seasonID) VALUES
								(" . $rating . ", " . $serialID . ", " . $seasonID . ")";							
					}
					$conn->query($sql);
					$sql = "SELECT LAST_INSERT_ID()";
					$result = $conn->query($sql);
					
					if ($result->num_rows > 0) {
						$row = $result->fetch_assoc();
						$reviewID = $row['LAST_INSERT_ID()'];
						
						$sql = "INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
										(" . $reviewID . ", \"" . $title . "\", \"" . $textExcerpt . "\");";	
						$conn->query($sql);
						
						$sql = "SELECT reviewerID
								FROM Critic
								WHERE dbUsername = \"" . $username . "\"";
						$result = $conn->query($sql);
						
						if ($result->num_rows > 0) {
							$row = $result->fetch_assoc();
							$reviewerID = $row['reviewerID'];
						
							$sql = "INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
									(" . $reviewerID . ", " . $reviewID . ");";	
							$conn->query($sql);								
					
							$updated = true;						
						} else {
							$review_error = "<p>You are not registered properly in the database. Please contact an administrator.</p>";
						}
					} else {
						$review_error = "<p>The review could not be added. Please try again later.</p>";
					}
				}
				unset($_POST['submit']);
			}
			
			if (isset($progID)) {				
				$sql = "SELECT P.progID, ES.serialID, ES.name AS showName, 
							ES.seasonID, IF(P.progID IS NULL, null, ES.epID) AS epID, 
							P.name AS programName
						FROM Program P
						LEFT JOIN (SELECT E.progID, E.serialID, E.seasonID, E.epID, S.name
							FROM Episode E
							LEFT JOIN Serial S
							ON S.serialID = E.serialID) ES
						ON ES.progID = P.progID
						WHERE P.progID = " . $progID;
			} else {
				$sql = "SELECT S.serialID, SE.name AS programName, S.seasonID
						FROM Season S, Serial SE
						WHERE S.serialID = SE.serialID
							AND S.serialID = " . $serialID . "
							AND S.seasonID = " . $seasonID;
			}
			$result = $conn->query($sql);
			
			if ($result->num_rows > 0) {
				$row = $result->fetch_assoc();
				
				echo "<form action=\"" . $selfURL . "\" method=\"post\">";
				
				echo "<table class=\"plain\">
							<tr>";
							
				$title = isset($_POST['title']) ? $_POST['title'] : $row['title'];
				$rating = isset($_POST['rating']) ? $_POST['rating'] : $row['rating'];
				$textExcerpt = isset($_POST['textExcerpt']) ? $_POST['textExcerpt'] : $row['textExcerpt'];
				
				if (!empty($row['showName']) && !empty($row['seasonID'])){
					echo "<th>Serial Name</th><td><i>" . $row['showName'] . "</i></td>";
					echo "<th>Season</th><td>" . $row['seasonID'] . "</td>";
					
					if (!empty($row['epID'])) {
						echo "<th>Episode</th><td>" . $row['epID'] . "</td>";
					}
				}
				
				if (!empty($row['epID'])) {
					echo "<th>Program Name</th><td>" . $row['programName'] . "</td></tr>";
				} else {
					echo "</tr>";
				}
				
				echo "<tr>
						<th>Review Title</th><td colspan=\"4\"><input type=\"text\" size=\"50\" name=\"title\" required value=\"" . $title . "\"></td><td>
						<th>Rating</th><td><input type=\"text\" size=\"5\" name=\"rating\" required value=\"" . $rating . "\"> %</td>
					</tr>
					<tr><th>Text Excerpt</th><td colspan=\"4\"><i>Include a summarizing quote from your review.</i></td></tr>
					<tr><td colspan=\"10\"><textarea rows=\"5\" cols=\"85\" name=\"textExcerpt\">" . $textExcerpt . "</textarea></td></tr>
				</table>
				<button type=\"submit\" name=\"submit\">Submit</button>
				</form>";
				  
				if (isset($review_error)) {
					echo $review_error;
				}				
			} else {
				echo "yes";
				$error = true;
			}
		}
			
		if (isset($updated) && $updated && isset($reviewID)) {
			unset($updated);
			unset($_POST);
			header('Location: /edit_review?id=' . $reviewID);
		}
		
		if ($error) {
			echo "<p>Review information is not available...</p>";
		}
		
		$conn->close();
	}
} else {
	echo "<span class=\"content-header\"><h3>Access Denied</h3></span>
		  <p>You do not have access to this page. Try logging in, or go <a href=\"http://" . $_SERVER['HTTP_HOST'] . "\">home</a>.</p>";
}	
?>
		</div>
		<div class="column-right">
<?php
if (isset($_GET["progID"])) {
	$progID = htmlspecialchars($_GET["progID"]);
	$selfURL = $_SERVER['PHP_SELF'] . "?progID=" . $progID;
} else if (isset($_GET["serialID"]) * isset($_GET["seasonID"])) {
	$serialID = htmlspecialchars($_GET["serialID"]);
	$seasonID = htmlspecialchars($_GET["seasonID"]);
	$selfURL = $_SERVER['PHP_SELF'] . "?serialID=" . $serialID . "&seasonID=" . $seasonID;
} else {
	$selfURL = $_SERVER['PHP_SELF'];
}

if (!$_SESSION['refreshed']){
	$_SESSION['refreshed'] = true;
	header('Refresh: 0');	
}

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
	
	echo "<form action=\"" . $selfURL . "\" method=\"post\">
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
		$_SESSION['refreshed'] = false;
		header('Refresh: 0');
	}
	
	$servername = "localhost:3306";
	$username = htmlspecialchars($_POST['username']);
	$password = htmlspecialchars($_POST['password']);
	$dbname = "untitled_review_website";
	
	echo "<div id=\"login-form\">
		  <span class=\"content-header\"><h3>Login</h3></span>
		  <form action=\"" . $selfURL . "\" method=\"post\">
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
				header('Location: /critic_management');
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